#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

AUTHORS:
khanh le 9/6/17
Tommy Lam 7/24/18

Editors: 
Tommy Lam 7/24/18
Dawei Yang 7/13/18

DESCRIPTION:
Mode 0: sets detector to default values (DAC:0.95V and TH: 1550)
Mode 1: Does Baseline scan over DAC range set below for selected raw HV or rechecks baseline if scan has already been done
Mode 2: Does coincidence trigger rate scan for detector
Mode 3: programs detector with best values form selected coincidence trigger rate
Mode 4: Plots old data

NOTES: 
--All commands with x"xBxxxxxx" are for targetx registers
--Change Name of port used for communication (line 91)
--interface might need to be changed (Tommy L.)

commands to scrod:
0F000000			# clearing reset signals
0F010001			# set top or bot plane identifier
0F050000			# clearing software trigger
0F060000			# setting trigger mode to software
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
usageMSG="\nUsage:BMD_dac_calb.py <ASIC mask> <calibration mode> <rawHV> <ideal rate> <extra TH>\n"+\
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
"            3 = Program detector with best values from file\n"+\
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


asicMask  = sys.argv[1]
CalbMode  = int(sys.argv[2]) 
rawHV     = float(sys.argv[3]) #~56V for the MPPC
IF0       = int(sys.argv[4]) #Ideal frequency
exth      = sys.argv[5]

if rawHV<0 or rawHV>100 or asicMask>"f" or CalbMode>4 or CalbMode<0:
    print usageMSG
    exit(-1)


interface = "eth2"#sys.argv[1]   #MIGHT NEED MODIFYING

#--------- ETHERNET CONFIGURATION ----------#   #already set in firmware, no need to change these lines
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
	#dc_num = hex(asic).split('x')[1] #no need to do this, TL
    dc_num = str(asic)
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
				print "\nDC#%d Reg#%d=DEADBEEF, given up after %d attempts" %(asic,RegNo,i)
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
	dc_num = str(DCNUM)
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
		print "DC%d DEADBEEF..." %(DCNUM)
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

ChSrt_raw = raw_input("Starting channel (from 1 to 15)? \nInput: ") 
ChEnd_raw = raw_input("Last Channel? (goes up to 15) \nInput:")

if int(ChSrt_raw) > 0 and int(ChEnd_raw) > 0 and int(ChSrt_raw) < 16 and int(ChEnd_raw) < 16:
	ChStr = int(ChSrt_raw)-1 #accounts for the comment above
	ChEnd = int(ChEnd_raw)
	print "Will sweep from %i up to (and including) %i"%(ChStr+1, ChEnd)
else:
	ChStr = 0
	ChEnd = 3
	print "Using default values. Will sweep Ch. 1, 2, and 3 \n"


#ChEnd  = 1 # set to 1-15 
#ChSrt  = 0 # starting channel

'''
Raw Hv range for scan, Note: to figure out HV bias range  use formula below
lower limit: HV bias = lower limit of raw HV - upper limit of trim DAC
upper limit: HV bias = upper limit of raw HV - lower limit of trim DAC
from past scans MPPCs have a operating range between 73 and 76

From Tommy: We are given the optimal voltage already so it is sufficient to set them using BMD_sendCMD.py
'''


# parameters for trim DAC scan
dac_UpVal   = 1.4   # dac scan upper limit, DAC max 2.5V(4095)
dac_LoVal   = 0.9 # dac scan lower limit set to ~0.8V(1300)
dac_Inc     = 0.1 # increment value for loop
#recall that trimDAC ~ Vped (inside the targetX). Since we have Vped ~ 1.2V, we'll looking within this range

# parameters for threshold scan
th_UpLim    = 4095 # threshold scan upper limit 4095
th_LoLim    = 1200 # threshold scan lower limit 0
th_delta    = 8    # threshold increment value for course
th_offset   = 256  # threshold offset for course scan


# parameters for finding baseline scan
#THCntOffset = 20  # TH offset from TH base, from calc 1pe => ~40 ADC counts #this was for Khanh's BMD
THCntOffset = 140  # TH offset from TH base, from calc 1pe => ~ ADC counts #Gain = 7
f0          = 75  # 1.2pe trigger rate found in datasheet, used after fine scan [kHz]

# parameters for coincidence trigger scan
THRange     = 50   # range above baseline for scan
ReTH_delta  = 20   # threshold offset for baseline recheck scan
mode2_exth  = 0    # extra threshold offset incase scan doesnt give a low enough rate


# file names for all scans below
BaseCalib_file = "outdir/CalbFiles/BMD_BaseCalib_RawHV:%2.2fV.txt" %(rawHV)
caliball_file  = "outdir/CalbFiles/BMD_CalibAll_RawHV:%2.2fV.txt" %(rawHV)
BestCalib_file = "outdir/CalbFiles/BMD_BestCalib_Freq:%dHz.txt" %(IF0)

T0        = (2**24)/(62.5e6) # count scalers for x"01000000"=2^24 clock cycles(T0 ~0.25sec, clock at 62.5MHz) 
syncwd    ="000000010253594e4300000000" # must be sent before every command string
asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0')
dac_UpLim = int(dac_UpVal/0.0006105)
dac_LoLim = int(dac_LoVal/0.0006105)
dac_delta = int(dac_Inc/0.0006105)
PlotMode  = 0
t1        = time.time()


#--------------------------------------------------------------------------------------------#
#--------- Programming SCROD and DC registers------------------------------------------------#
#--------------------------------------------------------------------------------------------#
cmd = "0F000000"+"0F010001"+"0F050000"+"0F060000"+"0F07000"+asicMask+"0F080000"+"0F0C0000"+"0F120773"+"0F130000"+\
      "FABCDABC"+"FF000000"+"FF030080"+"FF040140"+"FF050000"+"FF060000"+"FF07000"+asicMask+"FF08000F"+"FF090000"+\
	  "FF0A0003"+"FF0C0000"+"FF0D0000"+"FF0E8001"+"FF0F0F00"+"FF120100"+"FF130000"+"FF000001"+"FF000000"+"FF0E0001"
#sends the packet to the SCROD to set all the registers 

# setting for other tX register (tX == )
# optimized values from bronson
cmd_tx = "FABCDABC"+"FB300514"+"FB310000"+"FB320A5A"+"FB33044C"+"FB3405DC"+"FB350426"+"FB3604B9"+\
		 "FB370001"+"FB380480"+"FB390000"+"FB3A08BB"+"FB3B0000"+"FB3D046A"+"FB3E044C"+"FB3F044C"+\
		 "FB400033"+"FB410007"+"FB420005"+"FB430019"+"FB440014"+"FB450028"+"FB460021"+"FB470035"+\
		 "FB480038"+"FB49000C"+"FB4A0028"+"FB4B003A"+"FB4C02E1"+"FB4D0C28"+"FB4E0480"+"FB4F0AAA"


# settings for trigger plus width: 02A0=25ns, 0300=140ns, 0103=380ns
cmd_wbias = "FABCDABC"
for i in range(16):
	cmd_wbias += hex(int('FB000300',16)|((2*i)+1)*(2**16)).split('x')[1]

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
	cmd_dac_max += hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]



# setting registers in detector for scanning
if CalbMode != 4:
	# checking to see if all DC are online
	GOcnt = 0
	ENcnt = 0
	print "\nChecking link to all enabled DC"
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
	ctrl.send(syncwd+cmd_wbias)
	time.sleep(.1)
	ctrl.send(syncwd+cmd_tx)
	time.sleep(.1)


    
if CalbMode == 0:
	print "\nProgramming TargetX registers with default vlaues: threshold = 1500, Trim DACs = 1V, and HV = %2.2fV" %(rawHV)
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
	time.sleep(.1)
	ctrl.send(syncwd+cmd_th_def)

#--------------------------------------------------------------------------------------------#
#----- proforming initial scan to find base values for all channels on all enabled asics ----#
#--------------------------------------------------------------------------------------------#	
elif CalbMode == 1:
	# checking to see if file exist, if there program detector with values in file

	if not os.path.isfile(BaseCalib_file):
		# selecting plot mode	
		PlotMode = int(exth)
		HV_UpLim = rawHV-dac_LoVal
		HV_LoLim = rawHV-dac_UpVal
		print "\nStarting calibration scan with HV bias range of %2.2f to %2.2f" %(HV_LoLim,HV_UpLim)



		# checking for old file and deleting file or writing header into output files
	##	Delete the old file ?
		if os.path.isfile(caliball_file):
			flag = raw_input("Do you want to delete the old caliball_file and generate a new one?\nOptions: y->yes, q->quit, otherwise->no \n Input: ")
			if flag == 'y' or "Y" or "yes" or "Yes" or "YES":
				os.system("sudo rm %s" %(caliball_file))
			elif flag == "q" or "Q" or "quit" or "Quit":
				print "Quitting now..."
				quit(-1)
			else:
				pass


		outfile = open(caliball_file, 'a')
		outfile.write("Note: For data set below HV bias range %2.2fV to %2.2fV(RawHV:%2.2fV)," %(HV_LoLim,HV_UpLim,rawHV))
		outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
		outfile.write("DC#\tCH#\tDAC[V]\tTH\tFreq[kHz]\tHVBias[V]\n")
		outfile.close()

		# setting all trimDACs to 2.5V and HV to selected value to start scan
		ctrl.send(syncwd+cmd_dac_max)
		time.sleep(.1)
		ctrl.send(syncwd+cmd_th_zero)
		time.sleep(.1)

		hvBase = [[-1 for i in range(15)]for j in range(4)]
		thBase = [[-1 for i in range(15)]for j in range(4)]
		f_base = [[-1 for i in range(16)]for j in range(4)]
		wait_count = 0

		# setting current channel
		for ch in range(ChSrt,ChEnd):
			print "********** Starting scan for channel %d **********" %(ch+1) 
			minDeltaF = [20000 for i in range(4)]

			# setting trim dac value 
			for dac in range(dac_UpLim,dac_LoLim,-dac_delta):
				UpLim = dac+int(th_offset/2)
				LoLim = dac-th_offset	
				if UpLim >= th_UpLim:
					UpLim = th_UpLim
				elif LoLim <= 0:
					LoLim = 0

				dac_ch = linkEth.mppcToDAC_decoder(ch+1)
				dacVal = dac*0.0006105
				cmd = "FABCDABC"+hex(int("FC000000",16)|dac_ch*2**16|dac).split('x')[1]
				ctrl.send(syncwd+cmd)
				time.sleep(0.1)

				#--------------------------------------------------------------------------------------------#
				#------- performing course threshold for all channels on all enabled asics ------------------#
				#--------------------------------------------------------------------------------------------#		
				print "\nCurrent HV bias is %2.2fV [RawHV:%2.2fV, DAC:%1.2fV, TH range %d to %d]" %(rawHV-dacVal,rawHV,dacVal,UpLim,LoLim)	
				th_c = [UpLim for i in range(4)]
				fmax = [-1 for i in range(4)]
				qc   = [0 for i in range(4)]

				print "**********Starting baseline scan for all enabled DC**********"
				for th in range(UpLim,LoLim,-th_delta):
					# setting th value and counting tigger scalers
					cmd = "FABCDABC"+hex(int('FB000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
						  "FF130001"+"FE000020"+"FF130000"
					ctrl.send(syncwd+cmd)
					time.sleep(0.5)

					#reading back scaler counts from all enabled asics
					for dcnum in range(1, 5):
						dc_num = hex(dcnum).split('x')[1]
						if asic_mask[4-dcnum] == '1':
							if qc[dcnum-1] >= 5:
								continue
						    time.sleep(0.1)
							scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
							print(  "Register 69: " + str(readReg(dcnum,69)) + "\nRegister 96 = " + str(readReg(dcnum,96)) +"\n" )
							freq = (scalerCount)/(1000*T0)
							if scalerCount > 0:
                                print "Scalar counter is greater than zero!"
								if (freq > fmax[dcnum-1]):
									fmax[dcnum-1] = freq
									th_c[dcnum-1] = th
									qc[dcnum-1] = 0
									print "New TH base value for DC:%d ch:%d TH:%d freq:%4.2fkHz(%7d)" %(dcnum,ch+1,th,freq,scalerCount)
								else:
									qc[dcnum-1] += 1
									print "DC:%d ch:%d TH:%d freq:%4.2fkHz(%7d) fMax:%4.2fkHz qc:%d" %(dcnum,ch+1,th,freq,scalerCount,fmax[dcnum-1],qc[dcnum-1])
							else:
								if qc[dcnum-1] > 0:
							 	    qc[dcnum-1] += 1

					wait_count += 1
					if wait_count%50 == 0:
						print "Still scanning don't give up, threshold currently on %d" %(th)

					if np.sum(qc) >= 25:
						print "Breaking out of 'for loop' at threshold %d for DC%d" %(th)
						break

				#--------------------------------------------------------------------------------------------#
				#------- performing fine threshold for all channels on all enabled asics --------------------#
				#--------------------------------------------------------------------------------------------#
				fmax = [-1 for i in range(4)]
				for dcnum in range(1, 5):
					dc_num = hex(dcnum).split('x')[1]	
					if asic_mask[4-dcnum] == '1':
						if th_c[dcnum-1] == UpLim:
							print "DC%d no triggers were detected in course scan so skipping fine scan" %(dcnum)
							outfile = open(caliball_file, 'a')
							outfile.write("%d\t%d\t%.2f\t%d\t%.2f\t%.2f\n" %(dcnum,ch+1,dacVal,-1,0,float(rawHV-dacVal)))
							outfile.close()
						else:
							quit_count = 0
							f_UpLim = 4095 
							f_LoLim = th_c[dcnum-1]-30
							if f_LoLim <= th_LoLim:
								f_LoLim = th_LoLim

							print "\n**********Starting fine threshold scan for DC%d [TH range %d to %d]**********" %(dcnum,f_UpLim,f_LoLim)
							for th in range(f_LoLim,f_UpLim,1):
								# setting th value and counting tigger scalers
								cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
									  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
								ctrl.send(syncwd+cmd)
								time.sleep(0.5)

								#reading back scaler counts from all enabled asics
								scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
								freq = (scalerCount)/(1000*T0)

								outfile = open(caliball_file, 'a')
								outfile.write("%d\t%d\t%.2f\t%d\t%.2f\t%.2f\n" %(dcnum,ch+1,dacVal,th,freq,float(rawHV-dacVal)))
								outfile.close()

								if scalerCount > 0:
									quit_count = 0
									if (freq > fmax[dcnum-1]):
										fmax[dcnum-1] = freq
										th_c[dcnum-1] = th
										print "New TH base value for DC%d CH%d, DAC:%1.2fV TH:%d freq:%4.2fkHz" %(dcnum,ch+1,dacVal,th,freq)
									else:
										print "DC:%d CH:%d TH:%d freq:%4.2fkHz(%7d) qc:%d" %(dcnum,ch+1,th,freq,scalerCount,quit_count)
								else:
									if fmax[dcnum-1] > 0:
										quit_count += 1

								if quit_count == 3:
									print "breaking out of for loop at threshold %d" %(th)
									break

							#--------------------------------------------------------------------------------------------#
							#------- setting threshold with offset and counting trigger scalers ------------------------#
							#--------------------------------------------------------------------------------------------#
							THVal = th_c[dcnum-1]+THCntOffset	
							if 	THVal >= th_UpLim:
								THVal = th_UpLim
				
							cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|THVal).split('x')[1]+\
								  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"	
							ctrl.send(syncwd+cmd)
							time.sleep(0.5)

							# reading back scaler count saving to file
							scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
							freq = (scalerCount)/(1000*T0)

							# looking for threshold and DAC setting that gives trigger rate closes to f0
							if abs(freq-f0) < minDeltaF[dcnum-1]: 
								hvBase[dcnum-1][ch] = dac
								thBase[dcnum-1][ch] = THVal
								f_base[dcnum-1][ch] = freq
								minDeltaF[dcnum-1]  = abs(freq-f0)	
								print "New Best value for DC%d CH%d DAC:%.2fV TH:%d FBest:%.2fkHz" %(dcnum,ch+1,dacVal,THVal,freq)

				# writing footer for data
				outfile = open(caliball_file, 'a')
				outfile.write("%d\t%d\t%.2f\t%d\t%.2f\t%.2f\n" %(99,ch+1,dacVal,0,0,float(rawHV-dacVal)))
				outfile.close()

			# setting trim dac = max and th = min for channel and starting scan for next channel
			cmd = "FABCDABC"+hex(int("FC000FFF",16)|dac_ch*2**16).split('x')[1]+hex(int('FB000000',16)|(2*ch)*(2**16)).split('x')[1]
			ctrl.send(syncwd+cmd)
			time.sleep(0.1)

		# saving base values in to file and program detector
		print "\nScan using raw HV set to %d complete saving base values into file" %(rawHV)
		outfile = open(BaseCalib_file, 'a')
		outfile.write("Note: For data set below Raw HV was set to %2.2f and was looking for trigger rate closes to %dkHz," %(rawHV,f0))
		outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
		outfile.write("DC\tCH#\tDAC\tTHBase\tFreq[kHz]\n")
		for dcnum in range(1, 5):
			if asic_mask[4-dcnum] == '1':	
				print "Base thresholds for DC%d" %(dcnum)
				for ch in range(ChSrt,ChEnd):
					outfile.write("%d\t%d\t%d\t%d\t%.2f\n" %(dcnum,ch+1,hvBase[dcnum-1][ch],thBase[dcnum-1][ch],f_base[dcnum-1][ch]))
					print "CH:%d DAC:%1.2fV TH:%4d F_Base:%.2fkHz" %(ch+1,hvBase[dcnum-1][ch]*0.0006105,thBase[dcnum-1][ch],f_base[dcnum-1][ch]) 
		outfile.close

#		os.system("sudo chmod 777 %s" %(caliball_file))
#		os.system("sudo chmod 777 %s" %(BaseCalib_file))

#--------------------------------------------------------------------------------------------#
#----- performing recheck scan to find base values for all channels on all enabled asics ----#
#--------------------------------------------------------------------------------------------#	
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
		cmd16 = hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]
		ctrl.send(syncwd+cmd_th_zero+cmd16)
		time.sleep(.5)


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

						print "Scanning DC:%d CH:%d TH range %d to %d, current best rate %.2fkHz at TH:%d" %(dcnum,ch+1,f_UpLim,f_LoLim,FBase[dcnum-1][ch],thBase[dcnum-1][ch])
						for th in range(f_UpLim,f_LoLim,-1):
							# setting th value and counting tigger scalers and counting trigger rate 5 times then averaging
							scalerCount = 0
							for i in range(5):
								if i == 0:
									cmd = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|th).split('x')[1]+\
										  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
								else:
									cmd = dc_num+"ABCDABC"+dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
	#							print cmd
								ctrl.send(syncwd+cmd)
								time.sleep(0.5)

								#reading back scaler counts from all enabled asics
								ScalerTemp = readReg(dcnum,69)+readReg(dcnum,96)*2**16
								scalerCount = scalerCount+ScalerTemp
								if ScalerTemp == 0:
									break

							ScalerAvg = scalerCount/5
							freq = (ScalerAvg)/(1000*T0)
							if scalerCount > 0:
								if abs(freq-f0) < minDeltaF:
									quit_count = 0
									minDeltaF = abs(freq-f0)
									
									# uncomment to save new best vlaue 
									thBase[dcnum-1][ch] = th
									FBase[dcnum-1][ch] = freq
									print "New TH base value for DC%d CH%d, DAC:%1.2fV TH:%d freq:%.2fkHz" %(dcnum,ch+1,hvBase[dcnum-1][ch]*0.0006015,th,freq)

#									# uncomment to keep old best value instend of best new value
#									if abs(freq-f0) < abs(FBase[dcnum-1][ch]-f0): 
#										thBase[dcnum-1][ch] = th
#										FBase[dcnum-1][ch] = freq
#										print "New TH base value for DC%d CH%d, DAC:%1.2fV TH:%d freq:%.2fkHz" %(dcnum,ch+1,hvBase[dcnum-1][ch]*0.0006015,th,freq)
#									else:
#										print "DC:%d CH:%d TH:%d freq:%.2fkHz(%7d) qc:%d" %(dcnum,ch+1,th,freq,ScalerAvg,quit_count)
								else:
									quit_count += 1
									print "DC:%d CH:%d TH:%d freq:%.2fkHz(%7d) qc:%d" %(dcnum,ch+1,th,freq,ScalerAvg,quit_count)
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
		outfile.write("Note: For data set below Raw HV was set to %2.2f and looking for trigger rate closes to %dkHz," %(rawHV,f0))
		outfile.write("Scan was completed %s\n" %(time.strftime("%m/%d/%Y")))
		outfile.write("DC#\tCH#\tDAC\tTHBase\tFreq[kHz]\n")
		for dcnum in range(1, 5):
			for ch in range(ChSrt,ChEnd):
				outfile.write("%d\t%d\t%d\t%d\t%.2f\n" %(dcnum,ch+1,hvBase[dcnum-1][ch],thBase[dcnum-1][ch],FBase[dcnum-1][ch]))
				print "DC:%d CH:%d DAC:%1.2fV TH:%4d F_Base:%.2fkHz" %(dcnum,ch+1,hvBase[dcnum-1][ch]*0.0006105,thBase[dcnum-1][ch],FBase[dcnum-1][ch]) 
		outfile.close()

#		os.system("sudo chmod 777 %s" %(BaseCalib_file))
