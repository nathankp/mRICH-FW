#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214 

AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and Isar
Modified by: khanh le 9/6/17 -- rewrote code to work with BMD system

DESCRIPTION:
Script for sending configuration registers to BMD daughter cards.

Notes:


commands to scrod:
"0F000000"# clearing all reset signals
"0F050000"# clearing readout signal
"0F0700F0"# enable all 4 dc
"0F080011"# sets calcmod=through, sets fifo output sel=pedsub, set dataout = fullwave
"0F090003"# digitization window offset
"0F0C0000"# diabling force window start readout mode 
"0F0D0000"# sets clac_ped_en to not do ped sub and N averge to 0 
"0F120000"# clearing SRAM update 

commands to dc:
"1F000000"# clearing state machine reset signal
"1F030080"# setting tx dac load period
"1F040140"# setting tx dac latch period
"1F050000"# clearing software trig
"1F060000"# sets tx trigger to software trigger
"1F070001"# sets asic enable
"1F080000"# trig delay 
"1F090003"# dig offset 
"1F0A0003"# win num to read
"1F0B0000"# clearing event num count
"1F0C0000"# diabling force window start readout mode 
"1F0D0000"# sets dc to regular operation and NAVG = 0 , ie. not pedcalc or force test pattern
"1F0E10011F0E0011"#resets sampling logic and PARAMS
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
import os
import time
SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
sys.path.append( SCRIPTPATH+'/lib/')
import linkEth


usageMSG="\nUsage: setMBTXConfig <interface>\n"; 
if len(sys.argv)!=2:
	print usageMSG
	exit(-1)



# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = sys.argv[1]

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)

ctrl.open()
syncwd="000000010253594e4300000000"

cmd_scrod="0F0000000F0500000F0700F00F0800110F0900030F0C00000F0D00000F120000"

cmd_txdc_1="FABCDABCFF000000FF030080FF040140FF050000FF060000FF070001FF080000FF090003"+\
"FF0A0003FF0B0000FF0C0000FF0D0000FF0E1001FF0E0001FF0F0F00FF120100FB0005AA"+\
"FB0205AAFB0405AAFB0605AAFB0805AAFB0A05AAFB0C05AAFB0E05AAFB1005AA"+\
"FB1205AAFB1405AA";

cmd_txdc_2="FABCDABCFB1605AAFB1805AAFB1A05AAFB1C05AAFB1E05AAFB0103D9FB0303D9FB0503D9"+\
"FB0703D9FB0903D9FB0B03D9FB0D03D9FB0F03D9FB1103D9FB1303D9FB1503D9"+\
"FB1703D9FB1903D9FB1B03D9FB1D03D9FB1F03D9FB300514FB310000FB320A5A"+\
"FB33044CFB3405DC";

cmd_txdc_3="FABCDABCFB350426FB3604B9FB370000FB380480FB390000FB3A08BBFB3B0000FB3D04A6"+\
"FB3E044CFB3F044CFB40008FFB4100A3FB42000DFB430021FB440014FB450028"+\
"FB460021FB470035FB480038FB49000CFB4A0028FB4B003AFB4C02E1FB4D0C28"+\
"FB4E0480FB4F0AAAFF060000";


ctrl.send(syncwd+cmd_scrod)
print "\nConfig parameters sent to SCROD";
time.sleep(.1);
ctrl.send(syncwd+cmd_txdc_1)
time.sleep(.5);
ctrl.send(syncwd+cmd_txdc_2)
time.sleep(.5);
ctrl.send(syncwd+cmd_txdc_3)
time.sleep(1);
print "\nConfig parameters sent to DC\n";
ctrl.close()



