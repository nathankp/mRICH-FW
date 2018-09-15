#!/usr/bin/env python
'''
OVERVIEW:
This is script is used for changing the DAC Registers.
 
AUTHORS:
Bronson Edralin <bedralin@hawaii.edu>
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214
     
DESCRIPTION:
chmod +x tx_writeDacReg.py
./tx_writeDacReg.py <ASIC#> <ASIC REG#> <DAC VAL>
'''

import sys
import os 
SCRIPTPATH = os.path.dirname(__file__)
sys.path.append( SCRIPTPATH+'/lib/' )
import linkEth

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


def main():
    if len(sys.argv) != 4:
        print bcolors.FAIL+"Wrong number of arguments: usage "+\
	    "./tx_writeDacReg <ASIC#> <ASIC REG#> <DAC VAL>"+bcolors.ENDC
        sys.exit()

    asicno = sys.argv[1]
    regNum = sys.argv[2]
    regVal = sys.argv[3]

    try:
	asicno = int(asicno)
	if ( asicno < 0 or asicno > 9):
	    print bcolors.FAIL+"Invalid asic number, exiting"+bcolors.ENDC
	    sys.exit()
    except ValueError:
	print bcolors.FAIL+"Invalid asic number, exiting"+bcolors.ENDC
	sys.exit()

    try:
        regNum = int(regNum)
        if ( regNum < 0 or regNum > 1024):
            print bcolors.FAIL+"Invalid register number, exiting"+bcolors.ENDC
            sys.exit()
    except ValueError:
        print bcolors.FAIL+"Invalid register number, exiting"+bcolors.ENDC
        sys.exit()

    try:
        regVal = int(regVal)
        if ( regVal < 0 or regVal > 4095):
            print bcolors.FAIL+"Invalid register value, exiting"+bcolors.ENDC
            sys.exit()
    except ValueError:
        print bcolors.FAIL+"Invalid register value, exiting"+bcolors.ENDC
        sys.exit()

    print "Start DAC Program Process - Writing ASIC # "+str(asicno)+\
	"\tRegister "+str(regNum)+"\tValue "+str(regVal)

    # create ethernet interface
    addr_fpga = '192.168.20.5'
    addr_pc = '192.168.20.1'
    port_pc = '28672'
    port_fpga = '24576'
    interface = 'eth1'
    ctrl = linkEth.UDP(addr_fpga, port_fpga, addr_pc, port_pc, interface)

    # Create packet to send
    asicreg = "B"  # hex ctrl word
    asicno_hex = hex(asicno).lstrip('0x')
    if asicno_hex == '':
	asicno_hex = '0'
    regNum_hex = hex(regNum).lstrip('0x')
    
    if regNum_hex == '':
	regNum_hex = '00'
    elif len(regNum_hex) < 2:
	regNum_hex = "0"+regNum_hex
    regVal_hex = hex(regVal).lstrip('0x')
    if regVal_hex == '':
	regVal_hex = '0000'
    elif len(regVal_hex) < 4 and len(regVal_hex) >= 3:
        regVal_hex = "0"+regVal_hex
    elif len(regVal_hex) < 3 and len(regVal_hex) >= 2:
        regVal_hex = "00"+regVal_hex
    elif len(regVal_hex) < 2 and len(regVal_hex) >= 1:
        regVal_hex = "000"+regVal_hex

    data_packet = asicreg + asicno_hex + regNum_hex + regVal_hex
    
    if DEBUG:
	print asicreg
	print asicno_hex
	print regNum_hex
	print regVal_hex

    # Send packet
    ctrl.send(data_packet)

    del ctrl

    '''
    data = 'Hi FPGA!!!!!!'
    data_hex = str(linkEth.asciiToHex(data))
    print "data_hex: ",data_hex
    ctrl.send(data_hex)

    data = 'Hi Man...'
    data_hex = str(linkEth.asciiToHex(data))
    print "data_hex: ",data_hex
    ctrl.send(data_hex)

    ctrl.receive('1024')
    '''

main()
