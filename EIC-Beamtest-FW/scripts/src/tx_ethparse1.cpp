//compile independently with: g++ -o bin/tx_ethparse1 src/tx_ethparse1.cpp `root-config --cflags --glibs`
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
//#define tbitval(x,n) ((x[n>>2]>>(3-(n&3))) & 1)
#define tbitval(x,n) ((x[n>>2]>>(n&3)) & 1)

using namespace std;

void initializeRootTree();
void processBuffer(unsigned char*buffer_uint, int sizeinbytes, int DumpWaveform);
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

//int sa_offset=600; // for positive going pulse
//int sa_offset=3400; // for negative going pulse 
int sa_offset=0;

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
FILE*outfile[10];// junk: for having separate files for 10 asics! makes processing slightly easier
FILE*outfileCH;// junk: for having separate files for 10 asics! makes processing slightly easier

//void parseTarget6Data(std::string inputFileName){
int main(int argc, char* argv[]){
	//check # arguments
	if (argc != 3 && argc != 4 ){
    		std::cout << "wrong number of arguments: usage ./tx_parse1 <input filename>  <0=parse all, 1= dont parse waveform, 2= dont parse waveforms, but create 1 file per asic> [options: -TPG]" << std::endl;
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

	int DumpWaveform=atoi(argv[2]);
	
	
    if (infile.fail()) {
		std::cout << "Error opening input file, exiting" << std::endl;
		return 0;
	}

	char ofname[10][200];
	char ofnameCH[200];
//	sprintf(ofname,"/home/isar/workspace/usbInterface/outdir/sweeps/parsed/%s.txt",argv[1]);

	if (DumpWaveform==2)
	{
		for (int i=0;i<10;i++)
		{
			sprintf(ofname[i],"%s_asic_%d.txt",argv[1],i);
			outfile[i]=fopen(ofname[i],"wt");
			cout<<outfile[i]<<endl;
		}
	}
	else
	{
		sprintf(ofname[0],"%s_asic_all.txt",argv[1]);
		outfile[0]=fopen(ofname[0],"wt");
	}
	
	sprintf(ofnameCH,"%s_CH14.txt",argv[1]);
	outfileCH=fopen(ofnameCH,"wt");


	//define application object
//	theApp = new TApplication("App", &argc, argv);

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
//	TString outputFileName(getOutputFileName(inputFileName));
	
	//process file buffer
	
	processBuffer(Ubuff,size_in_bytes,DumpWaveform);
	
	if (DumpWaveform==2)
	{
		for (int i=0;i<10;i++)
		{
			fclose(outfile[i]);
		}
	}
	else
	{
		fclose(outfile[0]);
	}
	
	fclose(outfileCH);


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

void processBuffer( unsigned char* buff,int size, int DumpWaveform)
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
	unsigned int buffer_uint16[65536];
	unsigned int TrigCH=0;
	//check for packet header-- add the syncing text here

	if (size<100) return;
	int k=0,ke=0;
	while (k<size-16)
	{
		while (
			k<size-16 && 
			(	!((buff[k]=='w' && buff[k+1]=='a' && buff[k+2]=='v' && buff[k+3]=='e')) &&
				!((buff[k]=='c' && buff[k+1]=='h' && buff[k+2]=='r' && buff[k+3]=='g'))	)
			) 
				k++;
			k+=4;

		ke=k;//find start of next package
		while (
			ke<size-16 && 
			(	!((buff[ke]=='w' && buff[ke+1]=='a' && buff[ke+2]=='v' && buff[ke+3]=='e')) &&
				!((buff[ke]=='c' && buff[ke+1]=='h' && buff[ke+2]=='r' && buff[ke+3]=='g')) )
			
			) ke++;
//	cout<<"Start="<<k<<"  End="<<ke<<endl;
		

//		if ((buff[k]=='w' && buff[k+1]=='a' && buff[k+2]=='v' && buff[k+3]=='e')) //"wave": then this is the new type of packet that has the concentrator output built into it

		if ((buff[k]==0xFE && buff[k+4]==0xCF && (buff[k+8]&0xF0)==0xD0)) //we do have a package
		{		
//				cout<<"0xFE detected at: "<<k<<endl;

		int k0=0;
		int kt=0;//now copy the bytes into Uint32 and Uint16 buffers
		while ((k<ke & !(buff[k]==0xFA && buff[k+1]==0xCE && buff[k+2]==0xFA && buff[k+3]==0xCE)))
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
		int wbuflen=k0;//waveform buffer length in uint 32 format
//		cout<<"\nWave Buflen="<<wbuflen<<"\n";
		const int n_ca_max=32;
		int n_ca=0;
		unsigned int CA_val[n_ca_max];
		unsigned int CA_raw[n_ca_max];
		unsigned int CA_raw2[n_ca_max];
		unsigned int CA_win[n_ca_max];
		unsigned int CA_tbs[n_ca_max][4];
		for (int q=0;q<n_ca_max;q++) 
		{
			CA_val[q]=0;
			CA_raw[q]=0;
			CA_raw2[q]=0;
			CA_win[q]=0;
			CA_tbs[q][0]=0;
			CA_tbs[q][1]=0;
			CA_tbs[q][2]=0;
			CA_tbs[q][3]=0;
		}
//		cout<<"\nklen="<<k<<"\n";

	//std::cout << "\nHeader Val:" << std::hex << buffer_uint[+offset] << std::dec << std::endl;

							
	//at this point should have window data - loop over window data until encounter end of window packet
	int count = 0,chanNum=0, offset=0,offset2=3,Wctime=0;

			wraddrNum = ( (buffer_uint[0] >> 9) & 0x000001FF );//window count from sampling script at time of readout
			asicNum   = ( (buffer_uint[0] >> 20) & 0x0000000F );//current asic number
			curEvts   = ( (buffer_uint[1]) & 0x00FFFFFF );//current readout event
			addrNum   = ( (buffer_uint[2] >>8) & 0x000001FF );//readout start address
			TrigCH    = ( (buffer_uint[2]) & 0x000000FF );//channel that triggered event

//	if( (0xFF000000 & buffer_uint[+offset]) == 0xFE000000 ){
//						std::cout << "\nHeader Val:" << std::hex << buffer_uint[+offset] << std::dec << std::endl;
//						std::cout << "," << std::hex << buffer_uint[+offset] << std::dec;
//						addrNum = ( (buffer_uint[+offset] ) & 0x000001FF );
//						wraddrNum = ( (buffer_uint[+offset] >> 9) & 0x000001FF );
//						asicNum = ( (buffer_uint[+offset] >> 20) & 0x0000000F )-1;
/*						std::cout << "\nDig Address, Wr addr, Asic: ";
						std::cout << "\t" << addrNum;
						std::cout << "\t" << wraddrNum;
						std::cout << "\t" << asicNum;
						//std::cout << "\t" << sampNum;
						std::cout << std::endl;*/
//	}
	
//	if( (0xFF000000 & buffer_uint[+1]) == 0xCF000000 ){
//						std::cout << "\nEVTs Val:" << std::hex << buffer_uint[+1] << std::dec << std::endl;
//						std::cout << "," << std::hex << buffer_uint[+1] << std::dec;
//						curEvts = ( (buffer_uint[+1] ) & 0x00FFFFFF );
						//std::cout << "\t" << sampNum;
//						std::cout << std::endl;
//	}
//						std::cout << "\nWaveform C-time Val:" << std::hex << buffer_uint[+2] << std::dec << std::endl;
//						Wctime = ( (buffer_uint[+2] ) & 0x0FFFFFFF );
	
//	std::cout << "\nBuff Val:" << std::hex << buffer_uint[+count+offset2] << std::dec << std::endl;
//sleep(2);
//	while( (buffer_uint[+offset2+count]& 0xFF000000)==0xBD000000  || (buffer_uint[+offset2+count]& 0xFF000000)==0xCB000000){
	while( count<wbuflen){
//		if (count<4 ) std::cout << std::hex << buffer_uint[offset2+count] << std::dec<<" ";
		
		//Check for samples
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
//int v2=0;for (int c=0;c<12;c++) v2=(v2<<1) | ((sa_val>>c) & 1);//reverse the bits if needed- no more

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

		if ((buffer_uint[+offset2+count]& 0xFF000000)==0xCA000000)//decode trigger bits
		{
			if ((buffer_uint[+offset2+count+1]& 0xFF000000)==0xC7000000)
			{
				if (n_ca<n_ca_max){
					CA_raw [n_ca]= buffer_uint[+offset2+count  ] ;
					CA_raw2[n_ca]= buffer_uint[+offset2+count+1] ;
					CA_val[n_ca] = buffer_uint[+offset2+count+1] & 0x000FFFFF;
					CA_tbs[n_ca][0] = (buffer_uint[+offset2+count+1]>>0 ) & 0x0000001F;
					CA_tbs[n_ca][1] = (buffer_uint[+offset2+count+1]>>5 ) & 0x0000001F;
					CA_tbs[n_ca][2] = (buffer_uint[+offset2+count+1]>>10) & 0x0000001F;
					CA_tbs[n_ca][3] = (buffer_uint[+offset2+count+1]>>15) & 0x0000001F;
					CA_win[n_ca] =(buffer_uint[+offset2+count  ] & 0x0001FF00) >> 8;
					n_ca++;
			}
			}
		
		}


		//increment position
		count++;
	}

//	if (count>2000){
	if (count>5){

	//WAVEFORM:
		/*dump to text file for matlab laoding*/
	int fidx=0;
	int CurrWin=0;
	if (DumpWaveform==2) fidx=asicNum;
	
	if (DumpWaveform!=1 && DumpWaveform!=2)
	{
		for (int i=0;i<128;i++){
			CurrWin = addrNum+i/32;
			fprintf(outfile[fidx],"\n%u\t%u\t%i",asicNum,CurrWin,i);
			for (int c=0;c<16;c++){
				if (i == 127 and c == 15){
					fprintf(outfile[fidx],"\t%d",+evtSa[i-1][c]);
				}
				else{
					fprintf(outfile[fidx],"\t%d",+evtSa[i][c]);
				}
			}
		}
		fprintf(outfile[fidx],"\n%u\t%u\t128\t%u\t%u\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99",asicNum,CurrWin,TrigCH,addrNum);
	}
	
	// PEAKS and TDC
		fprintf(outfile[fidx],"\n%d\t%d\t%d\t%d\t%d",curEvts,Wctime,128,asicNum,addrNum);
		for (int c=0;c<16;c++) fprintf(outfile[fidx],"\t%d",evtCT[0][c]);
		fprintf(outfile[fidx],"\n%d\t%d\t%d\t%d\t%d",curEvts,Wctime,129,asicNum,addrNum);
		for (int c=0;c<15;c++) fprintf(outfile[fidx],"\t%d",+evtCT[1][c]-sa_offset*1);
		fprintf(outfile[fidx],"\t%d",+evtCT[1][15]-2048*1);

	// TRIGGER HISTORY
		int tbits[16][2048];// recounstruct the whole ASIC memory for 15 channels
		for (int q1=0;q1<16;q1++) for (int q2=0;q2<2048;q2++) tbits[q1][q2]=0;
		for (int c=0;c<n_ca;c++)
		{
			for (int e=0;e<4;e++)
			{
				int et=e;
				int tbs=(CA_tbs[c][e]&0b01111);
				int tb5=((CA_tbs[c][e])>>4)&0b1;
				int tb4=((CA_tbs[c][e])>>3)&0b1;
				int tb3=((CA_tbs[c][e])>>2)&0b1;
				int tb2=((CA_tbs[c][e])>>1)&0b1;
				int tb1=((CA_tbs[c][e])>>0)&0b1;
				if (tb5==0)
				{//single channel
					if (tbs>0)
					{
						tbits[tbs-1][CA_win[c]*4+e]=1;
					}
				}
				if (tb5==1)
				{//2 channel channel
					if (tbs==0) printf("\nTbit error!");
					if (tbs>0)
					{
						tbits[0][CA_win[c]*4+et]=tb1;tbits[4][CA_win[c]*4+et]=tb2;tbits[8 ][CA_win[c]*4+et]=tb3;tbits[12][CA_win[c]*4+et]=tb4;
						tbits[1][CA_win[c]*4+et]=tb1;tbits[5][CA_win[c]*4+et]=tb2;tbits[9 ][CA_win[c]*4+et]=tb3;tbits[13][CA_win[c]*4+et]=tb4;
						tbits[2][CA_win[c]*4+et]=tb1;tbits[6][CA_win[c]*4+et]=tb2;tbits[10][CA_win[c]*4+et]=tb3;tbits[14][CA_win[c]*4+et]=tb4;
						tbits[3][CA_win[c]*4+et]=tb1;tbits[7][CA_win[c]*4+et]=tb2;tbits[11][CA_win[c]*4+et]=tb3;tbits[15][CA_win[c]*4+et]=tb4;
					}
				}
			}
		}

		int ttimes[16][100];// look for edges and time stamp those only
		int ntimes[16];// look for edges and time stamp those only
		for (int q1=0;q1<16;q1++) {ntimes[q1]=0; for (int q2=0;q2<100;q2++) ttimes[q1][q2]=-1;}
		for (int nch=0;nch<16;nch++) 
		{
			for (int si=1;si<2048;si++)
			{
				int tbo=tbits[nch][si-1];
				int tbc=tbits[nch][si];
				
				if (tbo==0 && tbc==1)
				{
					ttimes[nch][ntimes[nch]]=si*8;
					ntimes[nch]++;
				}
				
			}
			
			
		}			
		
		
/*		fprintf(outfile[fidx],"\n%u\t%u\t%u\t%u\t%u",curEvts,Wctime,130,asicNum,addrNum);
		// find and print the number of trigger hits, channel number and trigger bit positions: easier to load in text mode
		int c=0,tbit=0,cbit=-1;
		int tb,tbo;
		int ct=0;// number of hits
		int htime[n_ca_max];
		if (n_ca>0) 
			for (int c=1;c<n_ca*4;c++)
			{
				tbo=tbitval(CA_val,c-1);
				tb=tbitval(CA_val,c);
				if (tb==1 && tbo==0)
				{
					htime[ct]=CA_win[c>>2]*32+(c&3)*8;
					ct++;
				}
				if (c==1 && tbo==1)
				{
					htime[ct]=CA_win[c>>2]*32+0*8;
					ct++;
				}

		if (ct<15) fprintf(outfile[fidx],"\t%d",ct); else fprintf(outfile[fidx],"\t%d",15);
		for (int c=0;c<15;c++)
		{
			if (c<ct)
				fprintf(outfile[fidx],"\t%d",htime[c]);
			else
				fprintf(outfile[fidx],"\t%d",0);
		}
			
		}*/
		for (int nch=0;nch<16;nch++) 
		{
			fprintf(outfile[fidx],"\n%u\t%u\t%u\t%u\t%u\t%u\t%u",curEvts,Wctime,130+nch,asicNum,addrNum,nch,ntimes[nch]);
			int c=0;
			for (c=0;c<14;c++)
			{
				if (c<ntimes[nch])
					fprintf(outfile[fidx],"\t%d",ttimes[nch][c]);
				else fprintf(outfile[fidx],"\t0");
				
			}
			
			
			
		}			

		
		
/*		while (c<n_ca_max && tbit==0)
		{
			if (CA_val[c]!=0)
			{
				tbit=1;
				cbit=CA_win[c]*32+ttime[CA_val[c]];
			}	
			//tbit=(CA_val[c]>>((n_ca_max*12-c-1)%12))&0b1;
			//if (tbit==1) cbit=c;// and we will exit the loop
			c++;
		}

		fprintf(of,"\t%d",cbit); 
		fprintf(of,"\t%d",CA_win[0]); 
		
		
		for (int c=0;c<n_ca_max;c+=4)
		{
			fprintf(of,"\t%d",CA_val[c]<<12 | (CA_val[c+1]<<8) | (CA_val[c+2]<<4) | (CA_val[c+3])); 
		}

		fprintf(of,"\t%d\t%d\t%d\t%d\t%d\t%d",0,0,0,0,0,0); 
*/

		
/*		for (int c=0;c<15;c++)
		{
			if ((c+17)<n_ca_max) fprintf(of,"\t%u",0*CA_raw[c+17]); else fprintf(of,"\t0");
		}
*/

/*		for (int i=0;i<4;i++)
		{
			mbe[i].isValid=true;
			mbe[i].no=currentEventNumber;
			//evts[curEvts+i].Copy(mbe[i]);
		}*/
		//evts[curEvts].Copy(mbe[3]);

		//curEvts++;
	}
		//else 		k=k+1;
		
		
/*		k0=0;
		kt=0;//now copy the bytes into Uint16 buffers
		while ((k<ke & !(buff[k]==0xFE && buff[k+1]==0x88))) k++;//Fast Forward until it finds start of Conc package

		while (k<ke )
		{
			if (kt%2==0)
			{
				buffer_uint16[k0]=((unsigned int)buff[k+0])<<8 | ((unsigned int)buff[k+1]) ;
//				std::cout << "Sa " << k0 << ":" << std::hex << buffer_uint[k0] << std::dec << std::endl;
			k0++;
			}
			kt++;
			k++;
		}
		int cbuflen=k0;//waveform buffer length in uint 32 format
		cout<<"\nConc Buflen="<<cbuflen<<"\n";
		int countStart=62,off2=1;// just ignore the QT data from cont intfc, as it is repeat
		int tctime=0,taxis=0,tch=0,ttdc=0;
		int Ntrg=40;
		int ctrg=0;
		
		count=0;
		while( count<cbuflen && buffer_uint16[count]!=0xFE88) count++;
		count+=countStart+off2;
		while( count<cbuflen){
//			std::cout << std::hex << buffer_uint16[count] << std::dec<<"\n";
			tctime=((buffer_uint16[count]&0b1111111000000000)>>2) | ((buffer_uint16[count+1]&0b1111111000000000)>>9);//we only have room for a 14 bit trig c-time since that was all i could squeeze in there
			taxis=(buffer_uint16[count]&(1<<7))>>7;
			tch  = buffer_uint16[count]&(0b1111111);    //channel number
			ttdc = buffer_uint16[count+1]&(0b111111111);//TDC value
			
			std::cout<< "tCtime="<< std::hex << tctime << std::dec<<"\ttaxis="<<taxis<<"\ttch="<<tch<<"\tttdc="<<ttdc<<  std::hex<< "\t ttdc2ctime(HEX)=" << ttdc/2 << std::dec<<"\n";

			if (ctrg<Ntrg){
				fprintf(of,"\n%d\t%d\t%d\t%d\t%d",curEvts,Wctime,130+ctrg,asicNum,addrNum);
				fprintf(of,"\t%d\t%d\t%d\t%d",tctime,taxis,tch,ttdc);
				fprintf(of,"\t%d\t%d\t%d\t%d",0,0,0,0);
				fprintf(of,"\t%d\t%d\t%d\t%d",0,0,0,0);
				fprintf(of,"\t%d\t%d\t%d\t%d",0,0,0,0);
				ctrg++;
			}
		
		count+=2;
		}

		while (ctrg<Ntrg){
			fprintf(of,"\n%d\t%d\t%d\t%d\t%d",curEvts,Wctime,130+ctrg,asicNum,addrNum);
			fprintf(of,"\t%d\t%d\t%d\t%d",-1,-1,-1,-1);
			fprintf(of,"\t%d\t%d\t%d\t%d",0,0,0,0);
			fprintf(of,"\t%d\t%d\t%d\t%d",0,0,0,0);
			fprintf(of,"\t%d\t%d\t%d\t%d",0,0,0,0);
			ctrg++;
		}
		
		
		*/

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
