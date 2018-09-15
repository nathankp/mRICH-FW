#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214 

AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and Isar
Modified by: khanh le 9/6/17 -- rewrote code to work with BMD system

DESCRIPTION:
script will readout 4 windows of all/selected daughter cards and send it up 
to PC or save on to SRAM

Notes:
SRAM currently doesnt work KPL--10/19/2017

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
"1F050000" # set SW trigger to 0
"1F060000" # set dc trig mode to SW trigger
"1F0D0000" # set dc to ped calc mode and n average to 1
"1F090003" # set dig offset
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


usageMSG="Usage:BMD_takedata.py <interface><ASIC mask><pedsub mode><digi_win start><digi_win offset><plot en>\n" +\
" \nwhere:\n"+\
"ASIC mask : Binary mask for enabled asics:\n" +\
"            0=disable   1=dc 1 only 2=dc 2 only 3=dc 1&2\n"+\
"            4=dc 3 only 5=dc 3&1    6=dc 3&2    7=dc 3-1\n"+\
"            8=dc 4 only 9=dc 4&1    A=dc 4&2    B=dc 4&2-1\n"+\
"            C=dc 4&3    D=dc 4-3&1  E=dc 4-2    F=dc all\n"+\
"Ped sub   : 0 = pedsub disabled 1 = pedsub enabled \n"+\
"            2 = ped data only   3 = waveform data only\n"+\
"win start : 0 to 508\n"+\
"win offset: 0 to 508, add '-' to offset window to minus or '+' to plus offset window to plus from moun event window\n"+\
"plot_data : 0 = no  1 = yes\n"+\
"num events: any interger"

if len(sys.argv)!=8:
	print usageMSG
	exit(-1)

asicMask  = (sys.argv[2])
pedsub    = (sys.argv[3])
winStart  = int(sys.argv[4])
winOffset = (sys.argv[5])
plot_data = int(sys.argv[6])
num_events = int(sys.argv[7])


if asicMask<"0" or asicMask>"f" or pedsub<"0" or pedsub>"3" or winStart<0 or winStart>508 or int(winOffset)<-508 or int(winOffset)>+508 or plot_data<0 or plot_data>1:
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
t1 = time.time();
timestr = time.strftime("%Y_%m_%d-%H_%M")

syncwd="000000010253594e4300000000" # must be send before every command string

# set the stage by sending commands to scrod: replace "0F080031" with "0F0800"+pedsub+"1" once sram issue is fixed
scrod_reg = "0F050000"+"0F060000"+"0F0700"+asicMask+"0"+"0F080031"+"0F0A0001"+\
			"0"+(hex(int('F090000',16) | offset_dir*(2**12) | win_Offset).split('x')[1])+\
		    "0"+hex(int('F0C1000',16) | winStart ).split('x')[1]

dc_reg = "FABCDABC"+"FF050000"+"FF060000"+"FF0D0000"+\
		 hex(int('FF090000',16) | offset_dir*2**12 | win_Offset ).split('x')[1]+\
		 hex(int('FF0C1000',16) | winStart).split('x')[1]

asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0');

ctrl.send(syncwd+scrod_reg+dc_reg+"0F0000010F000000"); 

#print "\nValues for SCROD registers sent:" + scrod_reg
#print "\nValues for DC registers sent:" + dc_reg

# Declare buffer size for receiving UDP Packets
buffSize = 20000

for event in range(num_events):
	for dcnum in range(1, 5):
		dc_num = hex(dcnum).split('x')[1];

		if asic_mask[4-dcnum] == '1':
			# programing DC registers 
			if pedsub == "2":
				trig_cmd = "0A00"+dc_num+"000";
			else:
				trig_cmd = "0A00000"+dc_num;

			# sending register commands to scrod
			ctrl.send(syncwd+trig_cmd);
			#print "dc_reg:"+trig_cmd

			# receving packet from scrod
			rcv = ctrl.receive(buffSize)
			length = len(rcv)/2
			#print "Received data: " + rcv

			if length  > 28:
				win_srt = winStart-winOffset
				print "\nReadout of DC#%s windows %s to %s complete" %(dcnum,win_srt,win_srt+3)
				rcv = linkEth.hexToBin(rcv)
				# write received binary data into file
				# opening new binary file and saving data
				filename = 'outdir/raw_data/DC%d_sw_trig_wins_%d_to_%d_data.dat' %(dcnum,win_srt,win_srt+3)

				if os.path.isfile("%s" %filename):
					print "Removing old file"
					os.system("sudo rm %s" %(filename))

				f=open(filename,'ab') # 73772074726967 = sw trig
				f.write(rcv)
				f.close()

				# starting plot script
				if plot_data == 1:
					os.system("python BMD_plot.py %s 0 %s %d %d %d 0" %(filename,pedsub,plot_data,dcnum,win_srt))
				else:
					os.system("python BMD_plot.py %s 0 0 0 %d %d 0" %(filename,dcnum,win_srt))

			else:
				print "\nDC#%s: DEADBEEF" %(dcnum)

ctrl.close()

deltaTime = time.time() - t1
print "\nTime to complete = %.3f sec(s)\n" % (deltaTime)





