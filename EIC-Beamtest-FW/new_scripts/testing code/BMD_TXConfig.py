#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

AUTHORS:
Chris ketter
Modified by: khanh le 9/6/17 -- rewrote code to work with BMD system

DESCRIPTION:
script either loads preset values or looks for calibration file ansd uses those values.
if there's no file script will do calibration and save values to file

NOTES:
add top and bot into file name

commands to scrod:
"0F000000"         # clearing reset signals
"0F010001"         # set top or bot plane identifier
"0F02000"+asicMask # set asic enable bits for readout
"0F060000"         # sets trigger mode
"0F070000"         # seting dc num to readout
"0F08000"          # set data demux to send raw data 
"0F0C8000" 		   # set fixed win start

commands to dc:
"1F000000"# clearing state machine reset signal
"1F030080"# setting tx dac load period
"1F040140"# setting tx dac latch period
"1F050000"# clearing software trig
"1F060000"# sets tx trigger to software trigger
"1F090000"# offset win number and direction 
"1F0A0003"# win num to read
"1F0C0000"# fixed window number readout
"1F0D0000"# ped calc enable, and number of averge setting
"1F0E0001"# sampling logic and PARAMS
"1F0F0F00"# sets ramp length
"FF120100"# setting trigger scaler clock cycle count

"1B0005AA1B0205AA1B0405AA1B0605AA1B0805AA1B0A05AA"# setting tx dac registers
"1B0C05AA1B0E05AA1B1005AA1B1205AA1B1405AA1B1605AA1B1805AA1B1A05AA"+\
"1B1C05AA1B1E05AA1B0103D91B0303D91B0503D91B0703D91B0903D91B0B03D9"+\
"1B0D03D91B0F03D91B1103D91B1303D91B1503D91B1703D91B1903D91B1B03D9"+\
"1B1D03D91B1F03D91B3005141B3100001B320A5A1B33044C1B3405DC1B350426"+\
"1B3604B91B3700001B3804801B3900001B3A08BB1B3B00001B3D04A61B3E044C"+\
"1B3F044C1B40008F1B4100A31B42000D1B4300211B4400141B4500281B460021"+\
"1B4700351B4800381B49000C1B4A00281B4B003A1B4C02E11B4D0C281B4E0480"+\
"1B4F0AAA"
'''


import sys
import time
import os
import csv
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth


#---------------- USAGE ----------------#
usageMSG="Usage:BMD_dac_calb.py <ASIC mask>><calibration enable><rawHV>\n" +\
"where:\n"+\
"ASIC mask : Binary mask for enabled asics:\n" +\
"            0=disable   1=dc1 only 2=dc2 only 3=dc 1&2\n"+\
"            4=dc3 only  5=dc 1&3   6=dc 2&3   7=dc 1-3\n"+\
"            8=dc4 only  9=dc 1&4   A=dc 2&4   B=dc 1,2&4\n"+\
"            C=dc 3&4    D=dc 1,3&4 E=dc 2-4   F=dc all\n"+\
"calb en   : 0 = program fixed values, 1 = do caliberated\n"+\
"rawHV     : 0-100\n";

if len(sys.argv)!=4:
    print usageMSG
    exit(-1)



interface = "eth2"#sys.argv[1]
asicMask  = sys.argv[1]
calb_en   = int(sys.argv[2]) 
rawHV     = float(sys.argv[3])

if rawHV<0 or rawHV>100 or asicMask > "f":
    print usageMSG
    exit(-1)

#--------- ETHERNET CONFIGURATION ----------#
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
ctrl.open()

#-----------------------------------------------------------------------------------------------#
#-----------------------------setting for scan--------------------------------------------------#
#-----------------------------------------------------------------------------------------------#
# range of channels to scan
ch2scan  = 16 # set to 1-16
ch2start = 0  # starting channel

# values for course dac scan
c_delta  = 16   # increments of 2^something, script starts at upper limit so number must be negative
c_up_lim = 2048 # dac scan upper limit currently set to 1.25(2048), DAC max 2.5V(4096)
c_lo_lim = 1300 # dac scan lower limit set to .794V

# vlaues for fine dac scan
f_offset = 16   # offset from best course scan value
f_delta  = 1    # increment value for fine dac scan

# vlaues for course threshold scan
th_delta  = 16   # thresehold scan increment value
th_up_lim = 1700 # thresehold scan upper limit 4095
th_lo_lim = 1300  # thresehold scan lower limit 0

# values for fine thereshold scan
th_f_offset = 16 # delta offset of best values from course scan for fine scan
th_f_delta  = 1  # increment value for fine scan 
exth        = 10 # extra offset to final values incase need more

th_calib_file_name = "outdir/trim_dac_calb/BMD_th_calib_HV:"+str(rawHV)+".txt"
hv_calib_file_name = "outdir/trim_dac_calb/BMD_HV_calib_HV:"+str(rawHV)+".txt"
T0 = 2**24/62.5e6 # count scalers for x"01000000" clock cycles(T0 in sec, clock at 62.5MHz) 
syncwd ="000000010253594e4300000000" # must be send before every command string
asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0')
t1 = time.time();

#-----------------------------------------------------------------------------------------------#
#------- Declearing a function to readback registers to make code shorter-----------------------#
#-----------------------------------------------------------------------------------------------#
def readReg(asic,RegNo):
	dc_num = hex(asic).split('x')[1];
	syncwd="000000010253594e4300000000"
	buffSize=3000;
	cmd1=dc_num+"ABCDABC"+dc_num+hex(int('D000000',16) | RegNo*(2**16)).split('x')[1]
	ctrl.send(syncwd+cmd1)
#	print cmd1
	rcv = ctrl.receive(buffSize)
	trys = 3
	for i in range(3):
		if rcv[32:40] == "64656164":#no response 
			if i == trys-1:
				print "\nDC#%d Reg#%d=DEADBEEF trys:%d" %(asic,RegNo,i)
				return "0000"
			else:
				ctrl.send(syncwd+cmd1)
				rcv = ctrl.receive(buffSize)
		else:
			if asic == 0:
				return int(rcv[36:40],16)
			else:
				return int(rcv[38:42],16)


#--------------------------------------------------------------------------------------------#
#--------- Programming SCROD snd DC registers------------------------------------------------#
#--------------------------------------------------------------------------------------------#
cmd_scrod =	"0F000000"+"0F010001"+"0F02000F"+"0F060000"+"0F070000"+"0F080000"+"0F0C0000"

cmd_dc    =	"FABCDABC"+"FF030080"+"FF040140"+"FF050000"+"FF060000"+"FF090000"+"FF0A0003"+\
			"FF0C0000"+"FF0D0000"+"FF0E8001"+"FF0F0F00"+"FF120100"+"FF000001"+"FF000000"+"FF0E0001"

# setting for other tX register
cmd_tx = "FABCDABCFB300514FB310000FB320A5AFB33044CFB3405DCFB350426FB3604B9FB370001"+\
		  "FB380480FB390000FB3A08BBFB3B0000FB3D04A6FB3E044CFB3F044CFB40008F"+\
		  "FB4100A3FB42000DFB430021FB440014FB450028FB460021FB470035FB480038"+\
		  "FB49000CFB4A0028FB4B003AFB4C02E1FB4D0C28FB4E0480FB4F0AAA"



# settings for trigger plus width: 02A0=380ns, 0300=140ns, 0103=25ns
cmd_wbais = "FABCDABC"
for i in range(16):
	cmd_wbais += hex(int('FB000300',16)|((2*i)+1)*(2**16)).split('x')[1]

# setting for smallest trigger plus for scaning
cmd_wbais_config = "FABCDABC"
for i in range(16):
	cmd_wbais_config += hex(int('FB000103',16)|((2*i)+1)*(2**16)).split('x')[1]



# command sets all theresholds to max
cmd_th_max = "FABCDABC"
for i in range(16):
	cmd_th_max += hex(int('FB00FFFF',16)|(2*i)*(2**16)).split('x')[1]

# command sets all dacs to max
cmd_dac_max = "FABCDABC"
for i in range(16):
	if i != 10:
		cmd_dac_max += hex(int('FC00FFFF',16)|i*2**16).split('x')[1]
	cmd_dac_max += hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]

# command sets all dacs to zero
cmd_dac_zero = "FABCDABC"
for i in range(16):
	if i != 10:
		cmd_dac_zero += hex(int('FC000000',16)|i*2**16).split('x')[1]
	cmd_dac_zero += hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]
#	cmd_dac_zero += hex(int('FC000000',16) | i*(2**16)).split('x')[1]


# if calibrated values aren't used set thereshold to 1500
cmd_th_def = "FABCDABC"
for i in range(16):
	cmd_th_def += hex(int('FB000000',16)|(2*i)*(2**16)|1500+exth).split('x')[1]

# if calibrated values aren't used setting HV to 73V and all trim dacs to 0.95V
cmd_dac_def = "FABCDABC"
for i in range(16):
	if i != 10:
		cmd_dac_def += hex(int('FC000000',16) | i*(2**16)|int(0.95/.0006105)).split('x')[1]
	cmd_dac_def +=hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]

ctrl.send(syncwd+cmd_scrod+cmd_dc)
print "\nProgramming SCROD and DC registers"
time.sleep(.2)
ctrl.send(syncwd+cmd_wbais)
time.sleep(.5)
ctrl.send(syncwd+cmd_tx)
time.sleep(.5)


#-----------------------------------------------------------------------------------------------#
#--------- Checking to see if Calibration is enabled -------------------------------------------#
#-----------------------------------------------------------------------------------------------#

if calb_en == 0:
	ctrl.send(syncwd+cmd_dac_def)
	time.sleep(.5)
	ctrl.send(syncwd+cmd_th_def)
	time.sleep(.5)
#	ctrl.send(syncwd+cmd_wbais)
#	time.sleep(.5)
	print "\nProgramming TargetX registers with default vlaues: thereshold = 1500, Trim DACs = 1V, and HV = %2.2fV" %(rawHV)

else:
#--------------------------------------------------------------------------------------------#
#------proforming trim dac scan for all channels on all enabled asics------------------------#
#--------------------------------------------------------------------------------------------#

	#-- checking to see if trim dac calibration has already been done for specific HV value ---------#
	#-- if yes programs DAC values in file ----------------------------------------------------------#
	#-- if no then do scan and save file ------------------------------------------------------------#
	if not os.path.isfile(hv_calib_file_name):
		print "\nCalibration file doesn't exist so performing DAC scan for all asics"
		outfile = open(hv_calib_file_name, 'w')
		outfile.write("DC#\tCH#\tDAC_val\tBestFreq[kHz]\n")
		outfile.close()

		hv_c  = [1605 for i in range(4)]
		hvBest = [[1605 for i in range(15)]for j in range(4)]
		f_best = [[-1 for i in range(16)]for j in range(4)]
		f0 = 500

		#SET HV to selected value, Trim DACs to zero, and Thereshold to 4095
		ctrl.send(syncwd+cmd_dac_max)
		time.sleep(.5)
		ctrl.send(syncwd+cmd_th_max)
		time.sleep(.5)
#		ctrl.send(syncwd+cmd_wbais_config)
#		time.sleep(.5)

		for ch in range(ch2start,ch2scan-1):
			minDeltaF = [20000 for i in range(4)]
			quit_count = 0
			dac_ch = linkEth.mppcToDAC_decoder(ch+1)
			if ch == 69:
				break
			
			# setting thereshold of current channel on all dc to 1500
			cmd_th = "FABCDABC"+hex(int('FB000000',16)|(2*ch)*(2**16)|1500).split('x')[1]
			ctrl.send(syncwd+cmd_th)
			time.sleep(.2)
#-------------------------------------------------------------------------------------#	
#-- doing course scan for trim DACs --------------------------------------------------#
#-------------------------------------------------------------------------------------#
			print "\n*********** -Course Scan for MPPC Ch%d- ***********" % (ch+1)
			for trim in range(c_up_lim,c_lo_lim,-c_delta):
				cmdHV = "FABCDABC"+hex(int("FC100000",16)|dac_ch*2**16|trim).split('x')[1]
				ctrl.send(syncwd+cmdHV)
				time.sleep(0.8)#wait for counters to settle then read registers

				#reading back scalercounts from all enabled asics
				for dcnum in range(1, 5):
					if asic_mask[4-dcnum] == '1':
						scalerCount = readReg(dcnum,19)+readReg(dcnum,20)*2**16
						freq = scalerCount/(1000*T0)

						#finding closeset frequency to f0
						if scalerCount > 0:
							if abs(freq-f0) < minDeltaF[dcnum-1]:
								minDeltaF[dcnum-1] = abs(freq-f0)
								quit_count = 0
								hv_c[dcnum-1] = trim
							else:
								quit_count +=1
#								print quit_count
							print "DC#%d Ch#%d DAC value is %2.3fV, trig_count:%9d, freq:%4.1fkHz" % (dcnum,ch,trim*0.0006105,scalerCount,freq)

				if quit_count == 30:
					print "breaking out of for loop at %2.3fV" %(trim*0.0006105)
					break
									
#-------------------------------------------------------------------------------------#	
#-- doing fine scan for trim DACs ----------------------------------------------------#
#-------------------------------------------------------------------------------------#
			print "\n*********** -Fine Scan for MPPC Ch%d- ***********" % (ch+1) 
			for dcnum in range(1, 5):
				minDeltaF = 20000
				quit_count = 0
				dc_num = hex(dcnum).split('x')[1]
				if asic_mask[4-dcnum] == '1':
					print "\nStarting Fine DAC scan for DC#%d ch#%d" %(dcnum,ch+1)

					for trim in range(hv_c[dcnum-1]+f_offset,hv_c[dcnum-1]-f_offset,-f_delta):
						cmdHV = syncwd+dc_num+"ABCDABC"+dc_num+hex(int("C100000",16)|dac_ch*2**16|trim).split('x')[1]
						ctrl.send(cmdHV)
						time.sleep(0.8)#wait for counters to settle then read registers

						#reading back scalercounts from all enabled asics
						scalerCount = readReg(dcnum,19)+readReg(dcnum,20)*2**16
						freq = scalerCount/(1000*T0)

						#--- CALCULATE TRIM-DAC VALUE THAT GIVES SCALAR FREQ. CLOSEST TO f0 ---#
						if scalerCount > 0:
							if abs(freq-f0) < minDeltaF: 
								hvBest[dcnum-1][ch] = trim
								f_best[dcnum-1][ch] = freq
								minDeltaF = abs(freq-f0)
								quit_count = 0
							else:
								if quit_count == 3: #quits current ch scan if scaler count keeps growing  
									print "breaking out of for loop at %2.3fV" %(trim*0.0006105)
									break
								quit_count += 1	
#								print quit_count
							print "DC#%d Ch#%d Best DAC value is %2.3fV, trig_count:%7d freq:%4.3fkHz" % (dcnum,ch+1,trim*0.0006105,scalerCount,freq)					

					print "Scan for ch#%d on DC#%d complete saving best DAC value as %2.3fV(%d)\n" %(ch+1,dcnum,hvBest[dcnum-1][ch]*0.0006105,hvBest[dcnum-1][ch])

			# setting DAC and thereshold on current channel to max and best values saving to file	
			cmdHV = "FABCDABC"+hex(int("FC00FFFF",16)|dac_ch*2**16).split('x')[1]+hex(int('FB00FFFF',16)|(2*ch)*(2**16)).split('x')[1]
			ctrl.send(syncwd+cmdHV)
			time.sleep(0.1)

		# saving thereshold base to file
		outfile = open(hv_calib_file_name, 'a')
		for dcnum in range(1, 5):
			dc_num = hex(dcnum).split('x')[1]
			if asic_mask[4-dcnum] == '1':
				for th_ch in range(16):
					outfile.write("%d\t%d\t%d\t%4.3f\n" % (dcnum,ch+1,hvBest[dcnum-1][ch],f_best[dcnum-1][ch]))
		outfile.close()	

#-------------------------------------------------------------------------------------#
#-------Reading and programing dc with calibrated values from file--------------------#
#-------------------------------------------------------------------------------------#
	else:
		hvBest = [[int(.95/0.0006105) for i in range(15)]for j in range(4)]
		print "\nReading calibration file and programing DACs for all enabled DC"
		#opening DAC file and reading lines
		infile = open(hv_calib_file_name, 'r')
		csvFile = csv.reader(infile, delimiter='\t')
		cmd_HV = "FABCDABC"
		curr_line = 0
		for line in csvFile:
			curr_line += 1 		
			if curr_line > 1:	
				curr_ch = linkEth.mppcToDAC_decoder(int(line[1]))
				hvBest[int(line[0])-1][int(line[1])-1] = int(line[2])
				if asic_mask[4-int(line[0])] == '1':
					cmd_HV += line[0]+hex(int("C000000",16)|(curr_ch)*2**16|int(line[2])).split('x')[1]
#					print "Setting DC#%s ch#%s thereshold = %4d DAC = %2.3f" %(line[0],line[1],1500,int(line[2])*0.0006105)
		infile.close()
#		print hvBest
		cmd_HV += hex(int("FC0A0000",16)|int(rawHV/0.02442)).split('x')[1]

		# uncommnet to skip thereshold scan
#		print cmd_HV
#		ctrl.send(syncwd+cmd_HV)
#		time.sleep(.5)
#		ctrl.send(syncwd+cmd_th_def)
#		time.sleep(.5)
#		ctrl.send(syncwd+cmd_wbais)
#		time.sleep(.5)
#		exit(-1)


#--------------------------------------------------------------------------------------------#
#------proforming thereshold scan for all channels on all enabled asics----------------------#
#--------------------------------------------------------------------------------------------#
	if not os.path.isfile(th_calib_file_name):
		print "\nCalibration file doesn't exist so performing thereshold scan for all asics"
		outfile = open(th_calib_file_name, 'w')
		outfile.write("DC#\tCH#\tth_val\tBestFreq[kHz]\n")
		outfile.close()

		#Turning off HV and setting thereshold to max
		ctrl.send(syncwd+cmd_dac_max)
		time.sleep(.5)
		ctrl.send(syncwd+cmd_th_max)
		time.sleep(.5)
#		ctrl.send(syncwd+cmd_wbais_config)
#		time.sleep(.5)
#--------------------------------------------------------------------------------------------#
#------- proforming course threshold for all channels on all enabled asics ------------------#
#--------------------------------------------------------------------------------------------#
		th_c = [th_up_lim for i in range(4)]
		thBase = [[1500 for i in range(16)]for j in range(4)]
		f_best = [[-1 for i in range(16)]for j in range(4)]

		for th_ch in range(ch2start,ch2scan):
			if th_ch == 15:
				for dcnum in range(1,5):
					if asic_mask[4-dcnum] == '1':
						thBase[dcnum-1][th_ch] = 4095
			else:
				fmax = [-1 for i in range(4)]
				quit_count = 0
				dac_ch = linkEth.mppcToDAC_decoder((th_ch%15)+1)
				print "\n*********** -Course Scan for thereshold on Ch%d- ***********" % (th_ch+1)
				for th in range (th_up_lim,th_lo_lim,-th_delta):
					cmdth = "FABCDABC"+hex(int('FB000000',16)|(2*th_ch)*(2**16)|th).split('x')[1]
					ctrl.send(syncwd+cmdth)
					time.sleep(0.1)
					for dcnum in range(1, 5):
						dc_num = hex(dcnum).split('x')[1]
						if asic_mask[4-dcnum] == '1':
							cmdth += dc_num+hex(int("C100000",16)|dac_ch*2**16|hvBest[dcnum-1][th_ch%15]).split('x')[1]
	#				print cmdth
					ctrl.send(syncwd+"FABCDABC"+cmdth)
					time.sleep(0.8)#wait for counters to settle then read registers

					#reading back scalercounts from all enabled asics
					for dcnum in range(1, 5):
						dc_num = hex(dcnum).split('x')[1]
						if asic_mask[4-dcnum] == '1':
							scalerCount = readReg(dcnum,19)+readReg(dcnum,20)*2**16
							freq = (scalerCount)/(1000*T0)

							#--- PICK OUT MAX SCALAR FREQ. AND ASSOC. THRESHOLD VALUE ---#
							if scalerCount > 0:
								if (freq > fmax[dcnum-1]):
									fmax[dcnum-1] = freq
									if th == th_up_lim:
										th_c[dcnum-1] = 1500
									else:
										th_c[dcnum-1] = th
									quit_count = 0
								else:
									quit_count += 1
#									print quit_count
								print "DC:%d ch:%d th:%d freq:%4.2fkHz(%7d) fMax:%4.2fkHz" %(dcnum,th_ch+1,th,freq,scalerCount,fmax[dcnum-1])

					if quit_count == 30: #quits current ch scan if scaler count keeps growing  
						print "breaking out of for loop at thereshold %d" %(th)
						break

#--------------------------------------------------------------------------------------------#
#------- proforming fine threshold for all channels on all enabled asics --------------------#
#--------------------------------------------------------------------------------------------#
				print "\n*********** -Fine Scan for thereshold on Ch%d- ***********" %(th_ch+1) 
				for dcnum in range(1, 5):
					quit_count = 0
					max_f = -1
					dc_num = hex(dcnum).split('x')[1]
					if asic_mask[4-dcnum] == '1':
						print "\nStarting Fine thereshold scan for ch#%d DC#%d" %(th_ch,dcnum)
						for th in range(th_c[dcnum-1]+th_f_offset,th_c[dcnum-1]-th_f_offset,-th_f_delta):
							cmdth = dc_num+"ABCDABC"+dc_num+hex(int('B000000',16)|(2*(th_ch))*(2**16)|th).split('x')[1]+\
									dc_num+hex(int("C100000",16)|dac_ch*2**16|hvBest[dcnum-1][th_ch%15]).split('x')[1]
							ctrl.send(syncwd+cmdth)
							time.sleep(0.8)#wait for counters to settle then read registers
		#					print cmdth

							#reading back scalercounts from all enabled asics
							scalerCount = readReg(dcnum,19)+readReg(dcnum,20)*2**16
							freq = (scalerCount)/(1000*T0)

							#--- PICK OUT MAX SCALAR FREQ. AND ASSOC. THRESHOLD VALUE ---#
							if scalerCount > 0:
								if (freq > max_f):
									quit_count = 0
									max_f = freq
									f_best[dcnum-1][th_ch] = max_f
									if th == th_c[dcnum-1]+th_f_offset:
										thBase[dcnum-1][th_ch] = 1500
									else:
										thBase[dcnum-1][th_ch] = th
								else:
									if quit_count == 5: #quits current ch scan if counts keeps getting lower
										print "breaking out of for loop at thereshold %d" %(th)
										break
									quit_count += 1
		#							print "quit num:%d" %(quit_count)
								print "DC:%d ch:%d th:%d count:%9d freq:%4.2fkHz fMax:%4.2fkHz" %(dcnum,th_ch,th,scalerCount,freq,max_f)

				# setting DAC and thereshold to max on current channel
				cmdth = "FABCDABC"+hex(int("FC000000",16)|dac_ch*2**16).split('x')[1]+hex(int('FB00FFFF',16)|(2*th_ch)*(2**16)).split('x')[1]
				ctrl.send(syncwd+cmdth)
				time.sleep(0.1)

			# saving thereshold base to file
			outfile = open(th_calib_file_name, 'a')
			for dcnum in range(1, 5):
				dc_num = hex(dcnum).split('x')[1]
				if asic_mask[4-dcnum] == '1':
					for th_ch in range(16):
						print "Saving thresehold base as %d for ch#%d on DC#%d\n" %(thBase[dcnum-1][th_ch],th_ch+1,dcnum)
						outfile.write("%d\t%d\t%d\t%4.3f\n" % (dcnum,th_ch+1,thBase[dcnum-1][th_ch],f_best[dcnum-1][th_ch]))
			outfile.close()	

#--------------------------------------------------------------------------------------------#
#------- SETTING THRESHOLD WITH OFFSET AND DAC VALUES FROM SCAN -----------------------------#
#--------------------------------------------------------------------------------------------#

		for dcnum in range(1,5):
			dc_num = hex(dcnum).split('x')[1]		
			if asic_mask[4-dcnum] == '1':	
				cmd_th = cmd_dac = "FABCDABC"
				for ch in range(ch2start,ch2scan):
					if ch < 15:	
						dac_ch = linkEth.mppcToDAC_decoder((ch%15)+1)
						cmd_th += dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|thBase[dcnum-1][ch]+exth).split('x')[1]
						cmd_dac += dc_num+hex(int("C000000",16)|dac_ch*2**16|hvBest[dcnum-1][ch]).split('x')[1]
						print "Setting DC#%d ch#%d Thereshold:%4d & DAC:%2.3fV" %(dcnum,ch+1,thBase[dcnum-1][ch]+exth,hvBest[dcnum-1][ch]*0.0006105)
					else:
						cmd_th += dc_num+hex(int('B00FFFF',16)|(2*ch)*(2**16)).split('x')[1]
						cmd_dac += hex(int('FC0A0000',16)|int(rawHV/0.02442)).split('x')[1]

				ctrl.send(syncwd+cmd_dac)
				time.sleep(0.5)
				ctrl.send(syncwd+cmd_th)
				time.sleep(0.5)
#				ctrl.send(syncwd+cmd_wbais)
#				time.sleep(.5)
		print "Setting HV for all DC to %2.3fV" %(rawHV)
#		print cmd_th
#--------------------------------------------------------------------------------------------#
#------- Reading and programing dc with calibrated values from file -------------------------#
#--------------------------------------------------------------------------------------------#
	else:
		print "\nReading calibration file and programing thresholds and DACs for all channels and all enabled DC"
		#opening thereshold file and reading lines
		infile = open(th_calib_file_name, 'r')
		csvFile = csv.reader(infile, delimiter='\t')
		cmd_TH = "FABCDABC"
		curr_line = 0
		
		for line in csvFile:
			curr_line += 1 	
			if curr_line > 1:	
				dcnum = line[0]	
				if asic_mask[4-int(dcnum)] == '1':
					ch = int(line[1])-1
					if ch < 15:
						hv = hvBest[int(dcnum)-1][ch]*0.0006105
						th = int(line[2])+exth
						print "Setting DC#%s ch#%d thereshold = %4d DAC = %2.3f" %(dcnum,ch+1,th,hv)
					else:	
						th = int(line[2])
						print "Setting DC#%s ch#%d thereshold = %4d VPED = 1.25V" %(dcnum,ch+1,th)
					cmd_TH += dcnum+hex(int("B000000",16)|(2*ch)*2**16|th).split('x')[1]

		print "HV for all DC set to %2.2fV" %(rawHV)
		infile.close()	
		# sending calibrated thresehold and DAC values to all enabled dc

#		# uncomment to use defult values for all trim DAC (0.9V)
#		ctrl.send(syncwd+cmd_dac_def)

		ctrl.send(syncwd+cmd_HV)
		time.sleep(.5)
		ctrl.send(syncwd+cmd_TH)
		time.sleep(.5)
#		ctrl.send(syncwd+cmd_wbais)
#		time.sleep(.5)

ctrl.close()

deltaTime = time.time() - t1
print "\nCalibration Complete. Time = %.3f sec(s) to complete\n" % (deltaTime)

