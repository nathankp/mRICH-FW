//compile independently with: g++ -o bin/BMD_parser src/BMD_parser.cpp `root-config --cflags --glibs`
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstdlib>

#include <TFile.h>
#include "TString.h"
#include "TObjArray.h"


using namespace std;


void processBuffer(unsigned char*buffer_uint, int sizeinbytes);
TString getOutputFileName(std::string inputFileName);
FILE*outfile;

//error checking parameters
const int numDC   = 10;
const int numCHAN = 16;//only channel 16 is needed- which is connected to the signal gen
const int numADDR = 512;
const int numSAMP = 32*4;
int evtSa[128][16];
int evtCT[2][16];
bool DecodeTPGflag;


int main(int argc, char* argv[]){
	//check # arguments
	if (argc != 2 && argc != 3 ){
    	std::cout << "wrong number of arguments: usage ./BMD_parser <input filename> [options: -TPG]" << std::endl;
    	return 0;
  	}
	DecodeTPGflag=false;
	if (argc==3){
		if (0==strcmp(argv[2],"-TPG")){
			DecodeTPGflag=true;
		}
		else{
    		std::cout << "wrong number of arguments: usage ./BMD_parser <input filename> [options: -TPG]" << std::endl;
	    	return 0;
		}
	}
	
	//define input file and parsing
	std::string inputFileName = argv[1];
	std::cout << " inputFileName " << inputFileName << std::endl;
	ifstream infile;
	infile.open(argv[1], std::ifstream::in | std::ifstream::binary);

	//checking to see if infile is good
    if (infile.fail()) {
		std::cout << "Error opening input file, exiting" << std::endl;
		return 0;
	}
	
	//creating new output text file
	char ofname[200];
	sprintf(ofname,"%s_AllEvents.txt",argv[1]);
	outfile=fopen(ofname,"wt");

	// get length of file:
	infile.seekg (0, infile.end);
	int size_in_bytes = infile.tellg();
	infile.seekg (0, infile.beg);

	//define buffer
	char* buffer = new   char [size_in_bytes];
	unsigned char* Ubuff=(unsigned char*)buffer;

	// read data as a block:
	std::cout << "Reading " << size_in_bytes << " bytes... ";
	infile.read (buffer,size_in_bytes);
	if (infile) {
  		std::cout << "all characters read successfully." << std::endl;
	} 
	else {
  		std::cout << "error: only " << infile.gcount() << " could be read" << std::endl;
	}
	infile.close();

	//process file buffer
	processBuffer(Ubuff,size_in_bytes);
	fclose(outfile);
	return 0;
}


void processBuffer( unsigned char* buff,int size){
	static int curEvts=0;
	unsigned int addrNum = 0;
	unsigned int wraddrNum = 0;
	unsigned int asicNum = 0;
	unsigned int sampNum = 0;
	unsigned int winNum=0;
	unsigned int TrigCH=0;
	unsigned int buffer_uint[65536] ;
	unsigned int buffer_uint16[65536];
	int k=0,ke=0,CurrWin=0;

	//checking package size
	if (size<100){
		std::cout << "\n\nWARNING: Packet size only: " << size << " bytes. ---> Skipping packet.\n\n";
		return;
	}

	//check for packet header-- add the syncing text here
	while (k<size-16){
		while (k<size-16 && (!((buff[k]=='w' && buff[k+1]=='a' && buff[k+2]=='v' && buff[k+3]=='e')) 
						 && !((buff[k]=='c' && buff[k+1]=='h' && buff[k+2]=='r' && buff[k+3]=='g')))) k++;
			k+=4;
			ke=k;

		//find start of next package
		while (ke<size-16 && (!((buff[ke]=='w' && buff[ke+1]=='a' && buff[ke+2]=='v' && buff[ke+3]=='e')) 
						  && !((buff[ke]=='c' && buff[ke+1]=='h' && buff[ke+2]=='r' && buff[ke+3]=='g')))) ke++;
	
		//checking for header words 
		if ((buff[k]==0xFE && buff[k+4]==0xCF && (buff[k+8]&0xF0)==0xD0)) {		
			int k0=0;
			int kt=0;//now copy the bytes into Uint32 and Uint16 buffers
			while ((k<ke & !(buff[k]==0xFA && buff[k+1]==0xCE && buff[k+2]==0xFA && buff[k+3]==0xCE))){
				if (kt%4==0){
					buffer_uint[k0]=((unsigned int)buff[k+0])<<24 | ((unsigned int)buff[k+1])<<16 | ((unsigned int)buff[k+2])<<8 | ((unsigned int)buff[k+3]);
					k0++;
				}
				kt++;
				k++;
			}

			int wbuflen=k0;//waveform buffer length in uint 32 format
			const int n_ca_max=32;
			int n_ca=0;
			unsigned int CA_val[n_ca_max];
			unsigned int CA_raw[n_ca_max];
			unsigned int CA_raw2[n_ca_max];
			unsigned int CA_win[n_ca_max];
			unsigned int CA_tbs[n_ca_max][4];
			for (int q=0;q<n_ca_max;q++) {
				CA_val[q]=0;
				CA_raw[q]=0;
				CA_raw2[q]=0;
				CA_win[q]=0;
				CA_tbs[q][0]=0;
				CA_tbs[q][1]=0;
				CA_tbs[q][2]=0;
				CA_tbs[q][3]=0;
			}
				
			//at this point should have window data - loop over window data until encounter end of window packet
			int count = 0,chanNum=0, offset=0,offset2=3,Wctime=0;

			wraddrNum = ( (buffer_uint[+offset] >> 9) & 0x000001FF );//window count from sampling script at time of readout
			asicNum = ( (buffer_uint[+offset] >> 20) & 0x0000000F );//current asic number
			curEvts = ( (buffer_uint[+1] ) & 0x00FFFFFF );//current readout event
			addrNum = ( (buffer_uint[+2] >>8) & 0x000001FF );//readout start address
			TrigCH = ( (buffer_uint[+2] ) & 0x000000FF );//channel that triggered event
	
			while( count<wbuflen){
				//Check for samples
				if ((buffer_uint[+offset2+count]& 0xFF000000)==0xBD000000){
					chanNum = (buffer_uint[+offset2+count]>>19) & 0x0000000F;
					winNum =  (buffer_uint[+offset2+count]>>17) & 0x00000003 ;
					sampNum = (buffer_uint[+offset2+count]>>12) & 0x0000001F;
					int BDval=(buffer_uint[+offset2+count]>>24) & 0x000000FF;

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

					//filling wave data from buffer into array
					int sa_val=(buffer_uint[+offset2+count]) & 0x00000FFF;
					evtSa[winNum*32+sampNum][chanNum]=sa_val;
				
				}

				//filing trigger data from buffer into array 
				if ((buffer_uint[+offset2+count]& 0xFF000000)==0xCB000000){
					int k=(0x00F00000 & buffer_uint[+offset2+count])>>20;
					evtCT[0][k]=buffer_uint[+offset2+count]>>12 & 0x7F;
					evtCT[1][k]=buffer_uint[+offset2+count] & 0x0FFF;
				}

				//decode trigger bits
				if ((buffer_uint[+offset2+count]& 0xFF000000)==0xCA000000){
					if ((buffer_uint[+offset2+count+1]& 0xFF000000)==0xC7000000){
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

			//filling data into text file
			if (count>5){
				for (int i=0;i<128;i++){
					CurrWin = addrNum+i/32;
					fprintf(outfile,"\n%u\t%u\t%u",asicNum,CurrWin,i);
					for (int c=0;c<16;c++){
						if (i == 127 and c == 15){
							fprintf(outfile,"\t%d",+evtSa[i-1][c]);
						}
						else{
							fprintf(outfile,"\t%d",+evtSa[i][c]);
						}
					}
				}
			fprintf(outfile,"\n%u\t%u\t128\t%u\t%u\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99\t99",asicNum,CurrWin,TrigCH,addrNum);

				 //filling PEAKS and TDC into text file
//				fprintf(outfile,"\n%d\t%d\t%d\t%d\t%d",curEvts,Wctime,128,asicNum,addrNum);
//				for (int c=0;c<16;c++) fprintf(outfile,"\t%d",evtCT[0][c]);
//				fprintf(outfile,"\n%d\t%d\t%d\t%d\t%d",curEvts,Wctime,129,asicNum,addrNum);
//				for (int c=0;c<15;c++) fprintf(outfile,"\t%d",+evtCT[1][c]);
//				fprintf(outfile,"\t%d",+evtCT[1][15]);
//				fprintf(outfile,"\t%d",+evtCT[1][15]-2048*1);

//				// TRIGGER HISTORY
//				int tbits[16][2048];// recounstruct the whole ASIC memory for 15 channels
//				for (int q1=0;q1<16;q1++) for (int q2=0;q2<2048;q2++) tbits[q1][q2]=0;
//				for (int c=0;c<n_ca;c++){
//					for (int e=0;e<4;e++){
//						int et=e;
//						int tbs=(CA_tbs[c][e]&0b01111);
//						int tb5=((CA_tbs[c][e])>>4)&0b1;
//						int tb4=((CA_tbs[c][e])>>3)&0b1;
//						int tb3=((CA_tbs[c][e])>>2)&0b1;
//						int tb2=((CA_tbs[c][e])>>1)&0b1;
//						int tb1=((CA_tbs[c][e])>>0)&0b1;
//						if (tb5==0){//single channel
//							if (tbs>0){
//								tbits[tbs-1][CA_win[c]*4+e]=1;
//							}
//						}
//						if (tb5==1){//2 channel channel
//							if (tbs==0) printf("\nTbit error!");
//							if (tbs>0){
//								tbits[0][CA_win[c]*4+et]=tb1;tbits[4][CA_win[c]*4+et]=tb2;tbits[8 ][CA_win[c]*4+et]=tb3;tbits[12][CA_win[c]*4+et]=tb4;
//								tbits[1][CA_win[c]*4+et]=tb1;tbits[5][CA_win[c]*4+et]=tb2;tbits[9 ][CA_win[c]*4+et]=tb3;tbits[13][CA_win[c]*4+et]=tb4;
//								tbits[2][CA_win[c]*4+et]=tb1;tbits[6][CA_win[c]*4+et]=tb2;tbits[10][CA_win[c]*4+et]=tb3;tbits[14][CA_win[c]*4+et]=tb4;
//								tbits[3][CA_win[c]*4+et]=tb1;tbits[7][CA_win[c]*4+et]=tb2;tbits[11][CA_win[c]*4+et]=tb3;tbits[15][CA_win[c]*4+et]=tb4;
//							}
//						}
//					}
//				}
			}	
		}	
	return;		
	}
}
////wirting output file
//TString getOutputFileName(std::string inputFileName) {
//	TString fileName(inputFileName);
//	TObjArray* strings = fileName.Tokenize("/");
//	TObjString* objstring = (TObjString*) strings->At(strings->GetLast());
//	TString string(objstring->GetString());
//	TString outputFileName("output_");
//	outputFileName += string;
//	outputFileName.ReplaceAll(".dat", ".root");
//	outputFileName.ReplaceAll(".rawdata", ".root");
//	strings->SetOwner(kTRUE);
//	delete strings;
//	return outputFileName;
//}
