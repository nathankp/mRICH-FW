#!/usr/bin/env python

#tx_ethtakedatarecord1 <interface> <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <0 based ASIC no> <op mode>

import sys
import time
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth

usageMSG="Usage: tx_ethtakedatarecord1 <interface> <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <0 based ASIC no> <op mode> where:\n"+\
"num events>0 \ntrig type=0 or 1 \nWin Start= 0 .. 508\nWin offset= 0 .. 508\nASIC no = 0..9\nop mode=\n\t1: Pedestal subtracted data\n\t2: Pedestals only\n\t3: Raw Waveform only\n "
if len(sys.argv)!=8:
	print usageMSG
	exit(-1)


nEvts=int(sys.argv[2]);
trigType=int(sys.argv[3]);
winStart=int(sys.argv[4]);
winOffset=int(sys.argv[5]);
asicNo=int(sys.argv[6]);
opMode=int(sys.argv[7]);


if nEvts<0 or trigType<0 or trigType>1 or winStart<0 or winStart>508 or winOffset<0 or winOffset>508 or asicNo<0 or asicNo>9 or opMode<0 or opMode>3:
	print usageMSG
	exit(-1)


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
os.system("rm outdir/packetLen")

syncwd="000000010253594e4300000000" # must be send before every command string

ctrl.send(syncwd+"AF25C000") # make sure we are not in auto trig mode
# set the stage by sending commands:
ctrl.send(syncwd+hex(int('AF3E0000',16) | 2**15 | winStart  ).split('x')[1]) #set win start
ctrl.send(syncwd+hex(int('AF360000',16) | 0     | winOffset ).split('x')[1]) #set win offset
ctrl.send(syncwd+hex(int('AF330000',16) | 0     | 2** asicNo).split('x')[1]) #set asic no
ctrl.send(syncwd+hex(int('AF260000',16) | opMode*(2**12) | 2**7).split('x')[1]) #set op mode
#exit(0)

t1 = time.time()
for i in range(1, nEvts):
    #print "Packet #",i
    # Declare buffer size for receiving UDP Packets
    buffSize = 50000

    # Receive UDP packets
    # rcv is string of Hex

    trig_cmd="AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000";
    ctrl.send(syncwd+trig_cmd)

    rcv = ctrl.receive(buffSize)
    time.sleep(0.05)
    length = len(rcv)/2
    print "Packet #"+str(i)+": length = "+str(length)+" bytes and header = "+rcv[0:24]
    rcv = linkEth.hexToBin(rcv)

    # write received binary data into file
    with open('outdir/data.dat','ab') as f:
		f.write(rcv)


ctrl.close()

t2=time.time()

print "Time = "+str(t2-t1)+" sec(s) to complete"

