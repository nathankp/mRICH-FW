#!/usr/bin/env python


import sys
import time
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth

usageMSG="\nUsage: sipm_test_takedata.py <interface> <KLMS_numbr> <HV value> <ASIC mask>"+\
"\n ASIC mask=Binary mask in decimal for enabling certain asics for testing eg. 5=0000000101 which means asics 0 and 2 only\n";
if len(sys.argv)!=5:
	print usageMSG
	exit(-1)

asicMask=int(sys.argv[4]);

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]
syncwd="000000010253594e4300000000" # must be send before every command string

T0=4*65536/63.5e6;

t1 = time.time();

dirname=sys.argv[2]+"_"+"HV"+sys.argv[3]+"_"+time.strftime("%Y%m%d_%H%M%S", time.localtime());
os.system("mkdir outdir/"+dirname);


## Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)

cmd01hv=syncwd;
for Iasic in range (0,10):
	for Ich in range (0,16):
		cmd01hv=cmd01hv+ hex(int('C',16)*(2**28) | Iasic*(2**20) | (Ich)*(2**16) | 255).split('x')[1] #set HV
ctrl.open();
ctrl.send(cmd01hv)
time.sleep(0.1);
ctrl.send(syncwd+'AF4D0B00AE000100AF4DCB00');
time.sleep(0.1);
ctrl.send(syncwd+'AF2F0004AF300004');
time.sleep(0.1);
#ctrl.send(syncwd+'AF4A100F');
#ctrl.send(syncwd+'AF4A1F00');
#ctrl.send(syncwd+'AF4A0204');
#ctrl.send(syncwd+'AF4A0104');
ctrl.send(syncwd+'AF4A0306');

time.sleep(0.1);


ctrl.close();

cmd01=syncwd;
for Iasic in range (0,10):
	for Ich in range (0,16):
		cmd01=cmd01+(hex(int('B',16)*(2**28) | Iasic*(2**24) | (2*Ich)*(2**16) | 0).split('x')[1]) #set all thresholds to 0
ctrl.open();		
ctrl.send(cmd01)
time.sleep(0.1);
ctrl.close();

thOffset=40;
f0=500;
outdir="outdir/results/kpp"+dirname;
os.system("mkdir -p "+outdir);

ln0="asic, chno, thbase, th0, hv0, pulse freq check\n";
trigfile="outdir/"+dirname+"/"+sys.argv[2]+"trig_gain_setting.txt"
debugtrigfile="outdir/"+dirname+"/"+sys.argv[2]+"dbg_trig.txt"

os.system("rm "+trigfile);
os.system("rm "+debugtrigfile);
with open(trigfile,'at') as f:
	f.write(ln0)

for asicNo in range (0,10):
	if (2**asicNo & asicMask)>0:
		for chNo in range(0,15):
	#		print asicNo,chNo;
			lndbg="";
			ctrl.open();		
			ctrl.send(cmd01hv)
			time.sleep(0.1);		
			ctrl.send(cmd01);#set all trigs to 0
			time.sleep(0.1);
			ctrl.close();
	
			ctrl.open();
			ctrl.send(syncwd+hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | 255).split('x')[1]) #set the HV DAC bias
			fmax=-1;
			thbase=3200;
			print "Setting the gain and thresholds"
			for th in range (3700,3400,-1):
				ctrl.send(syncwd+hex(int('B',16)*(2**28) | asicNo*(2**24) | (2*chNo)*(2**16) | th).split('x')[1]) #set the th
				time.sleep(0.01);
				freq=ctrl.readReg(asicNo+138)/0.004/1000.0;
				lndbg=lndbg+ "THscan: asic= "+str(asicNo)+" chno= "+str(chNo)+" TH = "+str(th)+" pulse freq set at "+str(freq)+" kHz \n";
				if (freq>fmax):
					fmax=freq;
					thbase=th;
			lndbg=lndbg+ "THbase: asic= "+str(asicNo)+" chno= "+str(chNo)+" THbase = "+str(thbase)+"\n";
	#now that we have the th base then:
			
			ctrl.send(syncwd+hex(int('B',16)*(2**28) | asicNo*(2**24) | (2*chNo)*(2**16) | thbase-thOffset).split('x')[1]) #set the threshold at thOffset DAC counts
			time.sleep(0.1);
			minDeltaF=10000.0;
			hv0=255
			for hv in range (250,-1,-1):
				ctrl.send(syncwd+hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | hv).split('x')[1]) #set the HV DAC bias
				time.sleep(0.07);
				freq=ctrl.readReg(asicNo+138)/0.004/1000.0;
				lndbg=lndbg+ "asic= "+str(asicNo)+" chno= "+str(chNo)+" hv DAC= "+str(hv)+" pulse freq set at "+str(freq)+" kHz\n";
				if (abs(freq-f0)<minDeltaF):
					hv0=hv;
					minDeltaF=abs(freq-f0);
	
			ctrl.send(syncwd+hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | hv0).split('x')[1]) #set the HV DAC bias correctly
			time.sleep(0.1);
			freq=ctrl.readReg(asicNo+138)/0.004/1000.0;
			print "asic= "+str(asicNo)+" chno= "+str(chNo)+" thbase = "+str(thbase)+" th0 = "+str(thbase-thOffset)+" hv0 DAC= "+str(hv0)+" pulse freq check= "+str(freq)+" kHz";
			lndbg=lndbg+ "asic= "+str(asicNo)+" chno= "+str(chNo)+" thbase = "+str(thbase)+" th0 = "+str(thbase-thOffset)+" hv0 DAC= "+str(hv0)+" pulse freq check= "+str(freq)+" kHz\n";
			ln=str(asicNo)+", "+str(chNo)+", "+str(thbase)+", "+str(thbase-thOffset)+", "+str(hv0)+", "+str(freq)+"\n";
			lndbg=lndbg+ln;
			ctrl.close()
			with open(trigfile,'at') as f:
				f.write(ln)
	
			with open(debugtrigfile,'at') as f:
				f.write(lndbg)
	
			os.system("./tx_ethtakedatarecord1.py "+interface+" 20000 0 -1 20 "+str(asicNo)+" 1 ");
			#os.system("./tx_ethtakedatarecord1.py "+interface+" 20000 1 -1 3 "+str(asicNo)+" 1 ");
			datafile="outdir/"+dirname+"/"+sys.argv[2]+"_asic"+str(asicNo)+"_ch"+str(chNo)+"_sipmdata.dat"
			os.system("cp outdir/data.dat "+datafile);
			os.system("bin/tx_ethparse1 "+datafile+" 0");
			cmd="bin/KLM_SciFi_KPP "+datafile+".txt "+outdir+" "+str(chNo)+" NONE 0";
			os.system(cmd);
			os.system("rm "+datafile+".txt ");

t2=time.time()
print "Time = "+str(t2-t1)+" sec(s) to complete"
