#!/usr/bin/env python
'''
OVERVIEW:
Used for live plots for prelim testing
 
AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and Isar
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

DESCRIPTION:
chmod +x tx_ethtakedataplot1.py
./tx_ethtakedataplot1 <interface> <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <0 based ASIC no> <op mode>
'''

import sys
import time
import os
import ROOT
from array import array
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    CYAN = '\033[96m'
    BROWN = '\033[33m'


usageMSG="Usage: takedata_plot1 <interface> <num events> <trig type: 0= SW, 1= HW> <Win start> <Win offset> <0 based ASIC no> <op mode> <y-axis min> <y-axis max> where:\nnum events>0 \ntrig type=0 or 1 \nWin Start= 0 .. 508\nWin offset= 0 .. 508\nASIC no = 0..9\nop mode=\n\t1: Pedestal subtracted data\n\t2: Pedestals only\n\t3: Raw Waveform only\n\t4: Mean Deviation\n "
if len(sys.argv)!=10:
    print usageMSG
    sys.exit()


nEvts=int(sys.argv[2]);
trigType=int(sys.argv[3]);
winStart=int(sys.argv[4]);
winOffset=int(sys.argv[5]);
asicNo=int(sys.argv[6]);
opMode=int(sys.argv[7]);
ymin=int(sys.argv[8]);
ymax=int(sys.argv[9]);

if nEvts<0 or trigType<0 or trigType>1 or winStart<-1 or winStart>508 or winOffset<0 or winOffset>508 or asicNo<0 or asicNo>9 or opMode<1 or opMode>4:
	print usageMSG
	sys.exit()

FixedWin=1;
if winStart==-1:
    FixedWin=0;

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]


# Make UDP class for receiving/sending UDP Packets
try:
    ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
except Exception, e:
    print bcolors.FAIL+"Error!!! ",e,bcolors.ENDC
    exc_type, exc_obj, exc_tb = sys.exc_info()
    fname = os.path.split(exc_tb.tb_frame.f_code.co_filename)[1]
    print bcolors.FAIL+str((exc_type, fname,"Line #"+str( exc_tb.tb_lineno)))+bcolors.ENDC
    print usageMSG
    sys.exit()
ctrl.open()

# write received binary data into file
os.system("rm outdir/data.dat")
os.system("rm outdir/packetLen")

syncwd="000000010253594e4300000000" # must be send before every command string
trough_mode=0;

ctrl.send(syncwd+"AF25C000") # make sure we are not in auto trig mode
# set the stage by sending commands:
ctrl.send(syncwd+hex(int('AF3E0000',16) | FixedWin*(2**15) | FixedWin*winStart  ).split('x')[1]) #set win start
ctrl.send(syncwd+hex(int('AF360000',16) | 0     | winOffset ).split('x')[1]) #set win offset
ctrl.send(syncwd+hex(int('AF330000',16) | 0     | 2**asicNo).split('x')[1]) #set asic no
#added register 87 for mean deviation values
# SW        FW
# opMode    registers(87)   registers(38)(13:12)	description
# 0         x               00              		disable
# 1         x               01              		pedestal subtract
# 2         0               10              		average pedestal values
# 3         x               11              		raw waveform
# 4         1               10              		average deviation values

if opMode == 4:
    ctrl.send(syncwd+hex(int('AF260000',16) | 2*(2**12) | trough_mode*2**7).split('x')[1]) #set op mode
    ctrl.send(syncwd+'AF570001')
else:
    ctrl.send(syncwd+hex(int('AF260000',16) | opMode*(2**12) | trough_mode*2**7).split('x')[1]) #set op mode
    ctrl.send(syncwd+'AF570000')

ctrl.send(syncwd+hex(int('AF270000',16) | trigType*(2**15) | 0*(2**14) | 0*(2**13) | 2**asicNo).split('x')[1]) #set trig mode
#exit(0)
ctrl.send(syncwd+"AF4F0002");
#ctrl.send(syncwd+"AF4F0000");
	
#	constant EXTB_EXTENDED			: std_logic_vector(3 downto 0):=x"0";
#	constant EXTB_EDGE				: std_logic_vector(3 downto 0):=x"1";
#	constant EXTB_TB				: std_logic_vector(3 downto 0):=x"2";
ctrl.send(syncwd+'AF4A0012'); #set output data mode to full waveform

c = ROOT.TCanvas('c', 'mycanvas')
mg = ROOT.TMultiGraph()

t = time.time()
for i in range(1, nEvts):
    tn1 = t
    t = time.time()
    print t - tn1
    #print "Packet #",i
    # Declare buffer size for receiving UDP Packets
    buffSize = 50000

    # Receive UDP packets
    # rcv is string of Hex

    trig_cmd="AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000";

    while(1):
        ctrl.send(syncwd+trig_cmd)

        rcv = ctrl.receive(buffSize)
        time.sleep(0.025)
        if rcv != 0:
            length = len(rcv)/2
            break
        else:
            print "Resending cmd..."
            time.sleep(.8)
    print "Packet #"+str(i)+": length = "+str(length)+" bytes and header = "+rcv[0:24]
    rcv = linkEth.hexToBin(rcv)

    # write received binary data into file
    with open('outdir/data.dat','wb') as f:
        f.write(rcv)


#ctrl.close()

    # Parse it
    os.system("sudo bin/tx_ethparse1 outdir/data.dat 0")


    ch = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
    sample = array( 'd' )
    pos_event = 0
    plot_count = 0
  
    #add back 3400 that parser subtracts for mean dev 
    if opMode == 4:
        offset = 3400
	div = 32
    else:
	offset = 0
	div = 1

    fIn = open('outdir/data.dat_asic_all.txt') # Read text file
    for line in fIn:
        line = line.replace(',',' ')  # Replace comma with blank space
        value = line.split()
        if (value!=[]):
            if int(value[2])<128:  # if a string or a value occur
                sample.append(float(value[2]))
                ch[0].append((float(value[4+1])+offset)/div)
                ch[1].append((float(value[5+1])+offset)/div)
                ch[2].append((float(value[6+1])+offset)/div)
                ch[3].append((float(value[7+1])+offset)/div)
                ch[4].append((float(value[8+1])+offset)/div)
                ch[5].append((float(value[9+1])+offset)/div)
                ch[6].append((float(value[10+1])+offset)/div)
                ch[7].append((float(value[11+1])+offset)/div)
                ch[8].append((float(value[12+1])+offset)/div)
                ch[9].append((float(value[13+1])+offset)/div)
                ch[10].append((float(value[14+1])+offset)/div)
                ch[11].append((float(value[15+1])+offset)/div)
                ch[12].append((float(value[16+1])+offset)/div)
                ch[13].append((float(value[17+1])+offset)/div)
                ch[14].append((float(value[18+1])+offset)/div)
                ch[15].append((float(value[19+1])+offset)/div)
            elif int(value[2])==129:
                #       
                #c = ROOT.TCanvas('c', 'mycanvas')
                mg = ROOT.TMultiGraph()#mg.Clear()
                #c.Clear() 
                # Plot all 16 channels in multigraph
                #for i in range(0, 16):
                for i in [3]:	
                    #print "Plotting Chan #"+str(i)
                    g = ROOT.TGraph(len(sample),sample,ch[i])
                    g.SetMarkerStyle(ROOT.kFullCircle)
                    g.SetMarkerSize(0.6)
                    if i != 11:# & i !=12:
                        g.SetMarkerColor(4)
                        g.SetMarkerSize(1) # brons addded this
                    if i == 11:
                        g.SetMarkerColor(2)
#                    if i == 12:
#                        g.SetMarkerColor(2)
                    #c.Update()
                    mg.Add(g) 
                    plot_count+=1
				
			
                mg.SetTitle("TXDC"+str(int(asicNo)+1)+": Channels 1-16")
                #mg.SetTitle("TXDC"+str(int(asicNo)+1)+": Pedestal for Channel 16")
                mg.Draw("APL")
                mg.GetXaxis().SetTitle("Sample #")
                mg.GetYaxis().SetTitle("ADC count")
                mg.SetMinimum(ymin);mg.SetMaximum(ymax) #full
#		if opMode == 1:
#                	mg.SetMinimum(-300);mg.SetMaximum(300) #ped sub
#               	elif opMode in [2, 3]:
#			mg.SetMinimum(-2300);mg.SetMaximum(-1700) #raw or ped
#		else: #opMode == 4
#			mg.SetMinimum(0);mg.SetMaximum(16) #mean dv
		c.Update()
                c.Modified();
                sample = array( 'd' )
                ch = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
                time.sleep(.8)
                plot_count = 0

ctrl.close()
