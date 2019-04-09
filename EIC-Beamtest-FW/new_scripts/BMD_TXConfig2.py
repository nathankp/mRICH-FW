#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

AUTHORS:
khanh le 9/6/17
tommy lam 8/9/18

DESCRIPTION:
Mode 0: sets detector to default values (DAC:0.95V and TH: 1550)
Mode 1: Does Baseline scan over DAC range set below for selected raw HV or rechecks baseline if scan has already been done
Mode 2: Does coincidence trigger rate scan for detector
Mode 3: programs detector with best values form selected coincidence trigger rate
Mode 4: Plots old data

NOTES: 
--All commands with x"xBxxxxxx" are for targetx registers
--Change Name of port used for communication (line 91)

--How to read
XX-XX-XXXX
The first two X's involve where you're sending the command and what DC
The second two X's involve what register you're talking to 
The last four X's are the register value

Ex1. FF-13-0001
FF is for the hodoscope DCs, and 0b1111 = 0xF so all four DCs 
0x13 = register 19 or trigger read enable
0001 is we want to change register 19 to be on  

Ex2. FF-12-0100
0x12 = register 18 or trigger count maximum 
0x0100 = 16^2 =  256 (tbh, I don't know what this exactly means. -Tommy)

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
usageMSG="\nUsage:BMD_dac_calb.py <ASIC mask>> <calibration mode> <rawHV> <ideal rate> <extra TH>\n"+\
"where:\n"+\
"ASIC mask : Binary mask for enabled asics:\n" +\
"            0=disable   1=dc1 only 2=dc2 only 3=dc 1&2\n"+\
"            4=dc3 only  5=dc 1&3   6=dc 2&3   7=dc 1-3\n"+\
"            8=dc4 only  9=dc 1&4   A=dc 2&4   B=dc 1,2&4\n"+\
"            C=dc 3&4    D=dc 1,3&4 E=dc 2-4   F=dc all\n"+\
"calc mode : 0 = Use fixed values [threshold 1550 and DAC 0.9V]\n"+\
"                Note: Input any offsets from 1550 into extra TH\n"+\
"            1 = Do initial or redo scan to find threshold base\n"+\
"                Note: Scan range HV-2V to HV-1V\n"+\
"            2 = Do scan to find best event trigger rate\n"+\
"                Note: Input any offset to raw HV in to extra TH\n"+\
"            3 = Program detector with best vlaues from file\n"+\
"                Note: Input any offset to best TH values in extra TH\n"+\
"            4 = Plot trigger data\n"+\
"                Note: Input raw HV of file to plot and plot mode in extra TH\n"+\
"                      Plot Mode: 1 = plot HVbias Vs rate on individual plot\n"+\
"                                 2 = plot all HVbias Vs rate in same plot\n"+\
"                                 3 = plot TH Vs rate on individual plot\n"+\
"Base rawHV: 0-100\n"+\
"Ideal Rate: Ideal coincidance trigger rate\n"+\
"Extra TH  : Extra threshold/HV offset for best values in file"

if len(sys.argv)!=6:
    print usageMSG
    exit(-1)

interface = "enp1s0f0"#sys.argv[1]
asicMask  = sys.argv[1]
CalbMode  = int(sys.argv[2]) 
rawHV     = float(sys.argv[3])
IF0       = int(sys.argv[4])
exth      = sys.argv[5]

if rawHV<0 or rawHV>100 or asicMask>"f" or CalbMode>4 or CalbMode<0:
    print usageMSG
    exit(-1)

#--------- ETHERNET CONFIGURATION ----------#
addr_fpga = '192.168.20.5' #address from the TX, this SHOULD not change unless thre's a firmware change
addr_pc = '192.168.20.1' #the address we should have on the network connection
port_pc = '28672'
port_fpga = '24576'


BiasVoltagefile = "./setting_bias_voltages.sh" #sets DAC HV and raw HV to get a optimal MPPC HV
						#uses BMD_sendCMD.py mode c to do this, using ./bias_voltages
						#note that on the board, there is a scaling for HV. This SHOULD have
						#been taken into account but can be confirmed by measuring the voltages on the DC

#sets high voltage based on MPPC voltage values #for a future version, this should be pre-incorporated into the script
if os.path.isfile(BiasVoltagefile) and rawHV!= 0.0:
	print("Using MPPC optimal voltage values from shell script")
	os.system("sudo %s" %(BiasVoltagefile))
	time.sleep(0.1)
	#outfile = open(caliball_file, 'a')
	print("moving on")
elif rawHV == 0:
	print("HV = 0, as instructed")
	cmd_dac_max = "FABCDABC"
	syncwd    ="000000010253594e4300000000" # must be send before every command string
	for i in range(16):
		if i != 10:
			cmd_dac_max += hex(int('FC00FFFF',16)|i*2**16).split('x')[1]
	cmd_dac_max += hex(int('FC0A0000',16)|int(0)).split('x')[1]

	ctrl.send(syncwd+cmd_dac_max)
	time.sleep(0.1)
else:
	print("I need a HV bias voltage configuraiton script OR no HV.")
	exit(-1) #it would be a good idea to maybe have a default setting here just in case. 



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
'''
range of channels to scan, Note: loop starts count at zero and doesn't count the last number in loop
So when setting channel range follow formula below
lower limit: subtracted 1 from desired start channel and input into ChSrt
upper limit: input desired end window into ChEnd
'''
ChEnd  = 13 # set to 1-15 
ChSrt  = 2 # starting channel

'''
Raw Hv range for scan, Note: to figure out HV bias range  use formula below
lower limit: HV bias = lower limit of raw HV - upper limit of trim DAC
upper limit: HV bias = upper limit of raw HV - lower limit of trim DAC
from pass scans MPPCs have a operating range between 73 and 76 

This was from Khanh 
For mRICH, this should have already been done in the very beginning
'''

# parameters for trim DAC scan
##should not be necessary
dac_UpVal   = 1.5   # dac scan upper limit, DAC max 2.5V(4095)
dac_LoVal   = 0.9 #change made by Tommy # dac scan lower limit set to ~0.8V(1300)
dac_Inc     = 0.1 # increment value for loop

# parameters for threshold scan
th_UpLim    = 220 # thresehold scan upper limit 4095
th_LoLim    = 1800 # thresehold scan lower limit 0 #was 1200 before 
th_delta    = 12    # thresehold increment value for course
th_offset   = 256  # thersehold offset for course scan, was 256

# parameters for finding baseline scan
THCntOffset = 10  # TH offset from TH base, from calc 1pe => ~40 ADC counts #was 20 before
f0          = 75  # 1.2pe trigger rate found in datasheet, used after fine scan [kHz]

# parameters for coincidence trigger scan
THRange     = 100   # range above baseline for scan
ReTH_delta  = 20   # threshold offset for baseline recheck scan, initially 20
mode2_exth  = 0    # extra threshold offset incase scan doesnt give a low enough rate


# file names for all scans below
BaseCalib_file = "outdir/CalbFiles/BMD_BaseCalib_RawHV:%2.2fV.txt" %(rawHV)
caliball_file  = "outdir/CalbFiles/BMD_CalibAll_RawHV:%2.2fV.txt" %(rawHV)
BestCalib_file = "outdir/CalbFiles/BMD_BestCalib_Freq:%dHz.txt" %(IF0)


T0        = (2**24)/(62.5e6) # count scalers for x"01000000"=2^24 clock cycles(T0 ~0.25sec, clock at 62.5MHz) 
syncwd    ="000000010253594e4300000000" # must be send before every command string
asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0')
dac_UpLim = int(1.5/0.0006105)
dac_LoLim = int(.8/0.0006105)
dac_delta = int(dac_Inc/0.0006105)
PlotMode  = 0
t1        = time.time()

#--------------------------------------------------------------------------------------------#
#--------- Programming SCROD snd DC registers------------------------------------------------#
#--------------------------------------------------------------------------------------------#
cmd = "0F000000"+"0F010001"+"0F050000"+"0F060000"+"0F07000"+asicMask+"0F080000"+"0F0C0000"+"0F120773"+"0F130000"+\
      "FABCDABC"+"FF000000"+"FF030080"+"FF040140"+"FF050000"+"FF060000"+"FF07000"+asicMask+"FF08000F"+"FF090000"+\
	  "FF0A0003"+"FF0C0000"+"FF0D0000"+"FF0E8001"+"FF0F0F00"+"FF120100"+"FF130000"+"FF000001"+"FF000000"+"FF0E0001"

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

# command sets all thresholds to zero #this should be fine for now since this is changable later -TL
cmd_th_zero = "FABCDABC"
for i in range(15):
	cmd_th_zero += hex(int('FB000000',16)|(2*i)*(2**16)).split('x')[1]
cmd_th_zero += "FB1E0FFF"

# command sets all trim DACs to MAX and inputed HV value 
#I don't think we want this command. This will be done manually -TL
#cmd_dac_max = "FABCDABC"
#for i in range(16):
#	if i != 10:
#		cmd_dac_max += hex(int('FC00FFFF',16)|i*2**16).split('x')[1]
#	cmd_dac_max += hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]
#THE THING FOR THIS SHOULD BE MOVED ABOVE


# setting registers in detector for scanning
if CalbMode != 4:
	# checking to see if all DC are online
	GOcnt = 0
	ENcnt = 0
	print("\nChecking link to all enabled DC")
	for dcnum in range(1, 5):
		dc_num = hex(dcnum).split('x')[1]
		if asic_mask[4-dcnum] == '1': 
			GOcnt += DCcheck(dcnum)
			ENcnt += 1
	if GOcnt == ENcnt:
		print "All DCs online continuing with calibration process"
	else:
		print "Please reprogram dead DCs or try to reset detector\n"
		quit(-1)

	ctrl.send(syncwd+cmd)
	time.sleep(.1)
	ctrl.send(syncwd+cmd_wbais)
	time.sleep(.1)
	ctrl.send(syncwd+cmd_tx)
	time.sleep(.1)
#-----------------------------------------------------------------------------------------------#
#---------programming detector with default values ---------------------------------------------#
#-----------------------------------------------------------------------------------------------#

#NOTE: THESE WERE KHANH'S DEFAULT VALUES
#This mode should be needed for mRICH
if CalbMode == 0:
	print "\nProgramming TargetX registers with default vlaues: threshold = 1500, Trim DACs = 1V, and HV = %2.3fV" %(rawHV)
	exth = int(exth)
	# if calibrated values aren't used set threshold to 1550
	cmd_th_def = "FABCDABC"
	for i in range(16):
		cmd_th_def += hex(int('FB000000',16)|(2*i)*(2**16)|1550+exth).split('x')[1]

	# if calibrated values aren't used setting HV to 73V and all trim dacs to 0.95V
	cmd_dac_def = "FABCDABC"
	for i in range(16):
		if i != 10:
			cmd_dac_def += hex(int('FC000000',16) | i*(2**16)|int(0.95/.0006105)).split('x')[1]
		cmd_dac_def +=hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]

	ctrl.send(syncwd+cmd_dac_def)
	time.sleep(.4)
	ctrl.send(syncwd+cmd_th_def)

#--------------------------------------------------------------------------------------------#
#----- proforming initial scan to find base values for all channels on all enabled asics ----#
#--------------------------------------------------------------------------------------------#	

#This guys takes a while. Needs to be optimized a bit to speed up (if desired)
#issues: finding an efficient way to terminate a lot easier and faster. It was okay before but I think I tried to constrain the range too much -TL

elif CalbMode == 1:
	# checking to see if file exist, if there program detector with vlaues in file
	if not os.path.isfile(BaseCalib_file):
		# selecting plot mode	
		PlotMode = int(exth)
		HV_UpLim = rawHV-dac_LoVal
		HV_LoLim = rawHV-dac_UpVal
		print "\nStarting calibration scan with HV bias range of %2.3f to %2.3f" %(HV_LoLim,HV_UpLim)

		# checking for old file and deleting file or writing header into output files
		if os.path.isfile(caliball_file):
			os.system("sudo rm %s" %(caliball_file))

		outfile = open(caliball_file, 'a')
		outfile.write("Note: For data set below HV bias range %2.3fV to %2.3fV(RawHV:%2.3fV)," %(HV_LoLim,HV_UpLim,rawHV))
		outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
		outfile.write("DC#\tCH#\tDAC[V]\tTH\tFreq[kHz]\tHVBias[V]\n")
		outfile.close()

		# setting all DACs to 2.5V and HV to selected value to start scan
		#ctrl.send(syncwd+cmd_dac_max) #already done
		#time.sleep(.1)
		ctrl.send(syncwd+cmd_th_zero)
		time.sleep(.1)

		hvBase = [[-1 for i in range(15)]for j in range(4)]
		thBase = [[-1 for i in range(15)]for j in range(4)]
		f_base = [[-1 for i in range(16)]for j in range(4)]
		wait_count = 0

		# setting current channel
		for ch in range(ChSrt,ChEnd):
			print "\n\n********** Starting scan for channel %d **********\n\n" %(ch+1) 
			minDeltaF = [20000 for i in range(4)]

			# setting trim dac value 
			for dac in range(dac_UpLim,dac_LoLim,-(dac_UpLim-dac_LoLim)): #this should terminate the loop "very" quickly, needs at least one iteration
				#UpLim = dac+int(th_offset/2)
				#LoLim = dac-th_offset	
				#if UpLim >= th_UpLim:
				#	UpLim = th_UpLim
				#elif LoLim <= 0:
				#	LoLim = 0

				dac_ch = linkEth.mppcToDAC_decoder(ch+1)
				dacVal = dac*0.0006105
				#cmd = "FABCDABC"+hex(int("FC000000",16)|dac_ch*2**16|dac).split('x')[1] #this should reset the signal
				#ctrl.send(syncwd+cmd)
				#time.sleep(0.1)


				#THIS IS THE SECTION THAT TAKES A WHILE


				#--------------------------------------------------------------------------------------------#
				#------- performing course threshold for all channels on all enabled asics ------------------#
				#--------------------------------------------------------------------------------------------#		
				#print "\nCurrent HV bias is %2.3fV [RawHV:%2.3fV, DAC:%1.3fV, TH range %d to %d]" %(rawHV-dacVal,rawHV,dacVal,UpLim,LoLim)	
				#print("Current threshold value is %d to %d [RawHV: %2.3fV]" %()				
				th_c = [1900 for i in range(4)]
				fmax = [-1 for i in range(4)]
				qc   = [0 for i in range(4)]

				print "**********Starting baseline scan for all enabled DC**********"
				for th in range(th_UpLim,th_LoLim,-th_delta):
					# setting th value and counting tigger scalers
					cmd = "FABCDABC"+hex(int('FB000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
						  "FF130001"+"FE000020"+"FF130000"
					#this sets the TX threshold value in register 1,3,5,...29 to "th", changes register 19 on, waits a bit, and turns register 19 off
					ctrl.send(syncwd+cmd)
					time.sleep(0.26) #Because of an earlier command, the wait time should be at least 0.25 sec
					#earlier command: FF120100 # setting max clock cycle count for trigger rate counting(0.25 sec)

					#reading back scaler counts from all enabled asics
					for dcnum in range(1, 5):
						dc_num = hex(dcnum).split('x')[1]
						if asic_mask[4-dcnum] == '1':
							if qc[dcnum-1] >= 5:
								continue
						
							scalerCount = int(readReg(dcnum,69))+int(readReg(dcnum,96)*2**16)
							#print(scalerCount)
							freq = (scalerCount)/(1000*T0)
							if scalerCount > 0:
								if (freq > fmax[dcnum-1]):
									fmax[dcnum-1] = freq
									th_c[dcnum-1] = th
									qc[dcnum-1] = 0
									print "New TH base value for DC:%d ch:%d TH:%d freq:%4.3fkHz(%7d)" %(dcnum,ch+1,th,freq,scalerCount)
								else:
									qc[dcnum-1] += 1
									print "DC:%d ch:%d TH:%d freq:%4.3fkHz(%7d) fMax:%4.3fkHz qc:%d" %(dcnum,ch+1,th,freq,scalerCount,fmax[dcnum-1],qc[dcnum-1])
							else:
								if qc[dcnum-1] > 0:
							 		qc[dcnum-1] += 1

					wait_count += 1
					if wait_count%50 == 0:
						print "Still scanning don't give up, threshold currently on %d" %(th)

					if np.sum(qc) >= 25:
						print "Breaking out of for loop at threshold %d for DC%d" %(th)
						break

				#--------------------------------------------------------------------------------------------#
				#------- performing fine threshold for all channels on all enabled asics --------------------#
				#--------------------------------------------------------------------------------------------#
				fmax = [-1 for i in range(4)]
				for dcnum in range(1, 5):
					dc_num = hex(dcnum).split('x')[1]	
					if asic_mask[4-dcnum] == '1':
						if th_c[dcnum-1] == 2200:
							print "DC%d no triggers were detected in course scan so skipping fine scan" %(dcnum)
							outfile = open(caliball_file, 'a')
							outfile.write("%d\t%d\t%.3f\t%d\t%.3f\t%.3f\n" %(dcnum,ch+1,dacVal,-1,0,float(rawHV-dacVal)))
							outfile.close()
						else:
							quit_count = 0
							f_UpLim = 2100
							f_LoLim = th_c[dcnum-1]
							if f_LoLim <= th_LoLim:
								f_LoLim = th_LoLim
					

							print "\n**********Starting fine threshold scan for DC%d [TH range %d to %d]**********" %(dcnum,f_UpLim,f_LoLim)
							for th in range(f_LoLim,f_UpLim,1):
								# setting th value and counting tigger scalers
								cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
									  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
								ctrl.send(syncwd+cmd)
								time.sleep(0.26)

								#reading back scaler counts from all enabled asics
								scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
								freq = (scalerCount)/(1000*T0)

								outfile = open(caliball_file, 'a')
								outfile.write("%d\t%d\t%.3f\t%d\t%.3f\t%.3f\n" %(dcnum,ch+1,dacVal,th,freq,float(rawHV-dacVal)))
								outfile.close()

								if scalerCount > 0:
									quit_count = 0
									#print(th)
									if (freq > fmax[dcnum-1] and th < 2100):
										fmax[dcnum-1] = freq
										th_c[dcnum-1] = th
										print "New TH base value for DC%d CH%d, DAC:%1.3fV TH:%d freq:%4.3fkHz" %(dcnum,ch+1,dacVal,th,freq)
									else:
										print "DC:%d CH:%d TH:%d freq:%4.3fkHz(%7d) qc:%d" %(dcnum,ch+1,th,freq,scalerCount,quit_count)
								else:
									if fmax[dcnum-1] > 0 or scalerCount <= 1:
										quit_count += 1

								#if quit_count == 13:
								#	print "breaking out of for loop at threshold %d" %(th)
								#	break

							#--------------------------------------------------------------------------------------------#
							#------- setting threshold with offset and counting trigger scalers ------------------------#
							#--------------------------------------------------------------------------------------------#
							THVal = th_c[dcnum-1]+THCntOffset	
							#if THVal >= th_UpLim:
							#	THVal = 1950
							
							print("Redoing scan for TH = %d"%(THVal))
							cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|THVal).split('x')[1]+\
									  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
							ctrl.send(syncwd+cmd)
							time.sleep(0.26)

							scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
							cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|THVal+1).split('x')[1]+\
									  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
							ctrl.send(syncwd+cmd)
							time.sleep(0.26)
							scalerCount += readReg(dcnum,69)+readReg(dcnum,96)*2**16
							#reading back scaler counts from all enabled asics
							
							freq = (scalerCount)/(1000*T0)

							
							print("Frequency is %.3f"%(freq))


							# looking for threshold and DAC setting that gives trigger rate closes to f0
							if abs(freq-f0) < minDeltaF[dcnum-1]: 
								hvBase[dcnum-1][ch] = dac
								thBase[dcnum-1][ch] = THVal
								f_base[dcnum-1][ch] = freq
								minDeltaF[dcnum-1]  = abs(freq-f0)
								#print("mistake")	
								print "New Best value for DC%d CH%d DAC:%.3fV TH:%d FBest:%.3fkHz" %(dcnum,ch+1,dacVal,THVal,freq)

				# writing footer for data
				outfile = open(caliball_file, 'a')
				outfile.write("%d\t%d\t%.3f\t%d\t%.3f\t%.3f\n" %(99,ch+1,dacVal,0,0,float(rawHV-dacVal)))
				outfile.close()

			# setting trim dac = max and th = min for channel and starting scan for next channel
			#cmd = "FABCDABC"+hex(int("FC000FFF",16)|dac_ch*2**16).split('x')[1]+hex(int('FB000000',16)|(2*ch)*(2**16)).split('x')[1]
			cmd = "FABCDABC"+hex(int('FB000000',16)|(2*ch)*(2**16)).split('x')[1]
			ctrl.send(syncwd+cmd)
			time.sleep(0.1)

		# saving base values in to file and program detector
		print "\nScan using raw HV set to %d complete saving base values into file" %(rawHV)
		outfile = open(BaseCalib_file, 'a')
		outfile.write("Note: For data set below Raw HV was set to %2.3f and was looking for trigger rate closes to %dkHz," %(rawHV,f0))
		outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
		outfile.write("DC\tCH#\tDAC\tTHBase\tFreq[kHz]\n")
		for dcnum in range(1, 5):
			if asic_mask[4-dcnum] == '1':	
				print "Base thresholds for DC%d" %(dcnum)
				for ch in range(ChSrt,ChEnd):
					outfile.write("%d\t%d\t%d\t%d\t%.3f\n" %(dcnum,ch+1,hvBase[dcnum-1][ch],thBase[dcnum-1][ch],f_base[dcnum-1][ch]))
					print "CH:%d DAC:%1.3fV TH:%4d F_Base:%.3fkHz" %(ch+1,hvBase[dcnum-1][ch]*0.0006105,thBase[dcnum-1][ch],f_base[dcnum-1][ch]) 
		outfile.close

#		os.system("sudo chmod 777 %s" %(caliball_file))
#		os.system("sudo chmod 777 %s" %(BaseCalib_file))

#--------------------------------------------------------------------------------------------#
#----- performing recheck scan to find base values for all channels on all enabled asics ----#
#--------------------------------------------------------------------------------------------#	


#SOME WORK MIGHT HAS TO HAPPEN ON THE ELSE LOOP!! GAHH -Tommy Lam
	else:
		print "\nReading base values from file and programming detector for scan"
		infile     = open(BaseCalib_file, 'r')
		csvFile    = csv.reader(infile, delimiter='\t')
		curr_line  = 0
		hvBase     = [[-1 for i in range(15)]for j in range(4)]
		thBase     = [[-1 for i in range(15)]for j in range(4)]
		FBase      = [[-1 for i in range(15)]for j in range(4)]

		# reading file and filling array
		for line in csvFile:
			curr_line += 1 	
			if curr_line > 2:
				ch = int(line[1])-1
				dcnum = int(line[0])-1
				hvBase[dcnum][ch] = int(line[2])
				thBase[dcnum][ch] = int(line[3])
				FBase[dcnum][ch] = float(line[4])

		# programming each DC with trim DAC base values from file
		for dcnum in range(1, 5):
			dc_num = hex(dcnum).split('x')[1]
			if asic_mask[4-dcnum] == '1':
				cmd = dc_num + "ABCDABC"
				for ch in range(ChSrt,ChEnd):
					dac_ch = linkEth.mppcToDAC_decoder((ch+1))
					cmd +=  dc_num + hex(int("C000000",16)|dac_ch*2**16|hvBase[dcnum-1][ch]).split('x')[1]
				ctrl.send(syncwd+cmd)
				time.sleep(.5)

		# setting threshold for all ch to 0 and HV for all DC
		#cmd16 = hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]
		#ctrl.send(syncwd+cmd_th_zero+cmd16)
		#time.sleep(.5)


		# starting recheck of basline scan
		for ch in range(ChSrt,ChEnd):
			print "\n**********Starting scan to double check baseline for CH%d**********" %(ch+1)
			fmax = [-1 for i in range(4)]
			for dcnum in range(1, 5):
				dc_num = hex(dcnum).split('x')[1]	
				if asic_mask[4-dcnum] == '1':
					quit_count = 0
					minDeltaF = 1000000000000000
					if thBase[dcnum-1][ch] == -1 or hvBase[dcnum-1][ch] == -1 or thBase[dcnum-1][ch] == 1550 or hvBase[dcnum-1][ch] == int(0.95/.0006105):
						print "No base value for DC:%d CH:%d so using default values [TH:1550, DAC:0.95V]" %(dcnum,ch+1)
						hvBase[dcnum-1][ch] = int(0.95/.0006105)
						thBase[dcnum-1][ch] = 1550
						FBase[dcnum-1][ch] = 0						
					else:
						f_UpLim = thBase[dcnum-1][ch]+ReTH_delta
						f_LoLim = thBase[dcnum-1][ch]-ReTH_delta
						if f_UpLim >= th_UpLim:
							f_UpLim = th_UpLim
						if f_LoLim <= th_LoLim:
							f_LoLim = th_LoLim

						print "Scanning DC:%d CH:%d TH range %d to %d, current best rate %.3fkHz at TH:%d" %(dcnum,ch+1,f_UpLim,f_LoLim,FBase[dcnum-1][ch],thBase[dcnum-1][ch])
						for th in range(f_UpLim,f_LoLim,-1):
							# setting th value and counting tigger scalers and counting trigger rate 5 times then averaging
							scalerCount = 0
							for i in range(5):
								if i == 0:
									cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
										  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
								else:
									cmd = dc_num+"ABCDABC"+dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
									#enable reg19, wait a bit, disable reg19//all on DC
								#print cmd
								ctrl.send(syncwd+cmd)
								time.sleep(0.5)

								#reading back scaler counts from all enabled asics
								ScalerTemp = readReg(dcnum,69)+readReg(dcnum,96)*2**16
								scalerCount = scalerCount+ScalerTemp
								#if ScalerTemp == 0:
								#	break

							ScalerAvg = scalerCount/5
							freq = (ScalerAvg)/(1000*T0)
							if scalerCount > 0:
								if abs(freq-f0) < minDeltaF:
									quit_count = 0
									minDeltaF = abs(freq-f0)
									
									# uncomment to save new best vlaue 
									thBase[dcnum-1][ch] = th
									FBase[dcnum-1][ch] = freq
									print "New TH base value for DC%d CH%d, DAC:%1.3fV TH:%d freq:%.3fkHz" %(dcnum,ch+1,hvBase[dcnum-1][ch]*0.0006015,th,freq)

#									# uncomment to keep old best value instend of best new value
#									if abs(freq-f0) < abs(FBase[dcnum-1][ch]-f0): 
#										thBase[dcnum-1][ch] = th
#										FBase[dcnum-1][ch] = freq
#										print "New TH base value for DC%d CH%d, DAC:%1.3fV TH:%d freq:%.3fkHz" %(dcnum,ch+1,hvBase[dcnum-1][ch]*0.0006015,th,freq)
#									else:
#										print "DC:%d CH:%d TH:%d freq:%.3fkHz(%7d) qc:%d" %(dcnum,ch+1,th,freq,ScalerAvg,quit_count)
								else:
									quit_count += 1
									print "DC:%d CH:%d TH:%d freq:%.3fkHz(%7d) qc:%d" %(dcnum,ch+1,th,freq,ScalerAvg,quit_count)
							else:
								if quit_count > 0:
									quit_count += 1

							if quit_count == 3:
								print "breaking out of for loop at threshold %d" %(th)
								break	

			# setting threshold to zero for current channel and starting scan for next channel
			cmd = "FABCDABC"+hex(int('FB000000',16)|(2*ch)*(2**16)).split('x')[1]
			ctrl.send(syncwd+cmd)
			time.sleep(0.1)

		# removing old base file and saving new base values into file
		print "\nScan to recheck baseline complete"
		os.system("sudo rm %s" %(BaseCalib_file))
		outfile = open(BaseCalib_file, 'a')
		outfile.write("Note: For data set below Raw HV was set to %2.3f and looking for trigger rate closes to %dkHz," %(rawHV,f0))
		outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
		outfile.write("DC#\tCH#\tDAC\tTHBase\tFreq[kHz]\n")
		for dcnum in range(1, 5):
			for ch in range(ChSrt,ChEnd):
				outfile.write("%d\t%d\t%d\t%d\t%.3f\n" %(dcnum,ch+1,hvBase[dcnum-1][ch],thBase[dcnum-1][ch],FBase[dcnum-1][ch]))
				print "DC:%d CH:%d DAC:%1.3fV TH:%4d F_Base:%.3fkHz" %(dcnum,ch+1,hvBase[dcnum-1][ch]*0.0006105,thBase[dcnum-1][ch],FBase[dcnum-1][ch]) 
		outfile.close()

#		os.system("sudo chmod 777 %s" %(BaseCalib_file))

#--------------------------------------------------------------------------------------------#
#------- performing scan to find ideal coincidence trigger rate -----------------------------#
#--------------------------------------------------------------------------------------------#
elif CalbMode == 2:
	exhv = float(exth)
	if os.path.isfile(BestCalib_file):
		os.system("sudo rm %s" %(BestCalib_file))
	
	infile     = open(BaseCalib_file, 'r')
	csvFile    = csv.reader(infile, delimiter='\t')
	curr_line  = 0
	thBest     = 0
	quit_count = 0
	hvBase     = [[-1 for i in range(15)]for j in range(4)]
	thBase     = [[-1 for i in range(15)]for j in range(4)]
	FBase      = [[-1 for i in range(15)]for j in range(4)]

	# reading file and filling array
	for line in csvFile:
		curr_line += 1 	
		if curr_line > 2:	
			ch = int(line[1])-1
			dcnum = int(line[0])-1
			if int(line[2]) == -1 or int(line[3]) == -1:
				hvBase[dcnum][ch] = int(0.95/.0006105)
				thBase[dcnum][ch] = 1900 #it should be somewhere near VPed,
				FBase[dcnum][ch] = 0
			else:
				hvBase[dcnum][ch] = int(line[2])
				thBase[dcnum][ch] = int(line[3])
				FBase[dcnum][ch] = float(line[4])

	# programming each DC with trim DAC base values from file
	for dcnum in range(1, 5):
		dc_num = hex(dcnum).split('x')[1]
		if asic_mask[4-dcnum] == '1':
			cmd = dc_num + "ABCDABC"
			for ch in range(ChSrt,ChEnd):
				dac_ch = linkEth.mppcToDAC_decoder((ch+1))
				cmd +=  dc_num + hex(int("C000000",16)|dac_ch*2**16|hvBase[dcnum-1][ch]).split('x')[1]
			ctrl.send(syncwd+cmd)
			time.sleep(.5)

	# setting threshold for ch 16 to 0 and HV for all DC
#	cmd16 = "FABCDABC"+"FB1E0000"+hex(int('FC0A0000',16)|int((rawHV+HV0ffset)/0.02442)).split('x')[1]
	cmd16 = hex(int('FC0A0000',16)|int((rawHV+exhv)/0.02442)).split('x')[1]
	ctrl.send(syncwd+cmd_th_zero+cmd16)
	time.sleep(.1)

	# rechecking threshold base and saving new values in array
	ctrl.send(syncwd+cmd_th_zero)
	time.sleep(.5)

	# starting coincidence trigger rate scan
	print "\n****Starting calibration scan, looking for coincidence trigger rate of %dHz with raw HV:%2.3f*****" %(IF0,rawHV+exhv)
	#minDeltaF = 1000000000000000 #this seems rather high
	minDeltaF = 100000
	f_best    = 0
	for th in range(THRange):
		# programming each DC with new threshold value 
		THtemp = th + mode2_exth 
		for dcnum in range(1, 5):
			dc_num = hex(dcnum).split('x')[1]
			if asic_mask[4-dcnum] == '1':
				cmd = dc_num + "ABCDABC"
				for ch in range(ChSrt,ChEnd):
					THVal = thBase[dcnum-1][ch]+THtemp-10
					#print("Threshold is " + str(THVal))
					if THVal >= 4095:
						THVal = 4095
					cmd += dc_num + hex(int("B000000",16)|(2*(ch))*(2**16)|THVal).split('x')[1]
				ctrl.send(syncwd+cmd)
				time.sleep(.6)	

		scalerCount = 0
		for i in range(5):
			# calculating coincidence trigger rate
			cmd = "0F130001"+"0E000020"+"0F130000" #F13 looks like for all DC, enable register 19, something with register zero, and then disenable register 19
			ctrl.send(syncwd+cmd)
			time.sleep(1.5)			
			ScalerTemp = readReg(0,69)+readReg(0,96)*2**16 #read the scalers you might expect

			scalerCount += ScalerTemp
		print(scalerCount)
		freq = scalerCount/5
		# looking for threshold setting that is gives trigger rate closes to f0 rate
		if scalerCount > 0:
			print("Scaler Count was not zero, yay!")
			if abs(freq-IF0) < minDeltaF: 
				thBest    = THtemp
				f_best    = freq
				minDeltaF = abs(freq-IF0)
				quit_count = 0	
				print "New Best trigger rate found at %d ADC counts above base, FBest:%.3fHz" %(THtemp,f_best)
			else:
				quit_count += 1
				print "Frequency at %d above base: %.3fHz qc:%d" %(THtemp,freq,quit_count)
		else:
			if f_best > 0:
				quit_count += 1
			print "No Trigger detected at %d ADC counts above base qc:%d" %(THtemp,quit_count)

		if quit_count == 10:
			print "Scan is on down trend breaking out of scan at %d" %(THtemp)
			break

	# programming detector with threshold values that give closes rate to ideal rate
	print "Programming detector with best value found"
	outfile = open(BestCalib_file, 'a')
	outfile.write("Note: For data set below Raw HV was set to %2.3f, and scan was looking for trigger rate closes to %dHz,Best Freq:%.3fHz." %(rawHV+exhv,IF0,f_best))
	outfile.write(" Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
	outfile.write("DC#\tCH#\tDAC\tTH\n")
	for dcnum in range(1, 5):
		dc_num = hex(dcnum).split('x')[1]
		if asic_mask[4-dcnum] == '1':
			cmd = dc_num + "ABCDABC"
			for ch in range(ChSrt,ChEnd):
				THVal = thBase[dcnum-1][ch]+thBest
				if THVal >= 4095:
					THVal = 4095
				cmd +=  dc_num + hex(int("B000000",16)|(2*(ch))*(2**16)|THVal).split('x')[1]	
				outfile.write("%d\t%d\t%d\t%d\n" %(dcnum,ch+1,hvBase[dcnum-1][ch],THVal))
			ctrl.send(syncwd+cmd)
			time.sleep(.5)
	outfile.close()

	os.system("sudo chmod 777 %s" %(BestCalib_file))
#--------------------------------------------------------------------------------------------#
#------- Reading and programing dc with calibrated values from file -------------------------#
#--------------------------------------------------------------------------------------------#
elif CalbMode == 3:
	print "\nReading best file for trigger rate of %d and programing all enabled asics with base values" %(IF0)
	infile = open(BestCalib_file, 'r')
	csvFile = csv.reader(infile, delimiter='\t')
	curr_line = 0
	exth = int(exth)

	for line in csvFile:
		curr_line += 1 	
		if curr_line > 2:	
			ch = int(line[1])
			dcnum = line[0]
			if asic_mask[4-int(dcnum)] == '1':
				dac_ch = linkEth.mppcToDAC_decoder(ch)
				if line[2] == "-1" or line[3] == "-1":
					print "No Base Value for DC%s CH%#d so setting to default(th:1550 DAC:0.95V)" %(dcnum, ch)	
					THVal  = 1550
					DACVal = int(0.95/.0006105)
				else:
					THVal = int(line[3])+exth
					if THVal >= 4095:
						THVal = 4095
					DACVal = int(line[2])	
					if DACVal >= 4095:
						DACVal = 4095	
					print "Setting DC#%s ch#%d threshold = %4d DAC = %2.3f" %(dcnum,ch,THVal,DACVal*0.0006105)
				cmd = dcnum+"ABCDABC"+dcnum+hex(int("B000000",16)|(2*(ch-1))*(2**16)|THVal).split('x')[1]+\
				      dcnum+hex(int("C000000",16)|dac_ch*2**16|DACVal).split('x')[1]
					  	
#					print cmd
				ctrl.send(syncwd+cmd)
				time.sleep(0.1)
	infile.close()

	# setting threshold for ch 16 to 3200 and HV for all DC
	print "HV for all DC set to %2.3fV" %(rawHV)
	cmd16 = "FABCDABC"+"FB1E0000"+hex(int('FC0A0000',16)|int((rawHV)/0.02442)).split('x')[1]
#		print cmd16
	ctrl.send(syncwd+cmd16)	


#--------------------------------------------------------------------------------------------#
#------- Setting plot mode and plotting data from file --------------------------------------#
#--------------------------------------------------------------------------------------------#

elif CalbMode == 4:
	PlotMode = int(exth)


#--------------------------------------------------------------------------------------------#
#------- plotting scan data -----------------------------------------------------------------#
#--------------------------------------------------------------------------------------------#
if PlotMode > 0: 
	for dcnum in range(1, 5):
		if asic_mask[4-dcnum] == '1':		
			Freq   = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
			DacVAl = array('d')
			THVAl  = array('d')
			TRate  = array('d')
			temp = array('d')
			# opening calibration file
			infile = open(caliball_file, 'r')
			csvFile = csv.reader(infile, delimiter='\t')
			CurLine = 0
			
			# reading file and palcing into array for ploting 
			for line in csvFile:
				if CurLine > 1:
					if int(line[0]) == dcnum:
						ch = int(line[1])
						Freq[ch-1].append(float(line[4]))
						THVAl.append(int(line[3]))
						TRate.append(float(line[4]))
						if int(line[1]) == ChSrt+1:
							DacVAl.append(float(line[2]))	

						if float(line[4]) > 0 and ch == 8 and  float(line[5]) == 71:
							temp.append(int(line[3]))
					elif int(line[0]) == 99:
						HVBias = float(line[5])
						TDAC = float(line[2])

						if PlotMode == 3:
							print "\nplotting calibration data from DC%d CH%d HVBias:%2.3fV" %(dcnum,ch,HVBias) 
							plt.plot(THVAl,TRate,color='blue', linestyle='none', marker='o',markerfacecolor='blue', markersize=2,\
							label='STD:%.3f' %(np.std(temp)))
							plt.yscale("log")
							plt.title('DC#%d CH#%d HVBias:%2.3fV' %(dcnum,ch,HVBias))
							plt.xlabel("Threshold")
							plt.ylabel("Trigger rate[kHz]")
							plt.legend(loc='best', frameon=False, prop={'size':15})
							plt.grid(True,which="both",ls="-")
#							plt.ylim(10e1,10e3)
#							plt.xlim(1500,1550)
							plotName = 'outdir/CalbFiles/plots/DC%d_CH#%d_calib_RawHV:%2.3fV_TDAC:%2.3fV.png' % (dcnum,ch,rawHV,TDAC)	
							plt.savefig(plotName)
							plt.clf()
						THVAl = array('d')
						TRate = array('d')
				CurLine += 1
				

			# plotting data
			if PlotMode == 1:
				print "\nplotting calibration data from DC%d on individual plots" %(dcnum) 
				for i in range(ChSrt,ChEnd):#[0]: 
					plt.plot(DacVAl,Freq[i],color='blue', linestyle='none', marker='o',markerfacecolor='black', markersize=2)
					plt.title('DC#%d CH#%d' %(dcnum,i+1))
					plt.xlabel("HV Bias[V]")
					plt.ylabel("Trigger rate[kHz]")
					plt.ylim(-10,int(max(Freq[i]))+10)
					plt.xlim(max(DacVAl),min(DacVAl))

					plotName = 'outdir/CalbFiles/plots/DC%d_CH#%d_calib_RawHV:%2.3fV.png' % (dcnum,i+1,rawHV)	
					plt.savefig(plotName)
					plt.clf()

			elif PlotMode == 2:
				print "\nplotting calibration data from DC%d on same plot" %(dcnum) 
				f, axarr = plt.subplots(4,4,sharex=True, sharey=True,figsize=(8,8))
				plt.suptitle("DC#%d calibration all channels" %(dcnum))
				f.text(0.5, 0.02, 'HV Bias[V]', ha='center')
				f.text(0.02, 0.5, 'Trigger rate[kHz]', va='center', rotation='vertical')
				MaxVal = 0
				for i in range(15):
					if MaxVal < int(max(Freq[i])):
						MaxVal = int(max(Freq[i]))

				for i in range(4):
					for j in range(4):
						if 4*i+j < 15:
							axarr[j,i].plot(DacVAl,Freq[4*i+j],color='blue', linestyle='none',marker='o',markerfacecolor='black',markersize=2)
							axarr[j,i].axes.set_ylim(-20,MaxVal+10)
							axarr[j,i].axes.set_xlim(max(DacVAl),min(DacVAl))
							axarr[j,i].set_title('CH %d' %(4*i+j+1))

				plotName = 'outdir/CalbFiles/plots/DC%d_CalibAll_RawHV:%2.3fV.png' % (dcnum,rawHV)	
				plt.savefig(plotName)
				plt.clf()


ctrl.close()
deltaTime = time.time() - t1
print "\nCalibration Complete. Time = %.3f hours to complete\n" % (deltaTime/3600)

