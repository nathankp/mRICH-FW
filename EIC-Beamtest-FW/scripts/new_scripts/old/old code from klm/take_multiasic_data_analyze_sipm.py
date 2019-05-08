#!/usr/bin/env python


import sys
import time
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth

usageMSG="\nUsage: take_multiasic_data_analyze_sipm.py <interface> <KLMS_numbr> <HV value> <ASIC mask>"+\
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
gpL=10+128;
gpH=40+128;
freqs=[0.0 for i in range(11)];

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
ctrl.send(syncwd+'AF4A0136');

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

#for asicNo in range (0,10):
#	if (2**asicNo & asicMask)>0:
for chNo in range(0,15):
#		print asicNo,chNo;
	lndbg="";
	ctrl.open();		
	ctrl.send(cmd01hv);#set all HV to off
	time.sleep(0.1);		
	ctrl.send(cmd01);#set all trigs to 0
	time.sleep(0.1);
	ctrl.close();

	
####	for asicNo in range (0,10):# assemble a HV and threshold packet to be sent to the boards
####		cmd01=cmd01+(hex(int('B',16)*(2**28) | Iasic*(2**24) | (2*Ich)*(2**16) | 0).split('x')[1]) #set all thresholds to 0

		
	ctrl.open();
	ctrl.send(cmd01hv);# set all HV to off: sweeping to find base TH
	fmax=[-1 for i in range(11)];
	thbase=[3200 for i in range(11)];
	print "Setting the gain and thresholds"
	for th in range (3700,3400,-1):
		cmd_setTH=syncwd;
		for asicNo in range (0,10):# assemble a HV and threshold packet to be sent to the boards
			cmd_setTH=cmd_setTH+(hex(int('B',16)*(2**28) | asicNo*(2**24) | (2*chNo)*(2**16) | th).split('x')[1]) #set all thresholds to th
#		ctrl.send(syncwd+hex(int('B',16)*(2**28) | asicNo*(2**24) | (2*chNo)*(2**16) | th).split('x')[1]) #set the th
		ctrl.send(cmd_setTH);
		time.sleep(0.01);#wait for counters to settle
#		freq=ctrl.readReg(asicNo+138)/0.004/1000.0;
		scalers=ctrl.readRegs(gpL,gpH+11);#+ctrl.readReg(gpH+asic)*65536;
		for I in range (0,10):
			freqs[I]=(scalers[I]+scalers[30+I]*65536)/T0/1000.0;
			if (freqs[I]>fmax[I]):
				fmax[I]=freqs[I];
				thbase[I]=th;
			
		lndbg=lndbg+ "THscan:  chno= "+str(chNo)+" TH = "+str(th)+" pulse freq set at "+str(freqs)+" kHz \n";

	lndbg=lndbg+ "THbase: chno= "+str(chNo)+" All THbase = "+str(thbase)+"\n";
#now that we have the th base then:
	
	cmd_setTH=syncwd;
	for asicNo in range (0,10):# assemble a HV and threshold packet to be sent to the boards
		cmd_setTH=cmd_setTH+(hex(int('B',16)*(2**28) | asicNo*(2**24) | (2*chNo)*(2**16) | thbase[asicNo]-thOffset).split('x')[1]) #set the threshold at thOffset DAC counts
	ctrl.send(cmd_setTH);
	time.sleep(0.1);# wait for things to settle
	minDeltaF=[20000.0 for i in range(11)];
	hv0=[255 for i in range(11)];
	for hv in range (250,-1,-1):
		cmd01hv_set=syncwd;
		for asicNo in range (0,10):
			cmd01hv_set=cmd01hv_set+ hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | hv).split('x')[1] #set HV DAC bias for all 10 asics
#		ctrl.send(syncwd+hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | hv).split('x')[1]) #set the HV DAC bias
		ctrl.send(cmd01hv_set);
		time.sleep(0.09);
		scalers=ctrl.readRegs(gpL,gpH+11);#+ctrl.readReg(gpH+asic)*65536;
		for I in range (0,10):
			freqs[I]=(scalers[I]+scalers[30+I]*65536)/T0/1000.0;
			if (abs(freqs[I]-f0)<minDeltaF[I]):
				hv0[I]=hv;
				minDeltaF[I]=abs(freqs[I]-f0);

		#freqs=ctrl.readReg(asicNo+138)/0.004/1000.0;
		lndbg=lndbg+ " chno= "+str(chNo)+" hv DAC= "+str(hv0)+" pulse freqs read at "+str(freqs)+" kHz\n";

	cmd01hv0_set=syncwd;
	for asicNo in range (0,10):
		cmd01hv0_set=cmd01hv0_set+ hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | hv0[asicNo]).split('x')[1] #set the HV DAC bias correctly
	ctrl.send(cmd01hv0_set);
	#	ctrl.send(syncwd+hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | hv0).split('x')[1]) #set the HV DAC bias correctly
	time.sleep(0.1);
	scalers=ctrl.readRegs(gpL,gpH+11);#+ctrl.readReg(gpH+asic)*65536;
	for I in range (0,10):
		freqs[I]=(scalers[I]+scalers[30+I]*65536)/T0/1000.0;
#	freq=ctrl.readReg(asicNo+138)/0.004/1000.0;
	print "All asics; chno= "+str(chNo)+" thbase = "+str(thbase)+" thOffset = "+str(thOffset)+" hv0 DAC= "+str(hv0)+" pulse freq check= "+str(freqs)+" kHz";
	lndbg=lndbg+ "All asics; chno= "+str(chNo)+" thbase = "+str(thbase)+" thOffset = "+str(thOffset)+" hv0 DAC= "+str(hv0)+" pulse freq check= "+str(freqs)+" kHz";
	ln=str(chNo)+", "+str(thbase)+", "+str(thOffset)+", "+str(hv0)+", "+str(freqs)+"\n";
	lndbg=lndbg+ln;
	ctrl.close()
	with open(trigfile,'at') as f:
		f.write(ln)

	with open(debugtrigfile,'at') as f:
		f.write(lndbg)

	os.system("./tx_ethtakedatarecord2.py "+interface+" 20000 0 -1 20 "+str(asicMask)+" 1 1");
#	os.system("./tx_ethtakedatarecord1.py "+interface+" 20000 0 -1 20 "+str(asicNo)+" 1 ");
#	datafile="outdir/"+dirname+"/"+sys.argv[2]+"_asic"+str(asicNo)+"_ch"+str(chNo)+"_sipmdata.dat"
	datfilename=sys.argv[2]+"_asic_all"+"_ch"+str(chNo)+"_sipmdata.dat";
	datafile="outdir/"+dirname+"/"+datfilename;
	os.system("cp outdir/data.dat "+datafile);
	os.system("bin/tx_ethparse1 "+datafile+" 2");
	
	for I in range(0,10):
		parsedfile=datfilename+"_asic_"+str(I)+".txt";
		p2file=parsedfile[0:8]+"_asic"+str(I)+"_ch"+str(chNo)+"_sipmdata.dat.txt";
		os.system("mv "+"outdir/"+dirname+"/"+parsedfile+" "+"outdir/"+dirname+"/"+p2file);
		analysis_cmd="bin/KLM_SciFi_KPP "+"outdir/"+dirname+"/"+p2file+" "+outdir+" "+str(chNo)+" NONE 1";
		print analysis_cmd;
		os.system(analysis_cmd);
	
#	for I in range (0,10): 
#		cmd="bin/KLM_SciFi_KPP "+datafile+"_asic_"+str(I)+".txt "+outdir+" "+str(chNo)+" NONE 1";
#		os.system(cmd);
	#os.system("rm "+datafile+".txt ");

t2=time.time()
print "Time = "+str(t2-t1)+" sec(s) to complete"
