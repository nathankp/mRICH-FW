#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <iostream>
#include <stdlib.h> 

#include <sys/types.h> /* See NOTES */ 
#include <sys/socket.h>
#include<arpa/inet.h>


#include <fstream>

#include <TGraph.h>
#include <TLegend.h>
#include <TLatex.h>
#include <TMultiGraph.h>
#include <TH1.h>
#include "TApplication.h"
#include "TCanvas.h"
#include "TAxis.h"
#include "TF1.h"
#include "TMath.h"
#include "TFile.h"
#include "TGraphErrors.h"

#define SERVER "192.168.20.255"
#define BUFLEN 65536  //Max length of buffer
#define PORT_pc 28672   //The port on which to send data
#define PORT_scrod 24576   //The port on which to send data
 

//global TApplication object declared here for simplicity
TApplication *theApp;

using namespace std;
enum OpMode {raw=0b00,pedsub=0b01,ped=0b10,wave=0b11};
int RR_base=128;

void die(char *s)
{
    perror(s);
    exit(1);
}

int main(int argc, char* argv[]){
	if (argc != 7){
    		std::cout << "wrong number of arguments: usage \n./tx_takedataplot1 <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <ASIC no> <op mode>" << std::endl;
    		return 0;
  	}

	int numEvents = atoi(argv[1]);
	if( numEvents <= 0 ){
		std::cout << "Invalid number of events, exiting" << std::endl;
		return 0;
	}

	//get trigger type
	//int trigType = 0;

	int trigType = atoi(argv[2]);
	if( trigType != 0 && trigType != 1 ){
		std::cout << "Invalid trigger type, exiting" << std::endl;
		return 0;
	}

	int WinS = atoi(argv[3]);
		if( WinS < 0 || WinS >= 509 ){
			std::cout << "Invalid Window Start-- should be between 0 and 508, exiting" << std::endl;
			return 0;
		}

		int WinOffset = atoi(argv[4]);
		if( WinOffset < 0 || WinOffset >= 512 ){
			std::cout << "Invalid Window offset-- should be between 0 and 511, exiting" << std::endl;
			return 0;
		}

		int ASICno = atoi(argv[5]);
		if( ASICno < 0 || ASICno > 10 ){
			std::cout << "Invalid ASIC no-- should be between 0 and 9, exiting" << std::endl;
			return 0;
		}

		int opmode = atoi(argv[6]);
			if( opmode < 0 || opmode > 3 ){
				std::cout << "Invalid operation mode-- \n0: Raw legacy waveform output\n1:Pedestal subtracted waveform\n2:Pedestals only\n3:Wavform only" << std::endl;
				return 0;
			}


	//define application object
	theApp = new TApplication("App", &argc, argv);

	int regValReadback;

	//create target6 interface object
	//target6ControlClass *control = new target6ControlClass();

	//initialize USB interface - Mandatory
	//control->initializeUSBInterface();

	//define the SCROD ID for board stack, hardcoded for now
	unsigned int board_id = 0;
	int asic[10]={0x001,0x002,0x004,0x008,0x010,0x020,0x040,0x080,0x100,0x200};

	//clear data buffer
	//control->clearDataBuffer();

	//make simple sample histogram
	TCanvas *c0 = new TCanvas("c0","c0",800,600);
	TH1F *hSampDist = new TH1F("hSampDist","",110,3000,4100);
	TMultiGraph *mg = new TMultiGraph();
	  mg->SetTitle("Exclusion graphs");
		TLegend* leg = new TLegend(0.1,0.7,0.48,0.9);
		TLatex ltxt;
		ltxt.SetTextSize(0.025);
		ltxt.SetTextAngle(0.);
	//Initialize

	int digOffset = WinOffset;

    struct sockaddr_in si_other;
    struct sockaddr_in so_other;
    int si,so, i;
	unsigned int slen=sizeof(si_other);
    char buf[BUFLEN];
    char message[BUFLEN];
 
    if ( (si=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1)
    {
        die("i socket");
    }

    if ( (so=socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) == -1)
    {
        die("o socket");
    }
 
    memset((char *) &si_other, 0, sizeof(si_other));
    memset((char *) &so_other, 0, sizeof(so_other));
    si_other.sin_family = AF_INET;
    si_other.sin_port = htons(PORT_pc);

    so_other.sin_family = AF_INET;
    so_other.sin_port = htons(PORT_scrod);
     
    if (inet_aton(SERVER , &si_other.sin_addr) == 0) 
    {
        fprintf(stderr, "inet_aton() si failed\n");
        exit(1);
    }
 if (inet_aton(SERVER , &so_other.sin_addr) == 0) 
    {
        fprintf(stderr, "inet_aton() so failed\n");
        exit(1);
    }

	const char device[] = "eth0";
	int slb=1;
	//int sldntroute=1;
	setsockopt(so, SOL_SOCKET, SO_BROADCAST, &slb, sizeof(slb));
	setsockopt(si, SOL_SOCKET, SO_BROADCAST, &slb, sizeof(slb));
	
	setsockopt(so, SOL_SOCKET, SO_BINDTODEVICE, &device, sizeof(device));
	setsockopt(si, SOL_SOCKET, SO_BINDTODEVICE, &device, sizeof(device));

	int rc = bind (si, (struct sockaddr *) &si_other, sizeof(si_other));
	if (rc < 0) 
	{
		printf ("%s: could not bind port \n", argv[0]);
	return -1;
	}


	const unsigned char msg1[]={'S','Y','N','C',0,0,0,0,0xAF,0x25,0xC0,0x07};
	const unsigned char msg2[]={'S','Y','N','C',0,0,0,0,
	0xAF,0x37,0x00,0x01,0xAF,0x37,0x00,0x00,0xAF,0x32,0x00,0x01,0xAF,0x32,0x00,0x00};
 
	int msg1len=12;
	int msg2len=24;

  while(1)
    {



        //printf("Enter message : ");
        //gets(message);

//	message[0]='S';message[1]='Y';message[2]='N';message[3]='C';
//	message[4]=0;message[5]=0;message[6]=0;message[7]=0;
//	message[8]=0xAF;message[9]=0x25;message[10]=0xC0;message[11]=0x07;


        //send the message
        if (sendto(so, msg2, msg2len , 0 , (struct sockaddr *) &so_other, slen)==-1)
        {
            die("sendto()");
        }
        
        //receive a reply and print it
        //clear the buffer by filling null, it might have previously received data
        memset(buf,'\0', BUFLEN);
        //try to receive some data, this is a blocking call
//        if (recvfrom(s, buf, BUFLEN, 0, (struct sockaddr *) &si_other, &slen) == -1)
        if (recvfrom(si, buf, BUFLEN, 0, (struct sockaddr *) &si_other, &slen) == -1)
        {
            die("recvfrom()");
        }
         
        puts(buf);
    }
 
    close(si);
    close(so);
    return 0;


/*			control->registerWriteReadback(board_id, 20, 0, regValReadback); //Digitization OFF
			control->registerWriteReadback(board_id, 30, 0, regValReadback); //Serial readout OFF
			control->registerWriteReadback(board_id, 31, 0, regValReadback); //keep test pattern gen off
			control->registerWriteReadback(board_id, 50, 0, regValReadback); //readout control start is 0
			control->registerWrite(board_id, 44, 0, regValReadback); //Stop event builder
			control->registerWrite(board_id, 45, 1, regValReadback); //Reset Event builder
			control->registerWrite(board_id, 45, 0, regValReadback); //Reset Event builder
//			control->registerWriteReadback(board_id, 51, 0x200, regValReadback); //enable ASICs for readout
			control->registerWriteReadback(board_id, 51, asic[ASICno], regValReadback); //enable ASICs for readout
			control->registerWriteReadback(board_id, 52, 0, regValReadback); //veto hardware triggers
			control->registerWriteReadback(board_id, 53, 0, regValReadback); //set trigger delay
			control->registerWriteReadback(board_id, 54, digOffset, regValReadback); //set digitization window offset
			control->registerWriteReadback(board_id, 55, 1, regValReadback); //reset readout
			control->registerWriteReadback(board_id, 55, 0, regValReadback); //reset readout
			control->registerWriteReadback(board_id, 56, 0, regValReadback); //select readout control module signals
			control->registerWriteReadback(board_id, 57, 4, regValReadback); //set # of windows to read
			control->registerWrite(board_id, 58, 0, regValReadback); //reset packet request
			control->registerWrite(board_id, 72, 0x3FF, regValReadback); //enable trigger bits
		//	control->registerWrite(board_id, 72, 0x000, regValReadback); //enable trigger bits
			control->registerWrite(board_id, 61, 0xF00, regValReadback); //ramp length- working on 40us ish
			control->registerWrite(board_id,38,0,regValReadback);//setting for using only the trig decision logic
			control->registerWrite(board_id,38,1<<11,regValReadback);//reset buffers
			control->registerWrite(board_id,38,0,regValReadback);//setting for using only the trig decision logic
			//int opmode=pedsub;
			control->registerWrite(board_id,38,opmode<<12 | 0x1<<7,regValReadback);//setting for using only the trig decision logic
			control->registerWrite(board_id,39,0b0000000000000000,regValReadback);//setting for using only the trig decision logic

			if (trigType == 0){// SW trigger, so we should use a fixed start window:
			control->registerWriteReadback(board_id, 62, 0x8000 | WinS, regValReadback); //force start digitization start window to be the fixed value
			}
			if (trigType == 1){// HW trigger, so start window is mandated by the FPGA:
			control->registerWriteReadback(board_id, 62, 0x0000 , regValReadback); //force start digitization start window to be the fixed value
			}

			control->registerWrite(board_id,11,32<<10 | 0b01,regValReadback);//setting for wr_addr_clr_start phase
			control->sendSamplingReset(board_id);


	//define output file		
	ofstream dataFile;
  	dataFile.open ("outdir/out_tx1.dat", ios::out | ios::binary );

	unsigned int eventdatabuf[65536];
	int eventdataSize = 0;
	int numIter = 0;
	int samples[10][16][4][32];
	int PeakC[16],PeakT[16];
	int a0=ASICno,a1=a0+1,k0=0,k1=16;

	TGraph *gPlot[10][16];
	TGraph *pPlot[16];//t=new TGraph();
	for(int a = 0 ; a < 10 ; a++)
		for (int k=0;k<k1;k++) {
		gPlot[a][k] = new TGraph();
			//numPoint[a] = 0;
			gPlot[a][k]->SetMarkerColor(2);
			gPlot[a][k]->SetMarkerStyle(1);
			gPlot[a][k]->SetMarkerSize(5.5);
			gPlot[a][k]->SetLineStyle(1);
			gPlot[a][k]->SetLineColor(1);
			gPlot[a][k]->SetLineWidth(3);
	}
	for (int k=0;k<k1;k++) pPlot[k]=new TGraph();


	unsigned int bitNum = 0;
	unsigned int addrNum = 0;
	unsigned int asicNum = 0;
	unsigned int sampNum = 0;
	unsigned int chanNum = 0;
	unsigned int winNum =0;
	unsigned int wraddrNum =0;
	for(int a = a0 ; a < a1 ; a++)
  	 	for(int k = k0 ; k < k1 ; k++)
  		for(int i = 0 ; i < 512 ; i++)
  		for(int j = 0 ; j < 32 ; j++)
			samples[a][k][i][j] = -10000;


	int nEvt = 0;
	while(nEvt<numEvents){
		usleep(10000);

		//do software trigger
			if(trigType == 0){
				control->sendTrigger(board_id,0);
				usleep(500);
				control->registerWriteReadback(board_id, 50, 0, regValReadback);
			/*	int cnt1,cnt2;
				control->registerRead(board_id,RR_base+5,cnt1);
				control->registerRead(board_id,RR_base+30,cnt2);
				cout<<endl<<"SMP_Latch: "<<cnt1<<", Dig win start: "<<cnt2;*/
			/*}

			if(trigType == 1){
				control->registerWrite(board_id,39,1<<15 | 0<<14 | asic[ASICno],regValReadback);//setting for using only the trig decision logic and mask not needed ASICs
				//cout<<"\nWaiting for SiPM Trigger...";
				usleep(10000);
				//control->registerWrite(board_id,39,0,regValReadback);//setting for using only the trig decision logic
			}


			//give the trigger some time
		usleep(5000);

  /*		for(int a = a0 ; a < 10 ; a++)
  	 	for(int k = k0 ; k < 16 ; k++)
  		for(int i = 0 ; i < 512 ; i++)
  		for(int j = 0 ; j < 32 ; j++)
			samples[a][k][i][j] = -10000;*/

/*		int first = 1;
		int numSmall = 0;
		numIter = 0;
		int nData=0;
		int EVTvalid=false;

		while( (eventdataSize > 100 || numSmall < 10 ) && numIter < 25 ){
		//while( numIter < 4){
			//delay, just in case readout is still in progress

			control->continueReadout(board_id);

			usleep(1000);
	
			//parse the data packet, look for event packets
			control->readPacketFromUSBFifo( eventdatabuf, 65536, eventdataSize );
		//	std::cout << "EVENT SIZE " << eventdataSize << std::endl;
		
			//increment iterate count
			numIter++;

			//save data to file
			//myfile.write(reinterpret_cast<char*>(&eventdatabuf), eventdataSize*sizeof(unsigned int));
			if( eventdataSize > 100 ){
				control->registerWrite(board_id,39,0,regValReadback);//setting for using only the trig decision logic
				first = 0;
				numSmall = 0;
				control->writeEventToFile(eventdatabuf, eventdataSize, dataFile );
				std::cout << "EVENT SIZE " << eventdataSize << ", Event Num="<<nEvt<<std::endl;

				EVTvalid=true;
				nEvt++;
			}
			else
				numSmall++;
			
			//print out packet

if (EVTvalid=true){


			for(int j=0;j<eventdataSize; j++){
				//std::cout << "RAW DATA\t" << std::hex << eventdatabuf[j] << std::dec << std::endl;
				//std::cout << "Packet Length\t" << std::hex << eventdatabuf[j] << std::dec << std::endl;
				//continue;
				//detect packet header
				if( eventdatabuf[j] == 0x00be11e2){
					//std::cout << "\tPacket Header ";
					//std::cout << std::endl;
					continue;
				}
				//detect sample packet header
				if( (0xFF000000 & eventdatabuf[j]) == 0xFE000000 ){
					std::cout << "\nHeader Val:" << std::hex << eventdatabuf[j] << std::dec << std::endl;
					addrNum = ( (eventdatabuf[j] ) & 0x000001FF );
					wraddrNum = ( (eventdatabuf[j] >> 9) & 0x000001FF );
					asicNum = ( (eventdatabuf[j] >> 20) & 0x0000000F )-1;
					std::cout << "\nDig Address, Wr addr, Asic: ";
					std::cout << "\t" << addrNum;
					std::cout << "\t" << wraddrNum;
					std::cout << "\t" << asicNum;
					//std::cout << "\t" << sampNum;
					std::cout << std::endl;
					nData++;
					continue;
				}
				if( (0xFF000000 & eventdatabuf[j]) == 0xCB000000 ){
					int k=(0x00F00000 & eventdatabuf[j])>>20;
				//	std::cout << "C&T Val:" << std::hex << eventdatabuf[j] << std::dec << std::endl;
					PeakT[k]=eventdatabuf[j]>>12 & 0x7F;
					PeakC[k]=eventdatabuf[j] & 0x0FFF;
					nData++;
					continue;
				}

				if( (0xFF000000 & eventdatabuf[j]) != 0xBD000000 ){
					//std::cout << "\tJUNK" << std::endl;
					continue;
				}


				chanNum = (eventdatabuf[j]>>19) & 0x0000000F;
				sampNum = (eventdatabuf[j]>>12) & 0x0000001F;
				winNum=(eventdatabuf[j]>> 17) & 0x00000003 ;
				int samp=eventdatabuf[j] & 0x00000FFF;
/*				std::cout << "\t" << std::hex << eventdatabuf[j] << std::dec;
				std::cout << "," << asicNum;
				std::cout << "," << chanNum;
				std::cout << "," << addrNum+winNum;
				std::cout << "," << sampNum;
				std::cout << "," << samp<<"\n";*/
				//std::cout << "\t" << bitNum;
				//std::cout << std::endl;
/*				if( addrNum < 0 || addrNum+winNum > 511  || sampNum < 0 || sampNum > 31 || asicNum < 0 || asicNum > 9 )
					continue;
				//samples[sampNum] = (samples[sampNum] | (((eventdatabuf[j] >> 15) & 0x1) <<bitNum) );
//				if (chanNum==0)
				{
					samples[asicNum][chanNum][winNum][sampNum] = samp-3400*(opmode==pedsub);
					//if (chanNum>=12 && chanNum<=14) printf("%d\t%d\t%x\t%d\n",chanNum,sampNum,samp,samp);
					nData++;
				}

			}


			//reset request packet bit
			//control->registerWrite(board_id, 58, 0, regValReadback); //allow readout to continue
			
			//std::cout << "Please enter character, Q to quit data readout loop" << std::endl;
			//std::cin >> ct;
			//if( ct == 'Q' )
			//	break;
		}
		
		//cout<<nEvt;
	/*	if (nData==0) continue;

		char t;
//	sleep(10);

		int numPoint[10][16];
		for(int a = a0 ; a < a1 ; a++)
		for(int k = k0 ; k < 16 ; k++){
			numPoint[a][k] = 0;
  			gPlot[a][k]->SetMarkerColor(2);
  			gPlot[a][k]->SetMarkerStyle(20);
  			gPlot[a][k]->SetMarkerSize(0.6);
  			gPlot[a][k]->SetLineStyle(1);
  			gPlot[a][k]->SetLineColor(k+1);
  			gPlot[a][k]->SetLineWidth(2);
		}		

		//plot samples

		for(int a = a0 ; a < a1 ; a++)
		for(int k = k0 ; k < 16 ; k++)
		for(int i = 0 ; i < 4 ; i++)
		for(int j = 0 ; j < 32 ; j++){
			if( samples[a][k][i][j] != -10000){
			//if(1){
				//std::cout << std::dec << samples[i][j] << std::endl;
				gPlot[a][k]->SetPoint(numPoint[a][k],32*(i+addrNum) + j,samples[a][k][i][j]);
				numPoint[a][k]++;
			}
  		}

			leg->Clear();

		for(int k = k0 ; k < 16 ; k++)
		{
			pPlot[k]->SetMarkerColor(4);
			pPlot[k]->SetMarkerStyle(1+k);
			pPlot[k]->SetMarkerSize(1.5);
			pPlot[k]->SetPoint(0,PeakT[k]+addrNum*32,PeakC[k]-3400*(opmode==pedsub));
		}


		//gPlot[9]->GetYaxis()->SetRangeUser(0,4100);
		mg->Clear();
		for (int k=k0;k<16;k++)
		{
		mg->Add(gPlot[asicNum][k]);
		mg->Add(pPlot[k]);
		}
		mg->SetMinimum(-2100.);mg->SetMaximum(700.);
		if (opmode!=pedsub) {mg->SetMinimum(-0000.);mg->SetMaximum(4200.);}

		mg->Draw("APL");

		for (int k=k0;k<16;k++) ltxt.DrawLatex(PeakT[k]+addrNum*32+k/2,PeakC[k]+k/2-3400*(opmode==pedsub),Form("%X",k));


/*		for(int k = 0 ; k < 16 ; k++)
		{
			leg->AddEntry(pPlot[k],"Ch","l");
		}

		leg->SetHeader("Channels");
		leg->Draw();
*/


/*		mg->GetXaxis()->SetTitle("Sample Number");
		mg->GetXaxis()->SetLimits(addrNum*32,addrNum*32+4*32);


  		//c0->Divide(3,4);
		//for(int a = 0 ; a < 10 ; a++){
		//	if( numPoint[a] < 10 )
		//		continue;
		//	c0->cd(a+1);
		//	std::cout << std::dec << numPoint[a] << std::endl;
		//	gPlot[a]->GetYaxis()->SetRangeUser(0,4100);
  		//	gPlot[a]->Draw("AP");
		//}
		
  		c0->Update();
  		control->registerWrite(board_id, 55, 1, regValReadback); //make sure readout is reset
  		control->registerWrite(board_id, 55, 0, regValReadback); //make sure readout is reset
		}
		int cnt1,cnt2,niter;
		control->registerRead(board_id,RR_base+5,cnt1);
		control->registerRead(board_id,RR_base+30,cnt2);
		cout<<endl<<"SMP_Latch: "<<cnt1<<", Dig win start: "<<cnt2;
//		control->registerRead(board_id,RR_base+33,niter);
//		cout<<endl<<"Iteration: "<< std::hex << niter << std::dec<<endl;

		//check main_cnt variable
//		control->registerRead(board_id, 261, regValReadback);
//		std::cout << std::dec << "LATCH MAIN_CNT " << regValReadback << std::endl;
//		control->registerRead(board_id, 260, regValReadback);
//		std::cout << std::dec << "DIG MAIN_CNT " << regValReadback << std::endl;
//		std::cout << std::dec << "DIG OFFSET " << digOffset << std::endl;
//		std::cout << std::dec << "# Readout iterations " << nEvt << std::endl;

//		std::cout << "Please enter character, Q to quit" << std::endl;
		//std::cin >> ct;
		usleep(1000);
		
	}

	//reset readout
	control->registerWriteReadback(board_id, 50, 0, regValReadback); //readout control start is 0
	control->registerWriteReadback(board_id, 52, 0, regValReadback); //veto hardware triggers
	control->registerWrite(board_id, 55, 1, regValReadback); //make sure readout is reset
	control->registerWrite(board_id, 55, 0, regValReadback); //make sure readout is reset

	//close output file
  	dataFile.close();

	//close USB interface
        control->closeUSBInterface();

	//delete target6 interface object
	delete control;

	return 1;

	c0->Clear();
	hSampDist->Draw();
	c0->Update();

	TFile *f = new TFile( "output_target6Control_test.root" , "RECREATE");
	hSampDist->Write();
  	f->Close();
	delete f;
*/
	return 1;
}	



