#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

AUTHORS:
khanh le 9/6/17

DESCRIPTION:
Script for various function of detector
A or a	: counts trigger rate for selected DC, if DC_num = 0 then counts coincidence trigger scaler at scrod
b		: sets TARGETX register
B		: sets threshold for single TARGETX channel and counts triger scaler
c		: sets trim DAC or HV values
C		: sets trim DAC and count trigger scalers
D or d	: reads back register value in detector
F or f	: sets control register in detector
ff or FF: resets all state machines

NOTES:
Change Name of port used for communication (line 60)
#start to set the voltages and such 
'''


import sys
import os
import csv
import time
import numpy as np
import binascii
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth


usageMSG="\nInput structor for BMD_sendCMD.py\n"+\
"python BMD_sendCMD.py <DC num> <cmd type> <reg num> <reg val>\n"+\
"Note: enter all f's to reset all state machines in system\n"+\
"\nwhere: DC num : 0 = SCROD, 1-4 = DC, f = all DC\n"+\
"       com_type : A = count coincidence trigger frequency for all asics\n"+\
"                      ie. BMD_sendCMD.py <DC num> <A> <ideal rate> <th offset>\n\n"+\
"                  b = program TX config regs\n"+\
"                      ie. BMD_sendCMD.py <DC num> <b> <TX reg num> <TX reg val>\n\n"+\
"                  B = program signal TX CH threshold and count trig freq\n"+\
"                      ie. BMD_sendCMD.py <DC num> <B> <ch num(1-15)> <theres val>\n\n"+\
"                  c = program trim dac only(enter HV for ch num for HV)\n"+\
"                      ie. BMD_sendCMD.py <DC num> <c> <ch num(1-15)> <dac val>\n\n"+\
"                  C = program trim dac and count trig freq\n"+\
"                      ie. BMD_sendCMD.py <DC num> <C> <dac num> <dac val>\n\n"+\
"                  D = reg readback(reg num 0-20)\n"+\
"                      ie. BMD_sendCMD.py <DC num> <D> <reg num> 0\n\n"+\
"                  F = program register(reg num 0-20)\n"+\
"                      ie. BMD_sendCMD.py <DC num> <F> <reg num> <reg val>\n"

if len(sys.argv)!=5:
	print usageMSG
	exit(-1)

#interface = "enp4s0"#sys.argv[1]
interface = "enp1s0f0"
dc_num   = sys.argv[1]
com_type = sys.argv[2]
reg_num  = sys.argv[3]
reg_val  = sys.argv[4]


if dc_num == "1":
	asic_mask = "{0:{fill}4b}".format(1, fill='0')
elif dc_num == "2":
	asic_mask = "{0:{fill}4b}".format(2, fill='0')
elif dc_num == "3":
	asic_mask = "{0:{fill}4b}".format(4, fill='0')
elif dc_num == "4":
	asic_mask = "{0:{fill}4b}".format(8, fill='0')
elif dc_num == "f" or dc_num == "F":
	asic_mask = "{0:{fill}4b}".format(15, fill='0')
#---------------------------------------------#

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
#addr_pc = '192.168.153.1' #with enp4s0
#addr_pc = '192.168.22.1'
port_pc = '28672'
port_fpga = '24576'


# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
syncwd="000000010253594e4300000000" # must be send before every command string
T0 = 2**24/62.5e6 # count scalers for x"01000000" clock cycles(T0 in sec, clock at 62.5MHz) 
t1 = time.time()

#-----------------------------------------------------------------------------------------------#
#------- Declearing a function to readback registers to make code shorter-----------------------#
#-----------------------------------------------------------------------------------------------#
def readReg(asic,RegNo):
	print "read_check1"	
	asic = int(asic)
	dc_num = hex(int(asic)).split('x')[1];
	syncwd="000000010253594e4300000000"
	buffSize=200;
	if asic == 0:
		cmd1=dc_num+hex(int('D000000',16) | RegNo*(2**16)).split('x')[1]
	else:
		cmd1=dc_num+"ABCDABC"+dc_num+hex(int('D000000',16) | RegNo*(2**16)).split('x')[1]
	ctrl.send(syncwd+cmd1)
#	print cmd1
	rcv = ctrl.receive(buffSize)
	trys = 3
	for i in range(3):
		if rcv[32:40] == "64656164":#no response 
			if i == trys-1:
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
	print "read_check2"

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
			print "\nDC%d DEADBEEF" %(DCNUM)
			return 0
		else:
			print "\nDC%d good to go" %(DCNUM)
			return 1
	else:
		print "\nDC%d DEADBEEF" %(DCNUM)
		return 0


# set thereshold on all channels to 0
cmd_th_zero = dc_num+"ABCDABC"
for i in range(16):
	cmd_th_zero += dc_num+hex(int('B000000',16)|(2*i)*(2**16)|0).split('x')[1]


# reading thereshold and dac files and loading into array
if com_type == "A" or com_type == "a" or com_type == "B" or com_type == "C":
	BestCalib_file = "outdir/CalbFiles/BMD_BestCalib_Freq:%sHz.txt" %(reg_num)
	th      = [[-1 for i in range(15)]for j in range(4)]
	dac     = [[-1 for i in range(15)]for j in range(4)]
	dacval  = [[-1 for i in range(15)]for j in range(4)]
	curr_line = 0

	infile  = open(BestCalib_file, 'r')
	csvFile = csv.reader(infile, delimiter='\t')
	for line in csvFile:
		curr_line += 1 	
		if curr_line > 2:	
			dcnum = int(line[0])-1	
			ch    = int(line[1])-1
			dac[dcnum][ch] = int(line[2])
			th[dcnum][ch]  = int(line[3])
#			if line[2] == "-1" or line[3] == "-1":
#				dac[dcnum][ch] = int(0.95/.0006105)
#				th[dcnum][ch]  = 1550	
			dacval[dcnum][ch] = round(dac[dcnum][ch]*0.0006105,2)
	infile.close()	

#----------------------------------------------------------------------------------------------------#
#---------------- resetting all state machines in SCROD and DCs -------------------------------------#
#----------------------------------------------------------------------------------------------------#
if com_type == "FF" or com_type == "ff":
	print "\nResetting SCROD and all DC state machines"
	cmd = "FABCDABC"+"FF060000"+"FF000001"+"0F060000"+"0F000001"
	ctrl.send(syncwd+cmd)

#----------------------------------------------------------------------------------------------------#	
#---------------- counting trigger counts for all channels ------------------------------------------#
#----------------------------------------------------------------------------------------------------#
else:
	# checking if selected DC is responding
	print int(dc_num,16)
	if dc_num < "5":
		if DCcheck(dc_num) == 0:
			quit(-1)

	if com_type == "A" or com_type == "a":
		# setting HV, thereshold to zero
		exth = int(reg_val)
		if dc_num == "0":
			print "\nCounting coincidence trigger rate for all enabled DC 10 times and giving average" 
			scalerCount = 0
			for i in range(10):
				cmd = "0F130001"+"0E000020"+"0F130000"
				ctrl.send(syncwd+cmd)
				time.sleep(1.5)

				# reading back trigger count
				temp = readReg(0,69)+readReg(0,96)*2**16
				scalerCount = scalerCount+temp
				print "Coincidance rate %d: %dHz" %(i,temp)
				temp = 0
			scalerCount = float(scalerCount/10)
			print "\nAveraged oincodence trigger rate:%.2fHz" %(scalerCount)
	
		else:
			ctrl.send(syncwd+cmd_th_zero)
			time.sleep(.5)
			for dcnum in range(1, 5):
				dc_num = hex(dcnum).split('x')[1]
				if asic_mask[4-dcnum] == '1':
					print "\nStarting trigger rate scan for DC%s with best values from %sHz scan" %(dc_num,reg_num)
					print "Using values list blow plus an offset of %d form best values" %(exth)
					print "Current threshold values:\n %s" %(th[dcnum-1])
					print "Current trim DAC values:\n %s\n" %(dacval[dcnum-1])			
					for ch in range(15):
						if th[dcnum-1][ch] == -1:
							print "No best value for CH%d"
						else:
							THVal = th[dcnum-1][ch]+ exth
							if THVal >= 4095:
								THVal = 4095
							cmd = dc_num+"ABCDABC"+dc_num+hex(int("B000000",16)|(2*ch)*2**16|THVal).split('x')[1]+\
								  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
							ctrl.send(syncwd+cmd)
							time.sleep(0.5)

							# reading back trigger count
							scalerCount = readReg(dcnum,69)+readReg(dcnum,96)*2**16
							freq        = scalerCount/(1000*T0)
							print "CH%d TH:%d DAC:%1.2fV trig_count:%9d, freq:%4.2fkHz" %(ch+1,THVal,dacval[dcnum-1][ch],scalerCount,freq)

							# setting thereshold of current channel to max
							cmd = dc_num+"ABCDABC"+dc_num+hex(int("B000000",16)|(2*(ch))*2**16).split('x')[1]
							ctrl.send(syncwd+cmd)
							time.sleep(0.5)

					# scan complete pograming thereshold and dacs with calibrated values
					cmd = dc_num+"ABCDABC"
					for ch in range(15):
						THVal = th[dcnum-1][ch]+ exth
						if THVal >= 4095:
							THVal = 4095
						cmd += dc_num+hex(int("B000000",16)|(2*ch)*(2**16)|THVal).split('x')[1]
#					print cmd
					ctrl.send(syncwd+cmd)
					time.sleep(0.5)


#----------------------------------------------------------------------------------------------------#
#----------------- Programing single TX register ----------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
	elif com_type == "b":
		cmd = dc_num+"ABCDABC"
		cmd += dc_num+hex(int('B000000',16)|int(reg_num)*(2**16)|int(reg_val)).split('x')[1]
#		print cmd
		ctrl.send(syncwd+cmd)
		print "\nSetting TX%s REG%s to %s" %(dc_num,reg_num,reg_val)

#----------------------------------------------------------------------------------------------------#
#----------------- Programing single TX channel and counting trigger rate ---------------------------#
#----------------------------------------------------------------------------------------------------#
	elif com_type == "B":
		ctrl.send(syncwd+cmd_th_zero)
		time.sleep(.5)

		ch = int(reg_num)-1
		cmd = dc_num+"ABCDABC"
		cmd += dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|int(reg_val)).split('x')[1]+\
			   dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
#		print cmd
		ctrl.send(syncwd+cmd)
		time.sleep(0.5)
		
		# reading back trigger count
		scalerCount = readReg(dc_num,69)+readReg(dc_num,96)*2**16
		freq        = scalerCount/(1000*T0)
		print "\nDC%s CH%d TH:%d DAC:%1.2fV trig_count:%9d, freq:%4.2fkHz" %(dc_num,ch+1,int(reg_val),dacval[int(dc_num)-1][ch],scalerCount,freq)

		# scan complete programming threshold and dacs with calibrated values
		cmd = dc_num+"ABCDABC"
		for ch in range(15):
			THVal = th[int(dc_num)-1][ch]
			if THVal >= 4095:
				THVal = 4095
			cmd += dc_num+hex(int('B000000',16)|(2*ch)*(2**16)|THVal).split('x')[1]   
		ctrl.send(syncwd+cmd)

#----------------------------------------------------------------------------------------------------#
#---------------- Programing single MPPC channel and counting trigger rate --------------------------#
#----------------------------------------------------------------------------------------------------#
	elif com_type == "C":
		dac_ch = linkEth.mppcToDAC_decoder(reg_num)
		ctrl.send(syncwd+cmd_th_zero)
		time.sleep(.5)

		cmd = dc_num+"ABCDABC"
		if float(reg_val) <= 2.5:
			dac_val = float(reg_val)
			cmd = dc_num+hex(int("B000000",16)|(2*ch)*2**16|th[int(dc_num)-1][int(reg_num)-1]).split('x')[1]+\
                  dc_num+hex(int("C000000",16)|dac_ch*2**16|int(float(reg_val)/.0006105)).split('x')[1]+\
				  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"
		else:
			dac_val = float(reg_val)*.0006105
			cmd = dc_num+hex(int("B000000",16)|(2*ch)*2**16|th[int(dc_num)-1][int(reg_num)-1]).split('x')[1]+\
                  dc_num+hex(int("C000000",16)|dac_ch*2**16|int(reg_val)).split('x')[1]+\
				  dc_num+"F130001"+dc_num+"E000020"+dc_num+"F130000"

		print "\nSetting DAC for MPPC CH%s to %1.3fV and starting trigger count" %(dc_num,dac_val)  
		ctrl.send(syncwd+cmd)
		time.sleep(0.8)

		# reading back trigger count
		scalerCount = readReg(dc_num,69)+readReg(dc_num,96)*2**16
		freq        = scalerCount/(1000*T0)
		print "DC%s CH%s trig_count:%9d, freq:%4.2fkHz" %(dc_num,reg_num,scalerCount,freq)

		# scan complete pograming threshold and dacs with calibrated values
		cmd = dc_num+"ABCDABC"
		for ch in range(15):
			THVal = th[int(dc_num)-1][ch]
			if THVal >= 4095:
				THVal = 4095
			cmd += dc_num + hex(int('B000000',16)|(2*ch)*(2**16)|THVal).split('x')[1]  
		cmd += dc_num+hex(int("C000000",16)|dac_ch*2**16|dac[int(dc_num)-1][int(reg_num)-1]).split('x')[1]
		ctrl.send(syncwd+cmd)

#----------------------------------------------------------------------------------------------------#
#---------------- Programing signal MPPC DAC or HV --------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
	elif com_type == "c": 
		# checking to make sure DAc values are with in range
		if float(reg_val)/0.0006195 > 4095 and reg_num < "16":
			print "\nplease input DAC voltage in range of 0-2.5V\n" 
			quit(-1)
		elif float(reg_val)/.02442 > 4095 and reg_num > "16":
			print "\nplease input HV voltage in range of 0-90V\n" 
			quit(-1)


		cmd = dc_num+"ABCDABC"
		if reg_num == "hv" or reg_num == "HV":
			cmd += dc_num+hex(int("C0A0000",16)|int(float(reg_val)/.02442)).split('x')[1]
			if dc_num == "f" or dc_num == "F":
				print"\nSetting HV DAC on all DCs to %.2fV" %(float(reg_val))
			else:				
				print"\nSetting HV DAC on DC#%s to %.2fV" %(dc_num,float(reg_val))	

		elif int(reg_num) > 0 and int(reg_num) < 16:
			dac_ch = linkEth.mppcToDAC_decoder(reg_num)
			if float(reg_val) <= 2.5:
				dac_val = float(reg_val)
				cmd += dc_num+hex(int("C000000",16)|dac_ch*2**16|int(float(reg_val)/.0006105)).split('x')[1]
			else:
				dac_val = float(reg_val)*.0006105
				cmd += dc_num+hex(int("C000000",16)|dac_ch*2**16|int(reg_val)).split('x')[1]

			if dc_num == "f" or dc_num == "F":
				print"\nSetting all MPPC CH on DC#%s to %.2fV" %(dc_num,dac_val)		
			else:				
				print"\nSetting MPPC CH#%s on DC#%s to %.2fV" %(reg_num,dc_num,dac_val)

		elif reg_num == "f" or reg_num == "F":
			# command to set DACs on all channels to 0
			cmd = dc_num+"ABCDABC"
			if float(reg_val) <= 2.5:
				dac_val = float(reg_val)
				for i in range(16):
					if i != 10:
						cmd += dc_num+hex(int('C000000',16)|(i)*(2**16)|int(float(reg_val)/.0006105)).split('x')[1]
			else:
				dac_val = float(reg_val)*.0006105
				for i in range(16):
					if i != 10:
						cmd += dc_num+hex(int('C000000',16)|(i)*(2**16)|int(reg_val)).split('x')[1]

			if dc_num == "f" or dc_num == "F":
				print "\nSetting all DACs on all DCs to %.2fV" %(dac_val)
			else:
				print "\nSetting all DACs on DC%s to zero" %(dc_num)

		else:
			print"\nPlease input Channels 1-15 or HV\n"
			quit(-1) 

#		print cmd
		ctrl.send(syncwd+cmd)

#----------------------------------------------------------------------------------------------------#
#---------------- implementing readback commands ----------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
	elif com_type == "D" or com_type == "d":
		if dc_num == "f" or dc_num == "F":
			for dcnum in range(0,5):
				DCNum = hex(dcnum).split('x')[1];
				cmd = DCNum+"ABCDABC"+DCNum+hex(int('D000000',16)|int(reg_num)*(2**16)).split('x')[1]
				ctrl.send(syncwd+cmd)
				rcv = ctrl.receive(200)
#					print rcv
				if rcv[32:40] == "64656164":#no response 
					print "\nDC#%d Reg#%s=DEADBEEF" %(dcnum,reg_num)
				else:
					if dcnum == 0:
						print "\nSCROD Reg#%s=%s" %(reg_num,rcv[36:40])
					else:
						print "\nDC#%d Reg#%s=%s" %(dcnum,reg_num,rcv[38:42])

		elif dc_num == "0":
			cmd = dc_num+com_type+hex(int('000000',16)|int(reg_num)*(2**16)|int(reg_val,16)).split('x')[1].zfill(6)
			ctrl.send(syncwd+cmd)
			rcv = ctrl.receive(200)
			print "\nSCRODA5 Reg#%s=%s" %(reg_num,rcv[36:40])

		else:
			cmd = dc_num+"ABCDABC"+dc_num+hex(int('D000000',16)|int(reg_num)*(2**16)).split('x')[1]
			ctrl.send(syncwd+cmd)
#				print cmd
			rcv = ctrl.receive(200)
			if rcv[32:40] == "64656164":#no response 
				print "\nDC#%s Reg#%s=DEADBEEF" %(dc_num,reg_num)
			else:
				print "\nDC#%s Reg#%s=%s" %(dc_num,reg_num,rcv[38:42])

#----------------------------------------------------------------------------------------------------#
#---------------- implementing write commands -------------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
	elif com_type == "F" or com_type == "f":
		if dc_num == "0":
			cmd = dc_num+hex(int('F000000',16)|int(reg_num)*(2**16)|int(reg_val,16)).split('x')[1]
		else:
			cmd= dc_num+"ABCDABC"+dc_num+hex(int('F000000',16)|int(reg_num)*(2**16)|int(reg_val,16)).split('x')[1]
			print cmd
		ctrl.send(syncwd+cmd)		
		if dc_num == "f" or dc_num == "F":
			print"\nSetting all DC reg#%s to %s" %(reg_num,reg_val)
		else:
			if dc_num == "0":
				print"\nSetting SCROD A5 reg#%s to %s" %(reg_num,reg_val)
			else:
				print"\nSetting DC#%s reg#%s to %s" %(dc_num,reg_num,reg_val)

#----------------------------------------------------------------------------------------------------#
#---------------- input command not valid -----------------------------------------------------------#
#----------------------------------------------------------------------------------------------------#
	else:
		print " Command not valid, input new command"

deltaTime = time.time() - t1
print "\nCommand Complete. Time = %.3f sec(s) to complete\n" % (deltaTime)


