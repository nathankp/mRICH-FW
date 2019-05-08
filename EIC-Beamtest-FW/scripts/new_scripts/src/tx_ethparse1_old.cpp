//compile independently with: g++ -o parseTarget6Data parseTarget6Data.cxx `root-config --cflags --glibs`
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>

#include "TROOT.h"
#include "TApplication.h"
#include <TFile.h>
#include "TTree.h"
#include "TSystem.h"	
#include "TString.h"
#include "TObjArray.h"

#define bitn(x,n) ((x>>n)&1)
#define set_bitn(x,n,v) x=(x&(~(1<<n)) | (v&1)<<n)

using namespace std;

void initializeRootTree();
void processBuffer(unsigned char*buffer_uint, int sizeinbytes);
void parseDataPacket(unsigned int *buffer_uint, int bufPos, int sizeInUint32);
void resetWaveformArray();
void saveWaveformArrayToTree();
TString getOutputFileName(std::string inputFileName);

//array to store motherboard event waveform data, very crude
const int numDC = 10;
const int numCHAN = 16;//only channel 16 is needed- which is connected to the signal gen
int ActiveChs[numCHAN]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
const int numADDR = 512;
const int numSAMP = 32*4;
int evtSa[128][16];
int evtCT[2][16];


class MBevent
{
public:
	unsigned int no;//event number
	signed int samples[numSAMP];
	bool isValid;
	unsigned int dc,ch,digwin,wrwin;//daughter card, channel,...
	unsigned int t,c;//time and charge
	void Copy(MBevent e) {
		for(int i=0;i<numSAMP;i++) samples[i]=e.samples[i];
		no=e.no;isValid=e.isValid;dc=e.dc;ch=e.ch;digwin=e.digwin;wrwin=e.wrwin;
		t=e.t;c=e.c;
	}
};


//bool waveformValid[numDC][numCHAN][numADDR]; //DC, CHANNEL, ADDRESS
//signed int waveformArray[numDC][numCHAN][numADDR][numSAMP]; //DC, CHANNEL, ADDRESS, SAMPLE

int currentEventNumber;

//Define output tree
#define POINTS_PER_WAVEFORM    32*4
#define MEMORY_DEPTH           512
#define NASICS                 10
#define NCHS                   numCHAN //only 1 channel is being parsed
const Int_t MaxROI(400);
TTree *tree;
Int_t eventNum;
Int_t nROI;
UInt_t scrodId[MaxROI];
Int_t asicNum[MaxROI];
Int_t asicCh[MaxROI];
Int_t windowNum[MaxROI];
Int_t WRwinNum[MaxROI];
Int_t Time[MaxROI];
Int_t samples[MaxROI][POINTS_PER_WAVEFORM];
bool DecodeTPGflag;

MBevent evts[MaxROI];



//global TApplication object declared here for simplicity
TApplication *theApp;
FILE*of;

//void parseTarget6Data(std::string inputFileName){
int main(int argc, char* argv[]){
	//check # arguments
	if (argc != 3 && argc != 4 ){
    		std::cout << "wrong number of arguments: usage ./tx_parse1 <input filename>  <0=parse all, 1= dont parse waveform> [options: -TPG]" << std::endl;
    		return 0;
  	}

	DecodeTPGflag=false;

	if (argc==4)
	{
		if (0==strcmp(argv[3],"-TPG"))
		{
			DecodeTPGflag=true;

		}
		else
		{
    			std::cout << "wrong number of arguments: usage ./tx_parse1 <input filename>  <0=parse all, 1= dont parse waveform> [options: -TPG]" << std::endl;
	    		return 0;
		}

	}

	//define input file and parsing
	std::string inputFileName = argv[1];
	std::cout << " inputFileName " << inputFileName << std::endl;
	ifstream infile;
	infile.open(argv[1], std::ifstream::in | std::ifstream::binary);

    if (infile.fail()) {
		std::cout << "Error opening input file, exiting" << std::endl;
		return 0;
	}

	char ofname[200];
//	sprintf(ofname,"/home/isar/workspace/usbInterface/outdir/sweeps/parsed/%s.txt",argv[1]);
	sprintf(ofname,"%s.txt",argv[1]);
	of=fopen(ofname,"wt");


	//define application object
	theApp = new TApplication("App", &argc, argv);

    	// get length of file:
    	infile.seekg (0, infile.end);
    	int size_in_bytes = infile.tellg();
    	infile.seekg (0, infile.beg);

	//define buffer
    	  char* buffer = new   char [size_in_bytes];
		  unsigned char* Ubuff=(unsigned char*)buffer;
		  
    	std::cout << "Reading " << size_in_bytes << " bytes... ";

    	// read data as a block:
    	infile.read (buffer,size_in_bytes);
    	if (infile) {
      		std::cout << "all characters read successfully." << std::endl;
    	} else {
      		std::cout << "error: only " << infile.gcount() << " could be read" << std::endl;
	}
    	infile.close();

	//define output file name
	TString outputFileName(getOutputFileName(inputFileName));



	std::cout << " outputFileName " << outputFileName << std::endl;
	TFile g(outputFileName , "RECREATE");

	//initialize tree to store trigger bit data
	initializeRootTree();

	//intialize waveform array
	
	//process file buffer
	
	processBuffer(Ubuff,size_in_bytes);
	
	//write tree to file
	g.cd();
	tree->Write();


        //Write out the settings used in creating the data tree:
	Int_t numberOfAsics(NASICS);
	Int_t numberOfAsicChannels(NCHS);
	Int_t numberOfWindows(MEMORY_DEPTH);
	Int_t numberOfSamples(POINTS_PER_WAVEFORM);
        TTree* MetaDataTree = new TTree("MetaData", "metadata");  
        MetaDataTree->Branch("nAsics", &numberOfAsics, "nAsics/I");
        MetaDataTree->Branch("nAsicChannels", &numberOfAsicChannels, "nAsicChannels/I");
        MetaDataTree->Branch("nWindows", &numberOfWindows, "nWindows/I");
        MetaDataTree->Branch("nSamples", &numberOfSamples, "nSamples/I");
        MetaDataTree->Fill();
        MetaDataTree->Write();  





	g.Close();
	return 0;
}

//initialize tree to store trigger bit data
void initializeRootTree(){
	tree = new TTree("T","TARGET6_Data");
	tree->Branch("eventNum", &eventNum, "eventNum/I");
	tree->Branch("nROI", &nROI, "nROI/I");
	tree->Branch("scrodId", &scrodId, "scrodId[nROI]/I");
	tree->Branch("asicNum", &asicNum, "asicNum[nROI]/I");
	tree->Branch("asicCh", &asicCh, "asicCh[nROI]/I");
	tree->Branch("windowNum", &windowNum, "windowNum[nROI]/I");
        //set array size to store in root file:
        TString samplesBranchLeafList("samples[nROI][");
	samplesBranchLeafList += POINTS_PER_WAVEFORM;
	samplesBranchLeafList += "]/I";
	tree->Branch("samples", &samples, samplesBranchLeafList);
	return;
}

void processBuffer( unsigned char* buff,int size)
{

	//std::cout << std::hex << buffer_uint[bufPos] << std::dec;
	//std::cout << std::endl;

	static int curEvts=0;
	unsigned int addrNum = 0;
	unsigned int wraddrNum = 0;
	unsigned int asicNum = 0;
	unsigned int sampNum = 0;
	unsigned int dataWord = 0;
	unsigned int winNum=0;
	unsigned int packetEventNum = 0;
	unsigned int buffer_uint[65536] ;

	//check for packet header-- add the syncing text here

	if (size<100) return;
	int k=0;
	while (k<size-16)
	{
		if ((buff[k]==0xFE && buff[k+4]==0xCF && buff[k+8]==0xBD)) //we do have a package
		{		
				cout<<k<<",";

		int k0=0;
		int kt=0;
		while ((k<size & k0>0 & !(buff[k]==0xFE && buff[k+4]==0xCF && buff[k+8]==0xBD)) | k0==0)
		{
			if (kt%4==0)
			{
				buffer_uint[k0]=((unsigned int)buff[k+0])<<24 | ((unsigned int)buff[k+1])<<16 | ((unsigned int)buff[k+2])<<8 | ((unsigned int)buff[k+3]);
//				std::cout << "Sa " << k0 << ":" << std::hex << buffer_uint[k0] << std::dec << std::endl;
			k0++;
			}
			kt++;
			k++;
		}
		int buflen=k0;
		cout<<"\nbuflen="<<buflen<<"\n";
//		cout<<"\nklen="<<k<<"\n";

	//std::cout << "\nHeader Val:" << std::hex << buffer_uint[+offset] << std::dec << std::endl;

							
	//at this point should have window data - loop over window data until encounter end of window packet
	int count = 0,chanNum=0, offset=0,offset2=1;

	if( (0xFF000000 & buffer_uint[+offset]) == 0xFE000000 ){
						std::cout << "\nHeader Val:" << std::hex << buffer_uint[+offset] << std::dec << std::endl;
						addrNum = ( (buffer_uint[+offset] ) & 0x000001FF );
						wraddrNum = ( (buffer_uint[+offset] >> 9) & 0x000001FF );
						asicNum = ( (buffer_uint[+offset] >> 20) & 0x0000000F )-1;
						std::cout << "\nDig Address, Wr addr, Asic: ";
						std::cout << "\t" << addrNum;
						std::cout << "\t" << wraddrNum;
						std::cout << "\t" << asicNum;
						//std::cout << "\t" << sampNum;
						std::cout << std::endl;
	}
	
	if( (0xFF000000 & buffer_uint[+1]) == 0xCF000000 ){
						std::cout << "\nEVTs Val:" << std::hex << buffer_uint[+1] << std::dec << std::endl;
						curEvts = ( (buffer_uint[+1] ) & 0x00FFFFFF );
						//std::cout << "\t" << sampNum;
//						std::cout << std::endl;
	}
	
	//std::cout << "\nBuff Val:" << std::hex << buffer_uint[+count+offset2] << std::dec << std::endl;
//sleep(2);
//	while( (buffer_uint[+offset2+count]& 0xFF000000)==0xBD000000  || (buffer_uint[+offset2+count]& 0xFF000000)==0xCB000000){
	while( count<buflen){
		if (count<4 ) std::cout << std::hex << buffer_uint[offset2+count] << std::dec<<" ";
		
		//Check for sample packet header
		if ((buffer_uint[+offset2+count]& 0xFF000000)==0xBD000000)
		{
			chanNum = (buffer_uint[+offset2+count]>>19) & 0x0000000F;
			winNum =  (buffer_uint[+offset2+count]>>17) & 0x00000003 ;
			sampNum = (buffer_uint[+offset2+count]>>12) & 0x0000001F;
			int BDval=(buffer_uint[+offset2+count]>>24) & 0x000000FF;
/*			std::cout << "\t" << count;
			std::cout << ", " << asicNum;
			std::cout << ", " << chanNum;
			std::cout << ", " << addrNum;
			std::cout << ", " << sampNum;
			std::cout << ", " << (buffer_uint[+offset2+count] & 0x00000FFF);
			//std::cout << std::endl;
*/
/*			mbe[winNum].digwin=addrNum+winNum;
			mbe[winNum].wrwin=wraddrNum;
			mbe[winNum].dc=asicNum;
*/
		//check if errors
		if( addrNum >= numADDR  || asicNum > numDC || sampNum >= numSAMP || BDval!=0xBD){
			std::cout << "INVALID SAMPLE INFO, SKIPPING ";
			std::cout << "\t" << count;
			std::cout << "\t" << addrNum;
			std::cout << "\t" << asicNum;
			std::cout << "\t" << sampNum;
			std::cout << "\t" << BDval;
			std::cout << std::endl;
			count++;
			continue;
		}
		
		//check for sample packet data
//if (chanNum==15)//only save ch 15 which is hooked to the scope
{
int sa_val=(buffer_uint[+offset2+count]) & 0x00000FFF;
///int v2=0;for (int c=0;c<12;c++) v2=(v2<<1) | ((sa_val>>c) & 1);//reverse the bits if needed- no more

			//at this point have sample bit word, save to waveform array
//				mbe[winNum].samples[sampNum]=sa_val;
				evtSa[winNum*32+sampNum][chanNum]=sa_val;
				//waveformValid[asicNum][chanNum][addrNum] = true;
				//waveformArray[asicNum][chanNum][addrNum][sampNum] =sa_val;//(buffer_uint[+offset+count]) & 0x00000FFF;
}
	}
		if ((buffer_uint[+offset2+count]& 0xFF000000)==0xCB000000)
		{
			int k=(0x00F00000 & buffer_uint[+offset2+count])>>20;
			//	std::cout << "C&T Val:" << std::hex << eventdatabuf[j] << std::dec << std::endl;
				evtCT[0][k]=buffer_uint[+offset2+count]>>12 & 0x7F;
				evtCT[1][k]=buffer_uint[+offset2+count] & 0x0FFF;


		}


		//increment position
		count++;
	}

	if (count>2000){

		/*dump to text file for matlab laoding*/
		for (int i=0;i<128;i++)
		{
			fprintf(of,"\n%d,%d,%d,%d",curEvts,i,asicNum,wraddrNum);
			for (int c=0;c<16;c++)
			{
				fprintf(of,",%d",evtSa[i][c]);
			}
		}


		fprintf(of,"\n%d,%d,%d,%d",curEvts,128,asicNum,addrNum);
		for (int c=0;c<16;c++) fprintf(of,",%d",evtCT[0][c]);
		fprintf(of,"\n%d,%d,%d,%d",curEvts,129,asicNum,addrNum);
		for (int c=0;c<16;c++) fprintf(of,",%d",evtCT[1][c]);


/*		for (int i=0;i<4;i++)
		{
			mbe[i].isValid=true;
			mbe[i].no=currentEventNumber;
			//evts[curEvts+i].Copy(mbe[i]);
		}*/
		//evts[curEvts].Copy(mbe[3]);

		//curEvts++;
	}
		else 		k=k+1;

		}

			
		
	}	

return;	
	
	
	
	
	
}




TString getOutputFileName(std::string inputFileName) {

        TString fileName(inputFileName);
        TObjArray* strings = fileName.Tokenize("/");
        TObjString* objstring = (TObjString*) strings->At(strings->GetLast());
        TString string(objstring->GetString());
        TString outputFileName("output_");
        outputFileName += string;
        outputFileName.ReplaceAll(".dat", ".root");
        outputFileName.ReplaceAll(".rawdata", ".root");
	strings->SetOwner(kTRUE);
	delete strings;
	return outputFileName;
}
