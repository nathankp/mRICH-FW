#!/usr/bin/env python
'''
OVERVIEW:
Test script for receiving UDP Packets.
 
AUTHORS:
Bronson Edralin <bedralin@hawaii.edu>
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214

DESCRIPTION:
chmod +x tst_rcvUDP.py
./tst_rcvUDP.py

'''

import sys
import os
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth
import os

# Ethernet configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'

#port_fpga = '28672'
#port_pc = '24576'
interface = 'eth1'

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)



#ctrl.close()
ctrl.open()

# write received binary data into file
os.system("rm data.dat")
os.system("rm packetLen")


for i in range(1, 200):
    #print "Packet #",i
    # Declare buffer size for receiving UDP Packets
    buffSize = 10000

    # Receive UDP packets
    # rcv is string of Hex
    rcv = ctrl.receive(buffSize)
    
    length = len(rcv)/2
    print "Packet #"+str(i)+": length = "+str(length)+"Bytes and header = "+rcv[0:16]+"\n"
    #with open('packetLen','a') as f:
#	f.write("Packet #"+str(i)+": length = "+str(length)+"Bytes and header = "+rcv[0:16]+"\n")
    # Convert string of Hex to Binary data
    rcv = linkEth.hexToBin(rcv)

    # write received binary data into file
    with open('data.dat','ab') as f:
	f.write(rcv)


ctrl.close()


