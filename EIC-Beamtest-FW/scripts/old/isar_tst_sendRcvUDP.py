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
interface = 'eth1'
#port_pc = '24576'
#port_fpga='28672'

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)

data="000000010253594e4300000000"+"AF370001AE000001AF370000AE000010AF320001AE000001AF320000";

# Transmit UDP packet
ctrl.send(data)

ctrl.close()
ctrl.open()
# Declare buffer size for receiving UDP Packets
buffSize = 10024

# Receive UDP packets
# rcv is string of Hex
rcv = ctrl.receive(buffSize)
# Convert string of Hex to Binary data
#rcv = linkEth.hexToBin(rcv)

print "rcv: ",rcv
