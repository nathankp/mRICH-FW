#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214 

AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and Isar
Modified by: khanh le 9/6/17 -- rewrote code to work with BMD system

DESCRIPTION:
script will do pedestal calc on all/selected daughter cards and send it up 
to PC or save on to SRAM, ensure to run BMD_TXConfig.py frist to set up system

Notes:


commands to scrod:
"0F050000"         # clear trigger
"0F060000"         # setting trigger mode to sw
"0F0700"+asicMask+"0" # set asic enable bits for readout
"0F0800"+pedsub+"1"# set pedsub op to send full wave/ped data, pedsub enable sel, through search mode
"0F090000" 		   # set dig offset
"0F0A0001"         # ped calc mode to send back to pc
"0F0C8000" 		   # set enable fixed win start
"0F0D0014"		   # enable ped clac and setting N averge

--set internal_CMDREG_PedCalcNAVG to following values:
-- x"0" = averges over 1 readout
-- x"1" = averges over 2 readout
-- x"2" = averges over 4 readout
-- x"3" = averges over 8 readout
-- x"4" = averges over 16 readout
-- x"5" = averges over 32 readout
-- x"6" = averges over 64 readout
-- x"7" = averges over 128 readout
-- else = 0

commands to dc:
"1ABCDABC" # dc fifo reset
"1F050000" # set SW trigger to 0
"1F060000" # set dc trig mode to SW trigger
"1F0D0017" # set dc to ped calc mode and N average to 128
"1F090003" # set dig offset
"1F0C8000" # enable fixed dig start and set win start
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


usageMSG="Usage: python BMD_pedcalc.py <interface> <ASIC mask> <Start win> <End win> <plot en> <calc mode>\n" +\
" \nwhere:\n"+\
"ASIC mask: Binary mask for enabled asics:\n" +\
"           0=disable   1=dc 1 only 2=dc 2 only 3=dc 1&2\n"+\
"           4=dc 3 only 5=dc 3&1    6=dc 3&2    7=dc 3-1\n"+\
"           8=dc 4 only 9=dc 4&1    A=dc 4&2    B=dc 4&2-1\n"+\
"           C=dc 4&3    D=dc 4-3&1  E=dc 4-2    F=dc all\n"+\
"start win: 0-508\n"+\
"end win  : 4-512\n"+\
"plot en  : 0 = disable, 1 = enable\n"
#"calc mode: 0 = save to SRAM, 1 = send to PC \n"

if len(sys.argv)!=6:
	print usageMSG
	exit(-1)

asicMask = (sys.argv[2])
srt_win  = int(sys.argv[3])
end_win  = int(sys.argv[4])
plot_en  = int(sys.argv[5])
#calcMode = (sys.argv[3])
calcMode = "1"

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]


# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
ctrl.open()

# Declare values for constents in script
buffSize  = 20000
t1        = time.time()
timestr   = time.strftime("%Y_%m_%d-%H_%M")
asic_mask = "{0:{fill}4b}".format(int(asicMask,16), fill='0')
syncwd    ="000000010253594e4300000000" # must be send before every command string

cmd_scrod = "0F050000"+"0F060000"+"0F0700"+asicMask+"0"+"0F090000"+"0F080031"+"0F0A000"+calcMode+"0F0C8000"+"0F0D0017";

cmd_dc = "FABCDABC"+"FF050000"+"FF060000"+"FF090000"+"FF0C8000"+"FF0B0001"+"FF0B0000"+"FF0D0014"

#print "\nValues for SCROD registers sent:" + scrod_reg
ctrl.send(syncwd+cmd_scrod+cmd_dc)
time.sleep(.5)


print "\nStarting pedestal calcculation scanning range %d to %d" %(int(srt_win/4),int(end_win/4))
for dcnum in range(1, 5):
	cur_dc = hex(dcnum).split('x')[1]
	if asic_mask[4-dcnum] == '1':

		#getting value for current HV setting then turning off HV
		ctrl.send(syncwd+"FABCDABC"+cur_dc+"D110000")
		rcv     = ctrl.receive(buffSize)
		curr_hv = rcv[38:42]
		ctrl.send(syncwd+"FABCDABC"+cur_dc+"C0A0000")

		#looping over all windows in targetx
		for win_int in range(int(srt_win/4),int(end_win/4)):
			win_start = win_int*4
			win_end = win_start+3
#			print "start win %d end win %d"%(win_start,win_end)
            
			trig_cmd = "0"+ hex(int('F0C8000',16) | win_start ).split('x')[1]+cur_dc+"ABCDABC"+\
					   cur_dc+hex(int('F0C8000',16) | win_start ).split('x')[1]+"0A00000"+cur_dc;
	
			# sending commands to scrod and duaghter cards
			ctrl.send(syncwd+trig_cmd);
#			print "\ncommand sent: " + trig_cmd

			if calcMode == "1":
				# receving packet from scrod
				rcv = ctrl.receive(buffSize)
				length = len(rcv)/2

				if length > 28:
					print "\nDC#%s ped calc for win %3d to %3d complete packet length is %dbits" %(dcnum,win_start,win_end,length)	

				else:
					# first try didnt work try readout window again
					print "\nFirst try to readout win %d to %d failed trying again" %(win_start,win_end)
					ctrl.send(syncwd+cur_dc+"ABCDABC"+cur_dc+"F000001"+cur_dc+"F000000"+\
							  "0F0000010F000000"+"0A00000"+cur_dc);

					rcv = ctrl.receive(buffSize)
					length = len(rcv)/2

					if length > 28:
						print "\nDC#%d ped calc for win %3d to %3d complete packet length is %dbits" %(dcnum,win_start,win_end,length)	
					else:
						print "\nDC#%d pedcalc win %3d to %3d: DEADBEEF" %(dcnum,win_start,win_end)	
				
				
				# removing old binary data file
				if os.path.isfile("outdir/ped_data/DC%d_ped_data_win%d_to_win%d.dat" % (dcnum,win_start,win_end)):
					os.system("rm outdir/ped_data/DC%d_ped_data_win%d_to_win%d.dat" % (dcnum,win_start,win_end))
		
				# opening new binary file
				outfile_name = 'outdir/ped_data/DC%d_ped_data_win%d_to_win%d.dat' % (dcnum,win_start,win_end)
				f=open(outfile_name,'ab');
				
				# write received binary data into file			
				rcv = linkEth.hexToBin(rcv)
				f.write(rcv)
				f.close()
				time.sleep(.1)

				os.system("python BMD_plot.py %s 1 0 %d %d %d 0" %(outfile_name,plot_en,dcnum,win_start))

			else:
				time.sleep(.5)
				print "\nDC#%s ped calc for win %3d to %3d complete" %(dcnum,win_start,win_end)	

		#setting HV back to pervious setting
		ctrl.send(syncwd+"FABCDABC"+cur_dc+"C0A"+curr_hv)
		#print curr_hv

ctrl.close()
deltaTime = time.time() - t1
print "\nTime to complete = %.3f sec(s)\n" % (deltaTime)



