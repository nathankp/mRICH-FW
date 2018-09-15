#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214 

AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and Isar
Modified by: khanh le 9/6/17 -- rewrote code to work with BMD system

DESCRIPTION:
script will wait for event trigger and readout 4 windows of all/selected daughter cards and send it up 
to PC or save on to SRAM

Notes:
 

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
'''

import sys
import time
import os
import binascii
sys.path.append('/home/kevin/root/lib')
import ROOT
ROOT.gROOT.LoadMacro("rootMacros/MakeRawTTree.cxx")
ROOT.gROOT.LoadMacro("rootMacros/MakeAveragedPedestalTTree.cxx")
ROOT.gROOT.LoadMacro("rootMacros/MakePedestalSubtractedTTree.cxx")
ROOT.gROOT.LoadMacro("rootMacros/PlotFirstWaveform.cxx")
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth



usageMSG="\nUsage:BMD_readout_control.py <ASIC mask><pedsub mode><digi_win start><digi_win offset><plot en><num events>\n" +\
"where:\n"+\
"ASIC mask : Binary mask for enabled asics:\n" +\
"            0=disable   1=dc1 only 2=dc2 only 3=dc 1&2\n"+\
"            4=dc3 only  5=dc 1&3   6=dc 2&3   7=dc 1-3\n"+\
"            8=dc4 only  9=dc 1&4   A=dc 2&4   B=dc 1,2&4\n"+\
"            C=dc 3&4    D=dc 1,3&4 E=dc 2-4   F=dc all\n"+\
"Ped sub   : 0 = plot data file  1 = readout and pedsub\n"+\
"            2 = pedestal calc   3 = readout waveform data\n"+\
"win start : 0 to 511 or -1 to take readout from moun event\n"+\
"win offset: -511 to +511\n"+\
"plot mode : 0 = disable ploting                1 = plot each ch on its own plot\n"+\
"            2 = plot all ch on same plot       3 = plot hist for data\n"+\
"            4 = plot hist for all ch on same\n"+\
"num event : any integer greater than 1\n"

if len(sys.argv)!=7:
	print usageMSG
	exit(-1)

asicMask  = (sys.argv[1])
pedsub    = (sys.argv[2])
winStart  = int(sys.argv[3])
winOffset = (sys.argv[4])
plot_data = int(sys.argv[5])
num_events= int(sys.argv[6])

# after fixing SRAM code uncomment to enable saving ped data to SRAM
#calcMode = (sys.argv[3])


if asicMask<"0" or asicMask>"f" or pedsub<"0" or pedsub>"3" or winStart<-1 or winStart>511 or int(winOffset)<-511 or int(winOffset)>+512 or plot_data<0 or plot_data>5:
	print usageMSG
	exit(-1)

FixedWin = 1;
if winStart == -1:
    FixedWin = 0

if winOffset[0:1] == "+":
	offset_dir = 0
	win_Offset = int(winOffset[1:])
elif winOffset[0:1] == "-":
	offset_dir = 1
	win_Offset = int(winOffset[1:])
else:
	offset_dir = 1
	win_Offset = int(winOffset)

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = "eth2" #sys.argv[1]

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
ctrl.open()

#-----------------------------------------------------------------------------------------------#
#------- Declearing a function to check link to DC ---------------------------------------------#
#-----------------------------------------------------------------------------------------------#
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
#------- Declearing initial values for variables -----------------------------------------------#
#-----------------------------------------------------------------------------------------------#
syncwd="000000010253594e4300000000" # must be send before every command string
asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0')
t1 = time.time()
buffSize = 200000
#print "asic MAsk:"+asic_mask + " current dc:"+format(dcnum)+" current mask bit:"+asic_mask[4-dcnum]


# set the stage by sending commands to scrod and DC: after fixing sram stuff add "calcMode" to reg 8
scrod_reg = "0F000000"+"0F050000"+"0F060000"+"0F07000"+asicMask+"0F080000"+\
			"0"+hex(int('F0C0000',16) | FixedWin*(2**15) | FixedWin*winStart ).split('x')[1];

dc_reg = "FABCDABC"+"FF000000"+"FF050000"+"FF060000"+"FF07000"+asicMask+"FF0D0000"+\
		 hex(int('FF090000',16) | offset_dir*(2**15) | win_Offset ).split('x')[1]+\
		 hex(int('FF0C0000',16) | FixedWin*(2**15) | FixedWin*winStart).split('x')[1]

st_reset = "0F000001FABCDABCFF000001"


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
	print "All DCs online continuing with readout\n"
else:
	print "Please reprogram dead DCs or try to reset detector\n"
	quit(-1)

#print "\nValues for SCROD registers sent:" + scrod_reg
#print "\nValues for DC registers sent:" + dc_reg

#-----------------------------------------------------------------------------------------------#
#------- Deleting old files before starting readout --------------------------------------------#
#-----------------------------------------------------------------------------------------------#
for dcnum in range(1, 5):
	if asic_mask[4-dcnum] == '1':
		# deleting old raw data form last run
		RawAll = "outdir/raw_data/SWTrig_%devents.dat_AllEvents.txt" %(num_events)
		if os.path.isfile(RawAll):
			print "\nRemoving raw data from last run"
			os.system("sudo rm %s" %(RawAll))

		if pedsub =="1":
			filename = "outdir/raw_data/EventTrig_%devents.dat_AllEvents.txt" %(num_events)		
			if os.path.isfile(filename):
				print "Removing old pedsub file from last run"
				os.system("sudo rm %s" %(filename))

			filename = "outdir/pedsub_data/DC%d_pedsub_data_%devents.txt" %(dcnum,num_events)		
			if os.path.isfile(filename):
				print "Removing old pedsub file from last run for DC%d" %dcnum
				os.system("sudo rm %s" %(filename))

		elif pedsub =="2":
			filename = "outdir/raw_data/DC%d_RawPedData_AllWin.txt" %(dcnum)
			if os.path.isfile(filename):
				print "Removing parsed raw ped data from last run for DC%d" %dcnum
				os.system("sudo rm %s" %(filename))

			filename = "outdir/pedcalc_data/DC%d_peddata_AllWin.txt" %(dcnum)
			if os.path.isfile(filename):
				print "Removing old pedcalc file from last run for DC%d" %dcnum
				os.system( "sudo rm %s" %(filename))

#--------------------------------------------------------------------------------------------------------------------#
#--------------------------- Taking data from event triggers --------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------------------#
if winStart == -1:
	print "\nconfiguring registers to take event trigger readout"
	'''
	Setting trigger mode for event readout: bits 3-0 of register 6
	--x"0": use software trigger
	--x"1": use TARGETX hardware trigger
	--x"2": use cioncidence triggre thtough wire
	--x"3": use coincidence trigger through connector
	--x"F": trigger from anything
	'''
	TrigMode = "FF060003"+"0F060003" 
	TrigModeRst = "FABCDABC"+"FF060000"+"0F060000"
	ctrl.send(syncwd+scrod_reg+dc_reg+TrigMode)
	RawAll = "outdir/raw_data/EventTrig_%devents.dat" %(num_events)

	for event in range(num_events):
		# waiting for trigger from SCROD
		print "Waiting on event trigger\n"
		rcv = ctrl.receive(buffSize)
		if rcv[32:40] == "74726967": # looking for "trig" in lower case 
			print "Event Trigger!!! Collecting data for event#%d at %s" %(event,time.strftime("%d/%m-%H:%M")) 
			for dcnum in range(1, 5):
				dc_num = hex(dcnum).split('x')[1]
				if asic_mask[4-dcnum] == '1':

					# programing DC registers 
					trig_cmd = TrigModeRst+"0A00000"+dc_num
					ctrl.send(syncwd+trig_cmd)
					
					#receving packet from scrod
					rcv = ctrl.receive(buffSize)
					cur_dc  = rcv[10:11]
					cur_smp = int(rcv[11:16],16)
					srt_win = int(rcv[27:30],16)
					trig_ch = int(rcv[31:32],16)
#					print trig_ch

					if len(rcv)/2  > 28:
						print "Readout of DC#%s event#%d  SMP#%d srt_win#%d complete" %(cur_dc,event,cur_smp,srt_win)
						# write received binary data into file
						rcv = linkEth.hexToBin(rcv)

						# saving all event data into file
						f = open(RawAll,'ab')
						f.write(rcv)
						f.close()

					else:
						print "\nDC#%d: DEADBEEF" %(dcnum)

			ctrl.send(syncwd+"FABCDABC"+TrigMode)

		elif rcv[32:40] == "64656164": # SCROD sent 'dead'
			print "System died trying to reset all state machines\n" 
			rcv = "0"
			ctrl.send(syncwd+st_reset)
			time.sleep(0.1)
			ctrl.send(syncwd+scrod_reg+dc_reg) 
		
		else:
			print "Something went wrong, this is what was recieved\n %s" %rcv
			ctrl.send(syncwd+TrigModeRst) 

#	print "Parsing raw event data from all DC %d events" %(num_events)
	os.system("python BMD_plot.py %s %s %d %d" %(RawAll,pedsub,plot_data,num_events))
	os.system("sudo rm %s" %(RawAll))
#	os.system("sudo rm %s__AllEvents.txt" %(RawAll))

	print "\nresetting registers to back to software trigger"
	ctrl.send(syncwd+TrigModeRst) 

#--------------------------------------------------------------------------------------------------------------------#
#--------------------------- Taking ped data ------------------------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------------------#
elif pedsub == "2":

	calcMode = "2" #0:Do ped calc via firmware and save to SRAM, need to add sram code to scrod
				   #1:Do ped calc via firmware and send to PC, not quite working
				   #2:Do ped calc via software

	cmd_scrod = "0F050000"+"0F060000"+"0F07000"+asicMask+"0F080000"+"0F0C0000" #after fixing sram stuff add "calcMode" to reg 8
	cmd_dc    = "FABCDABC"+"FF000010"+"FF050000"+"FF060000"+"FF07000"+asicMask+"FF090000"

	if calcMode == "2":#doing ped calc via software	
		cmd_dc += "FF0D0000"
	else:#doing ped calc via firmware
		cmd_dc += "FF0D8007"
		num_events = 1

	ctrl.send(syncwd+cmd_scrod+cmd_dc)
	time.sleep(.1)

	print "\n*****Starting pedestal calculation scanning range %d to %d*****" %(winStart,win_Offset)
	for dcnum in range(1, 5):
		cur_dc = hex(dcnum).split('x')[1]
		if asic_mask[4-dcnum] == '1':
			print "\nStarting pedestal calculation for DC%d, scanning range %d to %d" %(dcnum,winStart,win_Offset)

#			# uncomment to turn HV off for pedestal scan, also uncomment code at line 390
#			#getting value for current HV setting then turning off HV
#			ctrl.send(syncwd+"FABCDABC"+cur_dc+"D110000")
#			rcv     = ctrl.receive(buffSize)
#			curr_hv = int(rcv[38:42],16)
##			cmd = cur_dc+"ABCDABC"+cur_dc+"C0A0000"
#			cmd = cur_dc+"ABCDABC"+cur_dc+hex(int('C0A0000',16) | int((curr_hv)/0.02242 )).split('x')[1]
#			ctrl.send(syncwd+cmd)
#			print "current HV for DC#%d is %2.3f waiting 3sec to let HV settle" %(dcnum,curr_hv*0.02442)
#			time.sleep(3)

			
			#looping over all windows in targetx
			RawPedAll = "outdir/raw_data/DC%d_RawPed_%devents.dat" %(dcnum,num_events)
	
			# uncommment to do pedestal calculations by scanning over full range of TX
			for event in range(num_events):
				print "Currently on event %d" %(event)
				for win_int in range(0,128):
					win_start = win_int*4
					win_end = win_start+3   
					trig_cmd = "0"+hex(int('F0C8000',16) | win_start ).split('x')[1]+cur_dc+"ABCDABC"+\
							   cur_dc+hex(int('F0C8000',16) | win_start ).split('x')[1]+"0A00000"+cur_dc
	
					# sending commands to scrod and duaghter cards
					ctrl.send(syncwd+trig_cmd)
					rcv = ctrl.receive(buffSize)

					if calcMode == "1" or calcMode == "2":#Doing ped calc via firmware or software and sending back to PC
						if len(rcv)/2 > 28:
							# checking to see if window readout was intended window
							srt_win = int(rcv[27:30],16)
							if srt_win != win_start:
								print "Unexpected window number expected number:%d, number received:%d. Exiting..." %(win_start,srt_win)
								exit(-1)

							if len(rcv)/2 > 28:
								# write received binary data into file			
								rcv = linkEth.hexToBin(rcv)

								# saving data into temp file for ploting
								f=open(RawPedAll,'ab')
								f.write(rcv)
								f.close()
							else:
								print "\nDC#%d pedcalc win %3d to %3d: DEADBEEF" %(dcnum,win_start,win_end)	
								exit(-1)
				
					else:#Doing ped calc via firmware and saving on SRAM
						ctrl.send(syncwd+"0A00000"+cur_dc)
						time.sleep(.5)
						print "\nDC#%s ped calc for windows %3d to %3d complete" %(dcnum,win_start,win_end)	

			# uncomment to do pedestal calculation on sets of 4 windows 
#			for win_int in range(int(winStart/4),int(win_Offset/4)):
#				win_start = win_int*4
#				win_end = win_start+3   
#				trig_cmd = "0"+hex(int('F0C8000',16) | win_start ).split('x')[1]+cur_dc+"ABCDABC"+\
#						   cur_dc+hex(int('F0C8000',16) | win_start ).split('x')[1]+"0A00000"+cur_dc
#					# sending commands to scrod and duaghter cards
#					ctrl.send(syncwd+trig_cmd)
#					time.sleep(.1)

#				if calcMode == "1":#Doing ped calc via firmware and sneding back to PC
#					# receving packet from scrod
#					ctrl.send(syncwd+"0A00000"+cur_dc)
#					rcv = ctrl.receive(buffSize)					

#					if len(rcv)/2 > 28:
#						# checking to see if window readout was intended window
#						srt_win = int(rcv[27:30],16)
#						if srt_win != win_start:
#							print "Unexpected window number expected number:%d, number received:%d. Exiting..." %(win_start,srt_win)
#							exit(-1)

#						print "\nDC#%s ped calc for win %3d to %3d complete packet length is %dbits" %(dcnum,win_start,win_end,len(rcv)/2)	

#						# write received binary data into file			
#						rcv = linkEth.hexToBin(rcv)

#						# saving data into temp file for ploting
#						f=open(RawPedAll,'ab')
#						f.write(rcv)
#						f.close()

#					else:
#						print "\nDC#%d pedcalc win %3d to %3d: DEADBEEF" %(dcnum,win_start,win_end)	
#				
#			
#				elif calcMode == "2":#Doing ped calc via software
#					print "Starting pedestal scan for DC#%s win %3d to %3d complete" %(dcnum,win_start,win_end)
#					for event in range(num_events):
#						# sending trigger commands to scrod
#						ctrl.send(syncwd+"0A00000"+cur_dc)

#						# receving packet from scrod
#						rcv = ctrl.receive(buffSize)
#						srt_win = int(rcv[27:30],16)
#						if srt_win != win_start:
#							print "Unexpected window number expected number:%d, number received:%d. Exiting..." %(win_start,srt_win)
#							exit(-1)

#						if len(rcv)/2  > 28:
#							rcv = linkEth.hexToBin(rcv)

#							# saving data into temp file for ploting
#							f=open(RawPedAll,'ab')
#							f.write(rcv)
#							f.close()

#						else:
#							print "\nDC#%s: DEADBEEF" %(dcnum)

#						if event%20 == 0:
#							print "Currently on event %d" %(event)

#					print "DC#%s pedestal scan for win %3d to %3d complete\n" %(dcnum,win_start,win_end)	
#				
#				else:#Doing ped calc via firmware and saving on SRAM
#					ctrl.send(syncwd+"0A00000"+cur_dc)
#					time.sleep(.5)
#					print "\nDC#%s ped calc for windows %3d to %3d complete" %(dcnum,win_start,win_end)	


			if calcMode != "0":
				os.system("python BMD_plot.py %s %s %d %d" %(RawPedAll,pedsub,plot_data,num_events))
				os.system("sudo rm %s" %(RawPedAll))
#				os.system("sudo rm %s_AllEvents.txt" %(RawPedAll))		

#				# uncomment to do ped calc in root with chris ketter's script
#				time.sleep(.1)
#				rawsmpfile = "outdir/root_tree/DC%d_rawsamples.root" %(dcnum)
#				if os.path.isfile(rawfile):
#					print "removing old raw data file"
#					os.system("sudo rm %s" %(rawfile))

#				pedcalcfile = "outdir/root_tree/DC%d_pedtree.root" %(dcnum)
#				if os.path.isfile(pedcalcfile):
#					print "removing old ped root tree"
#					os.system("sudo rm %s" % (pedcalcfile))

#               print "filling raw data into root tree"	
#				ROOT.MakerawTTree(pedfile,rawsmpfile)
#				time.sleep(.1)

#				print "taking averge pedestal"
#				ROOT.MakeAveragedPedestalTTree(rawsmpfile,pedcalcfile)	
#				# end of chris ketter's parsing script


#			# uncomment if turned HV off for pedestal scan	
#			#setting HV back to pervious setting
#			ctrl.send(syncwd+"FABCDABC"+cur_dc+hex(int('C0A0000',16) | curr_hv ).split('x')[1]+"FF000000")
#			time.sleep(.1)
#			print "Setting HV on DC%d back to %2.3f\n" %(dcnum,curr_hv*0.02442)

#--------------------------------------------------------------------------------------------------------------------#
#--------------------------- Taking data from file and ploting ------------------------------------------------------#
#--------------------------------------------------------------------------------------------------------------------#
elif pedsub =="0":
	for dcnum in range(1, 5):
		if asic_mask[4-dcnum] == '1':
#			filename = "outdir/pedcalc_data/DC%d_peddata_AllWin.txt" %(dcnum)
			filename = 'outdir/pedsub_data/DC%d_pedsub_data_%devents.txt' % (dcnum,num_events)
			os.system("python BMD_plot.py %s %s %d %d" %(filename,pedsub,plot_data,num_events))

#--------------------------------------------------------------------------------------------------------------------#
#--------------------------- Taking data from software triggers -----------------------------------------------------#
#--------------------------------------------------------------------------------------------------------------------#
else:
	print "\nconfiguring registers to take software trigger readout\n"
	ctrl.send(syncwd+scrod_reg+dc_reg+"FF000010")
	time.sleep(.1)
	RawAll = "outdir/raw_data/SWTrig_%devents.dat" %(num_events)

	for event in range(num_events):
		for dcnum in range(1, 5):
			dc_num = hex(dcnum).split('x')[1];

			if asic_mask[4-dcnum] == '1':
				# sending register commands to scrod
				ctrl.send(syncwd+"0A00000"+dc_num)

				# receving packet from scrod
				rcv = ctrl.receive(buffSize)
				cur_dc  = int(rcv[10:11])
				srt_win = int(rcv[27:30],16)
				trig_ch = int(rcv[31:32],16)
#				print rcv

				if len(rcv)/2  > 28:
					print "Readout of DC#%d windows %s to %s  event#%d complete" %(cur_dc,srt_win,(srt_win+3)%512,event)
					rcv = linkEth.hexToBin(rcv)

					# saving all event data into file
					f = open(RawAll,'ab')
					f.write(rcv)
					f.close()
				else:
					if rcv[32:40] == "64656164": # SCROD sent 'dead'
						print "\nDC#%s: DEADBEEF" %(dcnum)
						print rcv


	os.system("python BMD_plot.py %s %s %d %d" %(RawAll,pedsub,plot_data,num_events))
	os.system("sudo rm %s" %(RawAll))	
#	os.system("sudo rm %s_AllEvents.txt" %(RawAll))

#	# uncomment to do pedestal subtraction with chris ketter's script
#	rawfile    = "%s_AllEvents.txt" %(RawAll)
#	rawsmpfile = "outdir/root_tree/DC%d_rawsamples.root" %(dcnum)
#	pedfile    = "outdir/root_tree/DC%d_pedtree.root" %(dcnum)
#	pedsubfile = "outdir/root_tree/DC%d_pedsub_event%d.root" %(dcnum,num_events)

#	if os.path.isfile(rawsmpfile):
#		print "removing old raw root tree"
#		os.system("sudo rm %s" % (rawsmpfile))

#	print "filling raw data into root tree"	
#	time.sleep(.1)
#	ROOT.MakerawTTree(rawfile,rawsmpfile)
#	if pedsub == "1":
#		ROOT.MakepedsubTTree(rawfile,pedfile,pedsubfile)
#		time.sleep(.1)

#	if plot_data > 0:
#		plot_name = "outdir/root_tree/DC%d_event%d_plot.pdf" %(dcnum,event)
#		if os.path.isfile(plot_name):
#			print "removing old plot"
#			os.system("sudo rm %s" % (plot_name))	
#		ROOT.PlotFirstWaveform(pedsubfile,plot_name,500,-500)
#	# end of chris ketter's parsing script

ctrl.close()
deltaTime = time.time() - t1
print "Time to complete = %.3f sec(s)\n" % (deltaTime)





