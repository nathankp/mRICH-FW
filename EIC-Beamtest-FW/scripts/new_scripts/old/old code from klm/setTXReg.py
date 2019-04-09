#!/usr/bin/env python
'''
OVERVIEW:
Test script for sending UDP commands.
 
AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and  Isar Mostafanezhad
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214
'''


import sys
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth
import time

usageMSG="Usage: setTXReg <interface> <ASIC no> <ASIC Reg No> <ASIC Reg Val>\n This command will write a certain value to a certain register on acertain asic\n"
if len(sys.argv)!=5:
	print usageMSG
	exit(-1)

asicNo=int(sys.argv[2]);
asicRegNo=int(sys.argv[3]);
asicRegVal=int(sys.argv[4]);

if asicNo<0 or asicNo>9 or asicRegNo<0 or asicRegNo>80 or asicRegVal<0 or asicRegVal>4096 :
	print usageMSG
	exit(-1)

"B01C05AA"

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)

cmd_asic =hex((int('B0000000',16) | asicNo*(2**24) | asicRegNo*(2**16) |  asicRegVal )).split('x')[1] #enable ped calc

ctrl.open()
syncwd="000000010253594e4300000000"


ctrl.send(syncwd+cmd_asic )
time.sleep(.1)

ctrl.close()


