#!/usr/bin/env python


import sys
import time
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth
from time import gmtime, strftime

usageMSG="Usage: sipm_test_takedata.py <interface> <KLMS_numbr>";
if len(sys.argv)!=3:
	print usageMSG
	exit(-1)


# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]
syncwd="000000010253594e4300000000" # must be send before every command string

t1 = time.time();

dirname=sys.argv[2]+"_"+strftime("%Y%m%d_%H%M%S", gmtime());
os.system("mkdir outdir/"+dirname);

## Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)

cmd01=syncwd;
for Iasic in range (0,10):
	for Ich in range (0,16):
		cmd01=cmd01+(hex(int('B',16)*(2**28) | Iasic*(2**24) | (2*Ich)*(2**16) | 0).split('x')[1]) #set all thresholds to 0


ctrl.open();		
ctrl.send(cmd01)
time.sleep(0.1);
ctrl.close();


for asicNo in range (0,10):
	for chNo in range(0,15):
		print asicNo,chNo;
		ctrl.open()

		ctrl.send(syncwd+hex(int('C',16)*(2**28) | asicNo*(2**20) | (chNo)*(2**16) | 0).split('x')[1]) #set the HV DAC bias
		time.sleep(0.1);
		ctrl.send(syncwd+hex(int('B',16)*(2**28) | asicNo*(2**24) | (2*chNo)*(2**16) | 3482).split('x')[1]) #set the threshold at 40 DAC counts
		time.sleep(0.1);
		ctrl.close()
		os.system("./tx_ethtakedatarecord1.py "+interface+" 20000 0 -1 2 "+str(asicNo)+" 1 ");
		os.system("bin/tx_ethparse1 outdir/data.dat 0");
		os.system("cp outdir/data.dat.txt outdir/"+dirname+"/"+sys.argv[2]+"_asic"+str(asicNo)+"_ch"+str(chNo)+"_sipmdata.txt");
		

t2=time.time()
print "Time = "+str(t2-t1)+" sec(s) to complete"
