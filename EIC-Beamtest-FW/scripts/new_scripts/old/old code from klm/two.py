#!/usr/bin/env python

#tx_ethtakedatarecord1 <interface> <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <0 based ASIC no> <op mode>

import sys
import time
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth

usageMSG="MultiASIC take data record:\nUsage: takedata_record2 <interface> <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <ASIC mask> <op mode> <outputdata mode> where:\n"+\
"num events>0 \ntrig type=0 or 1 \nWin Start= 0 .. 508\nWin offset= 0 .. 508\nASIC no = 0..9\nop mode=\n"+\
"\t1: Pedestal subtracted data\n\t2: Pedestals only\n\t3: Raw Waveform only\n "+\
"ASIC mask= binary mask for the asics that are enabled to be readout"+\
"\noutputdata waveform mode: 0=waveforms, 1=peaks or troughs, -1= dont touch this reg. ";

if len(sys.argv)!=9:
	print usageMSG
	exit(-1)


nEvts=int(sys.argv[2]);
trigType=int(sys.argv[3]);
winStart=int(sys.argv[4]);
winOffset=int(sys.argv[5]);
opMode=int(sys.argv[7]);
asicMask=int(sys.argv[6]);
outputdatamode=int(sys.argv[8]);

if nEvts<0 or trigType<0 or trigType>2 or winStart<-1 or winStart>508 or winOffset<0 or winOffset>508 or asicMask<0 or asicMask>1023 or opMode<1 or opMode>3:
	print usageMSG
	exit(-1)

FixedWin=1;
if winStart==-1:
    FixedWin=0;

trigCSMD=0;
trigHW=0;

if trigType==2:
    trigCSMD=1;
    trigHW=1;
if trigType==1:
    trigCSMD=0;
    trigHW=1;
	
# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]


# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
ctrl.open()

# write received binary data into file
os.system("rm outdir/data.dat")

syncwd="000000010253594e4300000000" # must be send before every command string
trough_mode=0;

# set the stage by sending commands:
ctrl.send(syncwd+hex(int('AF3E0000',16) | FixedWin*(2**15) | FixedWin*winStart  ).split('x')[1]) #set win start
ctrl.send(syncwd+hex(int('AF360000',16) | 0  		| winOffset ).split('x')[1]) #set win offset
ctrl.send(syncwd+hex(int('AF330000',16) | trigCSMD*(2**15)   | 1023  ).split('x')[1]) #set asic enable bits for readout-- force readout all ASICs for CSMD
ctrl.send(syncwd+hex(int('AF260000',16) | opMode*(2**12) | trough_mode*(2**7) | 1*(2**6)).split('x')[1]) #set op mode
ctrl.send(syncwd+hex(int('AF270000',16) | trigHW*(2**15) | 0*(2**14) | trigCSMD*(2**13) |  asicMask ).split('x')[1]) #set asic enable bits for trig and trig mode
#ctrl.send(syncwd+hex(int('AF270000',16) | trigType*(2**15) | 0*(2**14) | 0*(2**13) |  asicMask ).split('x')[1]) #set trig mode
ctrl.send(syncwd+"AF4F0002");
#ctrl.send(syncwd+"AF4F0000");
	
#	constant EXTB_EXTENDED			: std_logic_vector(3 downto 0):=x"0";
#	constant EXTB_EDGE				: std_logic_vector(3 downto 0):=x"1";
#	constant EXTB_TB				: std_logic_vector(3 downto 0):=x"2";

if outputdatamode==0:
	ctrl.send(syncwd+'AF4A0012'); #set output data mode to full waveform

if outputdatamode==1:
	ctrl.send(syncwd+'AF4A0112'); #set output data mode to peaks/troughs only
	print outputdatamode;


#exit(0)
buffSize = 20000
f=open('outdir/data.dat','ab');

ctrl.send(syncwd+"AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000");

ctrl.send(syncwd+"AF25C000") # make sure we are not in auto trig mode
#ctrl.send(syncwd+"AF25C007") # set to auto trig mode- faster?
#internal_CMDREG_USE_EXTRIG<=internal_OUTPUT_REGISTERS(37)(2 downto 0);
#	--internal_CMDREG_USE_EXTRIG usuage:
#	--"100": use ex trig and read from fixed asic
#	--"101": use ex trig and increment asic number after each trigger
#	--"110": use internal counter trig and read from fixed asic
#	--"111": use internal counter trig and increment asic number after each trigger
#	internal_CMDREG_USE_EXTRIG_PERIOD<=internal_OUTPUT_REGISTERS(37)(15 downto 11);

#ctrl.send(syncwd+"AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000");

t1 = time.time();
for i in range(0, nEvts):
    #print "Packet #",i
    # Declare buffer size for receiving UDP Packets

    # Receive UDP packets
    # rcv is string of Hex
    if trigType==0:
      trig_cmd="AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000";
#      trig_cmd="AF320001AE000001AF320000";
      ctrl.send(syncwd+trig_cmd);
    
    time.sleep(.005);
    rcv = ctrl.receive(buffSize)
    time.sleep(0.001)
    length = len(rcv)/2
    if (i%200)==0:
#       print "Packet #"+str(i)+": length = "+str(length)+" bytes and header = "+rcv[0:32]+" "+rcv[16552:16610]
      print "Packet #"+str(i)+": length = "+str(length)+" bytes and header = "+rcv[0:32]+" "+rcv[length-10:length-1]
    rcv = linkEth.hexToBin(rcv)

    # write received binary data into file
    f.write(rcv)

ctrl.send(syncwd+"AF270000");
ctrl.send(syncwd+"AF25C000");
f.close();
#ctrl.send(syncwd+hex(int('AF270000',16) | 0*(2**15) | 0*(2**14) | 0*(2**13) |  asicMask ).split('x')[1]) #set trig mode

ctrl.close()

t2=time.time()

print "Time = "+str(t2-t1)+" sec(s) to complete"
