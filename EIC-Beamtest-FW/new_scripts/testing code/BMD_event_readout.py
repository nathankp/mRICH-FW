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
"0F07000"+asicMask # set asic enable bits for readout
"0F0800"+pedsub+"1"# set pedsub op to send full wave/ped data, pedsub enable sel, through search mode
"0F090003" 		   # set dig offset
"0F0A0001"         # ped calc mode to send back to pc
"0F0C8000" 		   # set win start
"0F0D0000"		   # setting N averge to 0

commands to dc:
"1ABCDABC" # dc fifo reset
"1F050000" # set SW trigger/pc send to 0
"1F060002" # set dc trig mode to use scrod trigger
"1F0D0000" # set dc to ped calc mode and n average to 1
"1F090003" # set dig offset, if bit 12 = 1: subtract, 0: add
"1F0C8000" # set win start
"1F0B0001" # giving readout reset
"1F0B0000" # clearing readout reset
"0A000000" # giving scrod trigger to start readout
'''

import sys
import time
import os
import binascii
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth


usageMSG="Usage:BMD_takedata.py <interface><ASIC mask><pedsub mode><digi_win start><digi_win offset><plot en><num events>\n" +\
" \nwhere:\n"+\
"ASIC mask : Binary mask for enabled asics:\n" +\
"            0=disable   1=dc 1 only 2=dc 2 only 3=dc 1&2\n"+\
"            4=dc 3 only 5=dc 3&1    6=dc 3&2    7=dc 3-1\n"+\
"            8=dc 4 only 9=dc 4&1    A=dc 4&2    B=dc 4&2-1\n"+\
"            C=dc 4&3    D=dc 4-3&1  E=dc 4-2    F=dc all\n"+\
"Ped sub   : 0 = pedsub disabled 1 = pedsub enabled \n"+\
"            2 = ped data only   3 = waveform data only\n"+\
"win offset: 0 to 508, add '-' to offset window to minus or '+' to plus offset window to plus from moun event window\n"+\
"plot_data : 0=disable	1=plot data\n"+\
"num event : any integer greater than 1\n"

if len(sys.argv)!=8:
	print usageMSG
	exit(-1)

asicMask  = (sys.argv[2])
pedsub    = (sys.argv[3])
winOffset = (sys.argv[4])
plot_data = int(sys.argv[5])
num_events= int(sys.argv[6])

if asicMask<"0" or asicMask>"f" or pedsub<"0" or pedsub>"3" or int(winOffset)<-508 or int(winOffset)>+508 or plot_data<0 or plot_data>1:
	print usageMSG
	exit(-1)

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
interface = sys.argv[1]

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
ctrl.open()

syncwd="000000010253594e4300000000" # must be send before every command string
asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0')
t1 = time.time()
timestr = time.strftime("%Y_%m_%d-%H:%M")
buffSize = 20000
#print "asic MAsk:"+asic_mask + " current dc:"+format(dcnum)+" current mask bit:"+asic_mask[4-dcnum]

# set the stage by sending commands to scrod and DC: 
scrod_reg = "0F050000"+"0F060000"+"0F0700"+asicMask+"0"+"0F080031"+"0F0A0001"+"0F0C0000"+\
			"0"+(hex(int('F090000',16) | offset_dir*(2**12) | win_Offset ).split('x')[1])+\

# uncomment to program all DC
dc_reg = "FABCDABC"+"FF050000"+"FF060000"+"FF0D0000"+"FF0C0000"+\
		 hex(int('FF090000',16) | offset_dir*(2**12) | win_Offset ).split('x')[1]+\

st_reset = "0F0000010F000000FABCDABCFF000001FF000000"

#print "\nValues for SCROD registers sent:" + scrod_reg
#print "\nValues for DC registers sent:" + dc_reg

#--------------------------- Taking data from event triggers -----------------------------------------------------#
print "\nconfiguring registers to take event trigger readout"
ctrl.send(syncwd+scrod_reg+dc_reg+"0F060002"+"FF060002")

for event in range(num_events):
	# waiting for trigger from SCROD
	print "Waiting on event trigger\n"
	rcv = ctrl.receive(buffSize)
#	print rcv
	if rcv[32:40] == "74726967": # looking for "trig" in lower case 
		print "Event Trigger!!! Collecting data for event#%d" %(event) 
		for dcnum in range(1, 5):
			dc_num = hex(dcnum).split('x')[1]
			if asic_mask[4-dcnum] == '1':

				# programing DC registers 
				trig_cmd = "0F060000"+"FABCDABCFF060000"+"0A00000"+dc_num
				ctrl.send(syncwd+trig_cmd)
#				print "trig_reg:"+trig_cmd

				#receving packet from scrod
				rcv = ctrl.receive(buffSize)
				cur_dc  = rcv[10:11]
				smp_win = bin(int(rcv[11:16],16))[2:].zfill(20)
				cur_smp = int(smp_win[0:8],2)
				srt_win = int(smp_win[8:16],2) + int(winOffset)

				length = len(rcv)/2
#				print "Received data: " + rcv

				if length  > 28:
					print "\nReadout of DC#%s event#%d  SMP#%d srt_win#%d complete" %(cur_dc,event,cur_smp,srt_win)
					# write received binary data into file
					rcv = linkEth.hexToBin(rcv)

					# opening new binary file
					# uncomment to save packets in seperate files
					file_name = "outdir/raw_data/DC%d_event#:%d_str_win:%d_%s_data.dat" %(dcnum,event,srt_win,timestr)
					if os.path.isfile("%s" %file_name):
						print "Removing old"
						os.system("sudo rm %s" %(file_name))
					f=open(file_name,'ab')#set to 'ab' to append 
					f.write(rcv)
					f.close()

					# uncomment to save all packets in one file
					file_name_all = "outdir/raw_data/DC%d_all_event#:%d_%s_data.dat" %(dcnum,num_events,timestr)
					if os.path.isfile("%s" %file_name_all):
						print "Removing old"
						os.system("sudo rm %s" %(file_name_all))
					f=open(file_name_all,'ab')#set to 'ab' to append 
					f.write(rcv)
					f.close()
				
					# starting parser and ploting data
					os.system("python BMD_plot.py %s 0 %s %d %d %d %d" %(file_name,pedsub,plot_data,dcnum,srt_win,event))

				else:
					print "\nDC#%d: DEADBEEF" %(dcnum)

		ctrl.send(syncwd+"0F060002"+"FABCDABCFF060002")

	elif rcv[32:40] == "64656164": # SCROD sent 'dead'
		print "System died trying to reset all state machines\n" 
		rcv = "0"
		ctrl.send(syncwd+st_reset)
		time.sleep(0.1)
		ctrl.send(syncwd+scrod_reg+dc_reg) 


# Parsing data with all events
os.system("sudo bin/tx_ethparse1 %s 0" %file_name_all)

scrod_reg = "0F0500000F0600000F0700F00F0800310F0A00010F0910000F0C0000"
dc_reg    = "FABCDABCFF050000FF060000F0D00000FF091000FF0C0000FF000001FF000000"

print "\nresetting registers to take back to software trigger\n"
ctrl.send(syncwd+scrod_reg+dc_reg) 

ctrl.close()
deltaTime = time.time() - t1
print "\nTime to complete = %.3f sec(s)\n" % (deltaTime)





