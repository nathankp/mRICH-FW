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
import time
#import scipy.stats as stats
#import matplotlib.mlab as mlab
#import matplotlib.pyplot as plt
#import tx_process
#import pylab as py
#from scipy import optimize
#import ROOT
#from array import array
import time

# Ethernet configuration
addr_fpga = '192.168.20.5'
addr_pc = '192.168.20.1'
port_pc = '28672'
port_fpga = '24576'

#port_fpga = '28672'
#port_pc = '24576'
interface = 'eth0'

# Make UDP class for receiving/sending UDP Packets
ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)



#ctrl.close()
ctrl.open()

# write received binary data into file
os.system("rm data.dat")
os.system("rm packetLen")
#    c1 = ROOT.TCanvas("c1","mycanvas")
#    c1.Clear()
	
t1 = time.time()
for i in range(1, 200):
    #print "Packet #",i
    # Declare buffer size for receiving UDP Packets
    buffSize = 50000

    # Receive UDP packets
    # rcv is string of Hex

    trig_cmd="AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000";
    ctrl.send(trig_cmd)

    rcv = ctrl.receive(buffSize)
    time.sleep(0.055)
    length = len(rcv)/2
    print "Packet #"+str(i)+": length = "+str(length)+" bytes and header = "+rcv[0:16]
    #with open('packetLen','a') as f:
	#f.write("Packet #"+str(i)+": length = "+str(length)+" bytes and header = "+rcv[0:16]+"\n")
    # Convert string of Hex to Binary data
    rcv = linkEth.hexToBin(rcv)

#	wave=[]
#	for j= range(0,length-1)
##		chno=rcv(j) and 0xFFF
#		wave.append(rcv[j]  and 0xFFF)

#	n = len(wave)
#	x, y = array( 'd' ), array( 'd' )
#	for k in range(0, len(wave)):
#		x.append(k)
#		y.append(wave[k])
#	g = ROOT.TGraph(n, x, y)
#		#g.SetMarkerStyle(ROOT.kFullCircle)
#		#g.SetMarkerColor(plot_count);
#	g.SetLineWidth(2)
#		#g.SetLineColor(k+2)
#		#g.Draw("AL")
#		#ROOT.gPad.Update()
#	c.Update()
#	mg.Add(g)
#	g.Draw("APL")
#	del g, x, y	

	
    # write received binary data into file
    with open('data.dat','ab') as f:
		f.write(rcv)


ctrl.close()

t2=time.time()

print "Time = "+str(t2-t1)+" sec(s) to complete"

