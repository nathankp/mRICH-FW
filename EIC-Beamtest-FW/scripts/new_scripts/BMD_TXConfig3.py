#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

AUTHORS:
khanh le 9/6/17

DESCRIPTION:
Mode 0: sets detector to default values (DAC:0.95V and TH: 1550)
Mode 1: Does Baseline scan over DAC range set below for selected raw HV or rechecks baseline if scan has already been done
Mode 2: Does coincidence trigger rate scan for detector
Mode 3: programs detector with best values form selected coincidence trigger rate
Mode 4: Plots old data

NOTES: 
--All commands with x"xBxxxxxx" are for targetx registers
--Change Name of port used for communication (line 91)

commands to scrod:
0F000000			# clearing reset signals
0F010001			# set top or bot plane identifier
0F050000			# clearing software trigger
0F060000			# seting trigger mode to software
0F0700"+asicMask    # set asic enable bits for readout
0F080000			# set data demux to send raw data 
0F0C0000			# set fixed win start
0F120773			# setting max clock cycle count for trigger rate counting(1 sec)
0F130000			# resetting count start signal

commands to dc:
FABCDABC			# clearing DC RX fifos
FF000000			# clearing state machine reset
FF030080			# setting tx dac load period
FF040140			# setting tx dac latch period
FF050000			# clearing software trigger
FF060000			# seting trigger mode to software
FF07000+asicMask	# set asic enable bits for readout
FF08000F			# seting wait count for scrod acknowledge
FF090000			# setting readout window offset and direction
FF0A0003			# setting number of windows to readout for each event
FF0C0000			# disabling fixed window readout(15) and setting window offset to zero(8-0)
FF0D0000			# disabling ped calc function(15) and setting N average to zero(3-0)
FF0E8001			# resetting sampling window counter and setting SSTIN clock gen parameters
FF0F0F00			# setting time to wait for digitization ramp 
FF120100			# setting max clock cycle count for trigger rate counting(0.25 sec)
FF130000			# resetting count start signal
FF000001			# resetting all state machines
FF000000			# clearing reset
FF0E0001			# clearing sampling window counter reset
'''

import sys
import time
import os
import csv
import matplotlib.pyplot as plt
import numpy as np
import scipy.stats as stats
from array import array
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth


#---------------- USAGE ----------------#
usageMSG="\nUsage:BMD_dac_calb.py <ASIC Num>> <SCROD EN> <rawHV> <Trim DAC>\n"+\
"where:\n"+\
"ASIC Num  : 0-4\n"+\
"SCROD EN  : 0 = Don't Program SCROD and DC Registers\n"+\
"            1 = Program SCROD and DC Registers\n"+\
"Base rawHV: 0-100\n"+\
"Trim DAC  : 0.8V-2V"

if len(sys.argv)!=5:
    print usageMSG
    exit(-1)

interface = "enp1s0f0"#sys.argv[1]
asicNum   = sys.argv[1]
SCROD_EN  = int(sys.argv[2]) 
rawHV     = float(sys.argv[3])
TDAC      = float(sys.argv[4])

#--------- ETHERNET CONFIGURATION ----------#
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
ctrl.open()

#-----------------------------------------------------------------------------------------------#
#------- Declearing a function to readback registers to make code shorter-----------------------#
#-----------------------------------------------------------------------------------------------#
def readReg(asic,RegNo):
	asic = int(asic)
	dc_num = hex(asic).split('x')[1]
	syncwd = "000000010253594e4300000000"
	buffSize = 200
	if asic == 0:
		cmd1 = dc_num+hex(int('D000000',16)|RegNo*2**16).split('x')[1]
	else:
		cmd1 = dc_num+"ABCDABC"+dc_num+hex(int('D000000',16) | RegNo*(2**16)).split('x')[1]
#	print cmd1
	ctrl.send(syncwd+cmd1)
	rcv = ctrl.receive(buffSize)
#	print rcv
	trys = 3
	for i in range(3):
		if rcv[32:40] == "64656164":#no response 
			if i == trys:
				print "\nDC#%d Reg#%d=DEADBEEF trys:%d" %(asic,RegNo,i)
				return 0
			else:
				ctrl.send(syncwd+cmd1)
				rcv = ctrl.receive(buffSize)
		else:
			if asic == 0:
				return int(rcv[36:40],16)
			else:
				return int(rcv[38:42],16)

def DCcheck(DCNUM):
	DCNUM = int(DCNUM)
	dc_num = hex(DCNUM).split('x')[1]
	syncwd = "000000010253594e4300000000"
	buffSize = 200
	cmd1 = dc_num+"D070000"
	ctrl.send(syncwd+cmd1)
	rcv = ctrl.receive(buffSize)
	if len(rcv)  > 28: 
		if rcv[32:40] == "64656164":#no response 
			print "DC%d DEADBEEF" %(DCNUM)
			return 0
		else:
			print "DC%d good to go" %(DCNUM)
			return 1
	else:
		print "DC%d DEADBEEF" %(DCNUM)
		return 0

#-----------------------------------------------------------------------------------------------#
#-----------------------------setting for scan--------------------------------------------------#
#-----------------------------------------------------------------------------------------------#
ch = 14 # channel count starts at zero, so inout one number lower than desired channel
dcnum = int(asicNum)
dac = int(TDAC/0.0006105)
dac_ch = linkEth.mppcToDAC_decoder(ch+1)
dacVal = TDAC
th_offset = 256
th_delta    = 4 
HVBias = rawHV-dacVal


# file names for all scans below
caliball_file  = "outdir/CalbFiles/BMD_CalibAll_RawHV:%2.2fV.txt" %(rawHV)

T0        = (2**24)/(62.5e6) # count scalers for x"01000000"=2^24 clock cycles(T0 ~0.25sec, clock at 62.5MHz) 
syncwd    ="000000010253594e4300000000" # must be send before every command string
t1        = time.time()

#--------------------------------------------------------------------------------------------#
#--------- Programming SCROD snd DC registers------------------------------------------------#
#--------------------------------------------------------------------------------------------#
cmd = "0F000000"+"0F010001"+"0F050000"+"0F060000"+"0F07000"+asicNum+"0F080000"+"0F0C0000"+"0F120773"+"0F130000"+\
      "FABCDABC"+"FF000000"+"FF030080"+"FF040140"+"FF050000"+"FF060000"+"FF07000"+asicNum+"FF08000F"+"FF090000"+\
	  "FF0A0003"+"FF0C0000"+"FF0D0000"+"FF0E8001"+"FF0F0F00"+"FF120100"+"FF130000"+"FF000011"+"FF000010"+"FF0E0001"

# setting for other tX register
# optimized values from bronson
cmd_tx = "FABCDABC"+"FB300514"+"FB310000"+"FB320A5A"+"FB33044C"+"FB3405DC"+"FB350426"+"FB3604B9"+\
		 "FB370001"+"FB380480"+"FB390000"+"FB3A08BB"+"FB3B0000"+"FB3D046A"+"FB3E044C"+"FB3F044C"+\
		 "FB400033"+"FB410007"+"FB420005"+"FB430019"+"FB440014"+"FB450028"+"FB460021"+"FB470035"+\
		 "FB480038"+"FB49000C"+"FB4A0028"+"FB4B003A"+"FB4C02E1"+"FB4D0C28"+"FB4E0480"+"FB4F0AAA"

# values from old config script
#cmd_tx = "FABCDABC"+"FB300514"+"FB310000"+"FB320A5A"+"FB33044C"+"FB3405DC"+"FB350426"+"FB3604B9"+"FB370001"+\
#		  "FB380480"+"FB390000"+"FB3A08BB"+"FB3B0000"+"FB3D04A6"+"FB3E044C"+"FB3F044C"+"FB400033"+\
#		  "FB4100A3"+"FB42000D"+"FB430021"+"FB440014"+"FB450028"+"FB460021"+"FB470035"+"FB480038"+\
#		  "FB49000C"+"FB4A0028"+"FB4B003A"+"FB4C02E1"+"FB4D0C28"+"FB4E0480"+"FB4F0AAA"


# settings for trigger plus width: 02A0=25ns, 0300=140ns, 0103=380ns
cmd_wbais = "FABCDABC"
for i in range(16):
	cmd_wbais += hex(int('FB000300',16)|((2*i)+1)*(2**16)).split('x')[1]

# command sets all thresholds to zero
cmd_th_zero = "FABCDABC"
for i in range(15):
	cmd_th_zero += hex(int('FB000000',16)|(2*i)*(2**16)).split('x')[1]
cmd_th_zero += "FB1E0FFF"

# command sets all trim DACs to MAX and inputed HV value
cmd_dac_max = "FABCDABC"
for i in range(16):
	if i != 10:
		cmd_dac_max += hex(int('FC00FFFF',16)|i*2**16).split('x')[1]
#	cmd_dac_max += hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]


# checking to see if all DC are online
GOcnt = 0
ENcnt = 0
print "\nChecking link to all enabled DC"
GOcnt += DCcheck(asicNum)
if GOcnt == 1:
	print "All DCs online continuing with calibration process"
else:
	print "Please reprogram dead DCs or try to reset detector\n"
	quit(-1)

# setting registers in detector for scanning
if SCROD_EN == 1:
	ctrl.send(syncwd+cmd)
	time.sleep(.5)
	ctrl.send(syncwd+cmd_wbais)
	time.sleep(.5)
	ctrl.send(syncwd+cmd_tx)
	time.sleep(.5)

	# setting all DACs to 2.5V and HV to selected value to start scan
	ctrl.send(syncwd+cmd_dac_max)
	time.sleep(.5)
	ctrl.send(syncwd+cmd_th_zero)
	time.sleep(.5)

# setting trim dac
cmd = asicNum+"ABCDABC"+asicNum+hex(int("C000000",16)|dac_ch*2**16|dac).split('x')[1]+\
      asicNum+hex(int("C0A0000",16)|int(rawHV/0.02442)).split('x')[1]
ctrl.send(syncwd+cmd)
time.sleep(0.2)

# looking for baseline
UpLim = int(2.5/0.0006105)
LoLim = int(0.6/0.0006105)
#UpLim = int(0.8/0.0006105)+int(th_offset/2)
#LoLim = int(0.8/0.0006105)-th_offset
#UpLim = dac+int(th_offset/2)
#LoLim = dac-th_offset
wait_count = 0	
th_c = -1
fmax = -1
qc   = 0
print "\nFinding baseline [TH range %d to %d]" %(UpLim,LoLim)
for th in range(UpLim,LoLim,-th_delta):
	# setting th value and counting tigger scalers
	cmd = asicNum+"ABCDABC"+asicNum+hex(int('B000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
		  asicNum+"F130001"+asicNum+"E000020"+asicNum+"F130000"
	ctrl.send(syncwd+cmd)
	time.sleep(0.5)

	# reading back trigger rate
	scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
	freq = (scalerCount)/(1000*T0)
	if scalerCount > 0:
		if (freq > fmax):
			fmax = freq
			th_c = th
			qc = 0
			print "New TH base value for DC:%d ch:%d TH:%d freq:%4.2fkHz(%7d)" %(dcnum,ch+1,th,freq,scalerCount)
		else:
			qc += 1
			print "DC:%d ch:%d TH:%d freq:%4.2fkHz(%7d) fMax:%4.2fkHz qc:%d" %(dcnum,ch+1,th,freq,scalerCount,fmax,qc)
	else:
		if qc > 0:
	 		qc += 1
		wait_count += 1
		if wait_count%50 == 0:
			print "Still scanning don't give up, threshold currently on %d" %(th)

	if qc == 5:
		print "Breaking out of for loop at threshold %d" %(th)
		break


if th_c == -1:
	print "No baseline was found"
	quit(-1)

# starting scan for pe stuff
if os.path.isfile(caliball_file):
	os.system("sudo rm %s" %(caliball_file))
outfile = open(caliball_file, 'a')
outfile.write("Note: For data set below RawHV:%2.2fV TrimDAC:%2.2fV," %(rawHV,dacVal))
outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
outfile.write("DC#\tCH#\tTH\tT_cnt\tFreq[kHz]\n")
outfile.close()
qc   = 0
freq = -1
lastfreq = 0
#th_c = 1500
f_UpLim = 4095
f_LoLim = th_c-30
print "\nStarting scan for HVBias %2.2fV [Th range %d to %d]" %(HVBias,f_LoLim,f_UpLim)
for th in range(f_LoLim,f_UpLim,1):
	# setting th value and counting tigger scalers
	cmd = asicNum+"ABCDABC"+asicNum+hex(int('B000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
		  asicNum+"F130001"+asicNum+"E000020"+asicNum+"F130000"
	ctrl.send(syncwd+cmd)
	time.sleep(0.5)

	# reading back trigger rate
	scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
	freq = (scalerCount)/(1000*T0)
	outfile = open(caliball_file, 'a')
	outfile.write("%d\t%d\t%d\t%d\t%.2f\n" %(dcnum,ch+1,th,scalerCount,freq))
	outfile.close()
	print "TH:%d Freq:%.2fKHz(%d) qc:%d" %(th,freq,scalerCount,qc)
	if scalerCount > 0:
		if freq > lastfreq:
			lastfreq = freq
		qc = 0
	else:
		if lastfreq > 0:
			qc += 1
	
	if qc == 5:
		break

# plotting data
infile = open(caliball_file, 'r')
csvFile = csv.reader(infile, delimiter='\t')
CurLine = 0

# reading file and palcing into array for ploting
TrigRate = array('d')
Threshold = array('d')

for line in csvFile:
	if CurLine > 1:
		if int(line[3]) == 0:
			TrigRate.append(0)
		else:
			TrigRate.append(float(line[4]))
		Threshold.append(int(line[2]))
	CurLine += 1

print "\nplotting calibration data from DC%d on individual plots" %(dcnum) 
plt.plot(Threshold,TrigRate,color='blue', linestyle='none', marker='o',markerfacecolor='blue', markersize=2)
plt.yscale("log")
plt.title('DC#%d CH#%d HVBias:%2.2fV' %(dcnum,ch+1,HVBias))
plt.xlabel("Threshold")
plt.ylabel("Trigger rate[kHz]")
plt.ylim(10e1,10e3)
plt.xlim(1500,1520)

plotName = 'outdir/trim_dac_calb/plots/DC%d_CH#%d_calib_RawHV:%2.2fV_TDAC:%2.2fV.png' % (dcnum,ch+1,rawHV,TDAC)	
plt.savefig(plotName)
plt.clf()


ctrl.close()
deltaTime = time.time() - t1
print "\nCalibration Complete. Time = %.2f hours to complete\n" % (deltaTime/3600)

