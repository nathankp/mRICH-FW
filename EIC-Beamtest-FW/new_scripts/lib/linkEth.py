#!/usr/bin/env python
'''
OVERVIEW:
Ethernet Driver for sending UDP Packets.
 
AUTHORS:
Bronson Edralin <bedralin@hawaii.edu>
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214
'''

import sys, time
import socket
import select
import binascii

DEBUG = 0 

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    CYAN = '\033[96m'
    BROWN = '\033[33m'

def asciiToHex(s):
    ''' Input:  s = string of ASCII chars
        Output: return string of HEX       '''
    lst = []
    for ch in s:
        hv = hex(ord(ch)).replace('0x', '')
        if len(hv) == 1:
            hv = '0'+hv
        lst.append(hv)

    return reduce(lambda x,y:x+y, lst)

def hexToAscii(s):
    ''' Input:  s = string of HEX
        Output: return string of ASCII chars  '''
    return binascii.unhexlify(s) # actually converts hex string into binary data;
				 # but the HEX codes for ASCII will convert it to ASCII

def hexToBin(s):
    ''' Input:  s = string of HEX
        Output: return binary data  '''
    return binascii.unhexlify(s)

def mppcToDAC_decoder(ch):
	''' Input: ch = mppc channel numnber
	    Outout: DAC channel number'''
	# mppc to dac channel decoder
	mppc_ch = int(ch)
	if mppc_ch == 1:
		dac_ch = 1;
	elif mppc_ch == 2:
		dac_ch = 0;
	elif mppc_ch == 3:
		dac_ch = 7;
	elif mppc_ch == 4:
		dac_ch = 6;
	elif mppc_ch == 5:
		dac_ch = 2;
	elif mppc_ch == 6:
		dac_ch = 3;
	elif mppc_ch == 7:
		dac_ch = 4;
	elif mppc_ch == 8:
		dac_ch = 5;
	elif mppc_ch == 9:
		dac_ch = 15;
	elif mppc_ch == 10:
		dac_ch = 14;
	elif mppc_ch == 11:
		dac_ch = 8;
	elif mppc_ch == 12:
		dac_ch = 9;
	elif mppc_ch == 13:
		dac_ch = 12;
	elif mppc_ch == 14:
		dac_ch = 13;
	elif mppc_ch == 15:
		dac_ch = 11;
	elif mppc_ch == 69:
		dac_ch = 10;
	else:
		dac_ch = 69;
		print "\nplease input channel numbers from 1-15 or 69 for hv\n"
		quit()
	return dac_ch


class UDP:
    ''' class used to send/receive UDP packets over Ethernet '''
    def __init__(self, addr_fpga, port_fpga, addr_pc, port_pc, interface):
        self.addr_fpga = addr_fpga
        x = addr_fpga.split('.')
	self.addr_broadcast = x[0]+'.'+x[1]+'.'+x[2]+'.255' #This is lame.
	#self.addr_broadcast = x[0]+'.'+x[1]+'.'+x[2]+'.'+x[3]
        self.port_fpga = int(port_fpga)
        self.addr_pc = addr_pc
        self.port_pc = int(port_pc)
        self.interface = interface
	
	''' socket for transmitting (broadcast) '''
        # set up socket for UDP Protocol
        self.sock_trans = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        # Set to broadcast mode
        self.sock_trans.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
	self.sock_trans.setsockopt(socket.SOL_SOCKET, 25, self.interface)
        #self.sock_trans.setblocking(0)    # necessary for UDP

        # bind to all addr at this port
        #self.sock_trans.bind(('',self.port_fpga)) 

        ''' socket for receiving '''
        # set up socket for UDP Protocol
        self.sock_rcv = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        # Set interface
        self.sock_rcv.setsockopt(socket.SOL_SOCKET, 25, self.interface)
        self.sock_rcv.setblocking(0)    # necessary for UDP
        # bind to all addr at this port
        self.sock_rcv.bind(('',self.port_pc))

    # broadcast send
    def send(self, data):
        ''' Input:  data = data in HEX string w/ no spaces
            Output: returns nothing '''
	
	# Convert to binary data in format '\x##'
	data_bin = binascii.unhexlify(data)
	if DEBUG:
            print "\n----------------------------------------------------------"
            print "Transmit to Addr: '%s'" %str("("+\
		str(self.addr_broadcast)+", "+str(self.port_fpga)+")")
	    print ""
	    print "Transmit "+str(len(data)/2)+" bytes of data"
            print ""
            print "Transmit UDP in HEX is: ",data
            #print ""
	#data = hexToAscii(data)  # Convert HEX to ASCII so we can send
        #if DEBUG:
        #    print "Transmit UDP in ASCII is: ",data
            print "----------------------------------------------------------\n"
        self.sock_trans.sendto(data_bin, (self.addr_broadcast, self.port_fpga))
        #self.sock_rcv.sendto(data_bin, (self.addr_fpga, self.port_fpga))

    def receive(self, bufferSize):
        ''' Input:  bufferSize = buffer size for receive 
            Output: returns data in HEX                  '''
        CONNECTION_LIST = []
        done = False
        
        #CONNECTION_LIST = []
        #CONNECTION_LIST.append(self.sock_rcv) 
        while(not done):
            CONNECTION_LIST = []
            CONNECTION_LIST.append(self.sock_rcv)
            inputrdy, outputrdy, exceptrdy = select.select(CONNECTION_LIST, [], [])
       
	    for i in inputrdy:
                if inputrdy is self.sock_rcv:
                    sockfd, addr = self.sock_rcv.accept()
                    CONNECTION_LIST.append(sockfd)
                    print "Connected to ( %s, %s)" %(addr)
                    pass
                else:
                    try:
                        data, addr = i.recvfrom(int(bufferSize))
	                if DEBUG:
		            print "\n----------------------------------------------------------"
                            print "Recv from Addr: '%s'" %str(addr)
                            print ""
	    
                        # necessary to make a string of hex 
                        #data_ascii = data.decode('utf-8')
	                #data_ascii = data.decode('cp1252')
	                data_hex = binascii.b2a_hex(data)  # Convert binary data to hex string
                        #data_hex = asciiToHex(data_ascii)
               
                        if DEBUG:
                            #print "Recv UDP in ASCII: ", data_ascii
                            #print ""
		            print "Received "+str(len(data_hex)/2)+" bytes of data"
		            print ""
                            print "Recv UDP in HEX: ",data_hex
                            print "----------------------------------------------------------\n"
                        done = True 
                    except Exception, e:
                        print bcolors.FAIL+"Error!!! %s" %(e) + bcolors.ENDC
                        i.close()
                        CONNECTION_LIST.remove(i)
                        #CONNECTION_LIST.append(self.sock_rcv)                 
                        self.open()
        return data_hex

    def close(self):
	''' Input:  nothing
	    Output: return nothing just closes socket  '''
	#self.sock_rcv.shutdown(socket.SHUT_RDWR)
	self.sock_rcv.close()
        #self.sock_trans.shutdown(socket.SHUT_RDWR)
        self.sock_trans.close()

    def open(self):
        ''' socket for transmitting (broadcast) '''
        # set up socket for UDP Protocol
        self.sock_trans = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        # Set to broadcast mode
        self.sock_trans.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        #self.sock_trans.setsockopt(socket.SOL_SOCKET, 25, self.interface)
        #self.sock_trans.setblocking(0)    # necessary for UDP

        # bind to all addr at this port
        self.sock_trans.bind(('',self.port_fpga))

        ''' socket for receiving '''
        # set up socket for UDP Protocol
        self.sock_rcv = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        # Set interface
        self.sock_rcv.setsockopt(socket.SOL_SOCKET, 25, self.interface)
        self.sock_rcv.setblocking(0)    # necessary for UDP
        # bind to all addr at this port
        self.sock_rcv.bind(('',self.port_pc))

