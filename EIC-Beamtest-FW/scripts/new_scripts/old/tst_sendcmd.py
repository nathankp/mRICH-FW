#!/usr/bin/env python
'''
OVERVIEW:
Test script for sending UDP Packets.
 
AUTHORS:
Bronson Edralin <bedralin@hawaii.edu>
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

DESCRIPTION:
chmod +x tst_sendUDP.py
./tst_sendUDP.py
'''


import sys
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth

# Ethernet Configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'
interface = 'eth0'
#port_pc='24576'
#port_fpga='28672'

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)
#ctrl.open()
#data="000102030405060708090A0B0C0D0E0F101112131415161718191A1B1C1D1E1F202122232425262728292A2B2C2D2E2F303132333435363738393A3B3C3D3E3F404142434445464748494A4B4C4D4E4F505152535455565758595A5B5C5D5E5F606162636465666768696A6B6C6D6E6F";
data="000000010253594e4300000000"+sys.argv[1];

#data = data*3

# Transmit UDP packet
ctrl.send(data)

#rcv = ctrl.receive('10000')

#ctrl.close()
