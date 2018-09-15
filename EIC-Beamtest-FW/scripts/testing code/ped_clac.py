#!/usr/bin/env python

import sys
import time
import os
import binascii
import numpy as np
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth

asicMask  = (sys.argv[2])

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
buffSize = 20000

# set the stage by sending commands to scrod and DC: 
scrod_reg = "0F050000"+"0F060000"+"0F0700"+asicMask+"0"+"0F080031"+"0F090000"+"0F0A0001"

# uncomment to program all DC
dc_reg = "FABCDABC"+"FF050000"+"FF060000"+"FF070011"+"FF090000"+"FF0D0000"+"FF070001"


print "\nconfiguring registers to take software trigger readout"
ctrl.send(syncwd+scrod_reg+dc_reg+"0F000011"+"0F000010")
time.sleep(.1)

pedarr = [[0 for i in range(16)]for j in range(128)]
ped_val = 0

for dcnum in range(1, 5):
	dc_num = hex(dcnum).split('x')[1];
	if asic_mask[4-dcnum] == '1':
		filename = "outdir/raw_data/DC%d_sw_trig_ped_data.dat" %(dcnum)
		if os.path.isfile("%s" %(filename)):
			os.system( "sudo rm %s" %(filename))

		for win in range(0,1):#127
			win_start = win*4
			win_end = win_start+3
		#	print "start win %d end win %d"%(win_start,win_end)

			# sending commands to scrod and duaghter cards
			trig_cmd = "0"+ hex(int('F0C8000',16) | win_start ).split('x')[1]+dc_num+"ABCDABC"+\
					   hex(int('FF0C8000',16) | win_start ).split('x')[1]
			ctrl.send(syncwd+trig_cmd);
			time.sleep(.2)

			for event in range(100):
				# sending register commands to scrod
				ctrl.send(syncwd+"0A00000"+dc_num)

				# receving packet from scrod
				rcv = ctrl.receive(buffSize)
				length = len(rcv)/2
				#print "Received data: " + rcv

				if length  > 28:
					rcv = linkEth.hexToBin(rcv)
					#writing data to temp file
					f=open(filename,'ab')
					f.write(rcv)
					f.close()
				else:
					print "\nDC#%s: DEADBEEF" %(dcnum)

				if event%20  == 0:
					print "Current event %d for win %d to %d" %(event, win_start, win_end)

			# parsing data 
			os.system("sudo bin/tx_ethparse1 %s 0" %filename)
			os.system("sudo rm %s_CH14.txt" %(filename))

			# opening file and summing with pervious readout
			infile = open('%s_asic_all.txt' %(filename),'r') 	
			for line in infile:
				line = line.replace(',',' ')  # Replace comma with blank space
				value = line.split()
				if (value!=[]):
					if int(value[2])<128:  # if a string or a value occur
						for i in range(16):
							ped_val = int(value[i+5])
							pedarr[int(value[2])][i] = pedarr[int(value[2])][i] + ped_val
#							print pedarr[:][int(value[2])]
#							print "ch#%d smp:%d" %(i,int(value[2]))

			# removing old ped file
			for i in range(win_start,win_end+1):
				ped_filename = "outdir/pedcalc_data/DC%d_ped_data_win%d.txt" %(dcnum,i)
				if os.path.isfile("%s" %(ped_filename)):
					os.system( "sudo rm %s" %(ped_filename))

			# averging data and saving to file
			print "Saving ped data for DC%d win#%d to %d\n" %(dcnum,win_start,win_end) 
			for j in range(128): 
				curr_win = win_start + int(j/32)
				ped_filename = "outdir/pedcalc_data/DC%d_ped_data_win%d.txt" %(dcnum,curr_win)
				outfile = open('%s' %(ped_filename),'a') 	
				data = dc_num+"\t"+str(curr_win)+"\t"+str(j%32)
				for i in range(16):
					data += "\t"+str(int(pedarr[j][i]/100))
				data += "\n"
				outfile.write(data)
			outfile.close()
		
			# removing files from last readout 
			os.system("sudo rm %s" %(filename))
	


				
				

