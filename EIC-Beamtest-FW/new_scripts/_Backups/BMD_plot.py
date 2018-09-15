#!/usr/bin/env python
'''
University of Hawaii at Manoa
Instrumentation Development Lab (IDLab), WAT214 

AUTHORS:
Bronson Edralin <bedralin@hawaii.edu> and Isar
Modified by: khanh le 9/6/17 -- removed readout protion of the code

DESCRIPTION:
script reads out daughter card and plots data

Note:
look over code at bottom after line 118 
'''

import sys
import time
import os
import ROOT
import matplotlib.pyplot as plt
import numpy as np
import scipy.stats as stats
from array import array
#SCRIPTPATH = os.path.dirname(os.path.abspath(__file__))
#sys.path.append( SCRIPTPATH+'/lib/')
#import linkEth


class bcolors:
    HEADER    = '\033[95m'
    OKBLUE    = '\033[94m'
    OKGREEN   = '\033[92m'
    WARNING   = '\033[93m'
    FAIL      = '\033[91m'
    ENDC      = '\033[0m'
    BOLD      = '\033[1m'
    UNDERLINE = '\033[4m'
    CYAN      = '\033[96m'
    BROWN     = '\033[33m'

usageMSG="\nUsage: python BMD_plot.py <file name> <ped sub mode> <plot enable> <total number of events>\n" +\
"where:\n"+\
"File name: Input file name to enclude directory if saved in other location\n"+\
"ped data : 0 = event data, 1 = ped data \n"+\
"ped sub  : 0 = disable,    1 = do ped sub\n"+\
"plot en  : 0 = disable ploting               1 = plot each ch on its own plot\n"+\
"           2 = plot all ch on same plot      3 = plot hist for each ch on its own plot\n"+\
"           4 = plot hist for all ch on same\n"+\
"# events : any interger\n"

if len(sys.argv)!=5:
	print usageMSG
	exit(-1)

file_name  = sys.argv[1]
pedsub     = int(sys.argv[2])
plot       = int(sys.argv[3])
num_events = int(sys.argv[4])

#------------------------------------------------------------------------------------------------------------------------------------#
#----------------------------------- Parsing data files -----------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#

# Parsing data
if pedsub != 0:
	print "Prasing current event data"
	rawfile = "%s_AllEvents.txt" %file_name
	if os.path.isfile(rawfile):
		os.system("sudo rm %s" %(rawfile))

	trigfile = "not_being_used_so_delete.txt"
	os.system("sudo bin/tx_ethparse1_ck %s %s %s 2" %(file_name,rawfile,trigfile))
	os.system("sudo rm %s" %(trigfile))
	# set parser setting: 1 = output data format for chris scripts
	# 					  2 = output data fromat for khanh scripts


	# uncomment to use KLM parser
#	os.system("sudo bin/BMD_parser %s" %file_name)
#	os.system("sudo bin/tx_parse1 %s" %file_name)
else:
	rawfile = file_name
#------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------- Doing ped sub --------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#
if pedsub == 1:
	# opening raw data file and reading ped data into array for ped sub
	PedTempFilename = "outdir/pedsub_data/pedsubtemp.txt"
	PedTempFile = open('%s' %(PedTempFilename),'a')	
		
	infile = open(rawfile,'r') 	
	for line in infile:
		line = line.replace(',',' ')  # Replace comma with blank space
		value = line.split()
		if (value!=[]):
			CurrSmp = int(value[2])
			if CurrSmp < 128:
				if CurrSmp == 0:
					PedData  = [[0 for i in range(16)]for j in range(128)]
					PedWin   = [0 for i in range(4)]
					SmpNum   = 0
					DCNum    = int(value[0])
					WinStart = int(value[1])

					# Reading pedestal data from file
					pedfile_name    = "outdir/pedcalc_data/DC%d_peddata_AllWin.txt" %(DCNum)
					for i in range(4):
						PedWin[i] = (WinStart+i)%512	
					
					if PedWin[0]>PedWin[3]:# case where readout window looped around 
						for i in range(4):
							pedfile = open('%s' %(pedfile_name),'r') # Read text file
							for PedLine in pedfile:
								PedLine = PedLine.replace(',',' ')  # Replace comma with blank space
								PedValue = PedLine.split()
								if SmpNum < 128:
									if int(PedValue[1]) == PedWin[i]:
										for ch in range(16):
											PedData[SmpNum][ch] = PedValue[ch+3]
										SmpNum += 1			
							pedfile.close()

					else:# case where readout window is sequentail
						pedfile = open('%s' %(pedfile_name),'r') # Read text file
						for PedLine in pedfile:
							PedLine = PedLine.replace(',',' ')  # Replace comma with blank space
							PedValue = PedLine.split()
							if SmpNum < 128:
								if int(PedValue[1]) >= PedWin[0] and int(PedValue[1]) <= PedWin[3]:
									for ch in range(16):
										PedData[SmpNum][ch] = PedValue[ch+3]
									SmpNum += 1
						pedfile.close()
#					print PedWin
#					print PedData

					# opening raw data file and new pedsub data file
					pedsubfile_name = "outdir/pedsub_data/DC%d_pedsub_data_%devents.txt" %(DCNum,num_events)
					pedsubfile = open('%s' %(pedsubfile_name),'a')

				
				#doing the subtraction on every sample
				data = str(DCNum)+"\t"+value[1]+"\t"+str(CurrSmp)
				for ch in range(16):
					data += "\t"+str(int(value[ch+3])-int(PedData[CurrSmp][ch])) 
				data +="\n"

			elif CurrSmp == 128:# saving trigger channel and start channel to last line of data
#				data  = str(DCNum)+"\t"+str((WinStart-1+int(CurrSmp/32))%512)+"\t"+str(CurrSmp)
				data = "%s\t%s\t%s\t%s\t%s\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\n" %(value[0],value[1],value[2],value[3],value[4])

			pedsubfile.write(data)
			PedTempFile.write(data)

	infile.close()
	pedsubfile.close()
	PedTempFile.close()

#------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------- Averaging ped data file ---------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#
elif pedsub == 2:
	pedarr = [[0 for i in range(16)]for j in range(16384)]# win*sample = 512*32 = 16384
	ped_val  = 0
	NumEvent = 0
	lineCNT  = 0
 
	# opening file and averging readouts
	infile = open(rawfile,'r') 	
	for line in infile:
		line = line.replace(',',' ')  # Replace comma with blank space
		value = line.split()
		if (value!=[]):
			#Reading in data and summing
			if int(value[2])<128:
				for i in range(16):
					ped_val = pedarr[lineCNT%(16384)][i] + int(value[i+3])
					pedarr[lineCNT%(16384)][i] = ped_val
				lineCNT += 1 
			elif int(value[2]) == 128:
				DCNum = int(value[0])
	infile.close()

	print "Saving pedestal data for DC%d\n" %(DCNum)
	lineCNT = 0
	CurWin  = 0
	pedfile_name = "outdir/pedcalc_data/DC%d_peddata_AllWin.txt" %(DCNum)
	outfile = open('%s' %(pedfile_name),'a') 
	for line in pedarr:
		data = str(DCNum)+" "+str(CurWin)+" "+str(lineCNT%32)
#		print data
		for i in range(16):
			data += " "+str((pedarr[lineCNT][i]/(num_events)))
		data += "\n"
		outfile.write(data)
		lineCNT += 1
		if int(lineCNT%32) == 0:
			CurWin += 1 
	outfile.close()

#	pedarr = [[0 for i in range(16)]for j in range(128)]
#	ped_val  = 0
#	NumEvent = 0
#	# opening file and averaging readouts
#	infile = open(rawfile,'r') 	
#	for line in infile:
#		line = line.replace(',',' ')  # Replace comma with blank space
#		value = line.split()
#		if (value!=[]):
#			#Reading in data and summing
#			if int(value[2])<128:
##				curwin = int(value[1])
#				for i in range(16):
#					ped_val = pedarr[int(value[2])][i] + int(value[i+3])
#					pedarr[int(value[2])][i] = ped_val
#			elif int(value[2]) == 128: 
#				# Checking if all events for data set if summed, if so does averging and saves ped data into file
#				WinStart = int(value[4])
#				WinEnd   = int(value[1])
#				DCNum    = int(value[0])
#				pedfile_name    = "outdir/pedcalc_data/DC%d_peddata_AllWin.txt" %(DCNum)
#				if WinEnd == WinStart+3:
#					NumEvent = NumEvent + 1;
#					if NumEvent == num_events:
#						print "Saving ped data for DC%d win %d to %d" %(DCNum,WinStart,WinStart+3) 
#						for j in range(128): 
#							curr_win = WinStart + int(j/32)
#							outfile = open('%s' %(pedfile_name),'a') 	
#							data = str(DCNum)+" "+str(curr_win)+" "+str(j%32)
#							for i in range(16):
#								data += " "+str((pedarr[j][i]/(num_events)))
#							data += "\n"
#							outfile.write(data)
#						outfile.close()
#						NumEvent = 0;
#						pedarr = [[0 for i in range(16)]for j in range(128)]
#	infile.close()

#------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------- plotting data --------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#
if plot != 0:

	if pedsub == 1:
		fIn = open('%s' %(PedTempFilename),'r')
	else:
		fIn = open(rawfile,'r') 	

	ch = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
	sample = array( 'd' )
	curr_event = 1
	srtDC = 0
	hist_arr = array('d')

	for line in fIn:
		line = line.replace(',',' ')  # Replace comma with blank space
		value = line.split()
		if (value!=[]):
			if int(value[2])<128:  # if a string or a value occur
				sample.append(float(value[2]))
				ch[0].append(float(value[3]))
				ch[1].append(float(value[4]))
				ch[2].append(float(value[5]))
				ch[3].append(float(value[6]))
				ch[4].append(float(value[7]))
				ch[5].append(float(value[8]))
				ch[6].append(float(value[9]))
				ch[7].append(float(value[10]))
				ch[8].append(float(value[11]))
				ch[9].append(float(value[12]))
				ch[10].append(float(value[13]))
				ch[11].append(float(value[14]))
				ch[12].append(float(value[15]))
				ch[13].append(float(value[16]))
				ch[14].append(float(value[17]))
				ch[15].append(float(value[18]))
			
			elif int(value[2])==128: 
				DCNum    = int(value[0])
				trig_ch  = int(value[3])-1
				WinStart = int(value[4])

				if curr_event == 1 and srtDC == 0:
					srtDC = DCNum
				elif DCNum == srtDC:
					curr_event += 1

				if plot == 1:
					print "plotting data from DC%d event %d of %d in individual plots" %(DCNum,curr_event,num_events) 
					for i in [15]:#range(0,16) ,[trig_ch]
						plt.plot(sample,ch[i],color='black', linestyle='solid', marker='o',markerfacecolor='blue', markersize=5)
						plt.title('DC#%d CH#%d win:%d-%d' %(DCNum,i+1,WinStart,WinStart+3))
						plt.xlabel("Sample #")
						plt.ylabel("ADC count")

						MaxVal = int(max(ch[i]))
						MinVal = int(min(ch[i]))
						plt.ylim(MinVal-20,MaxVal+20)

						plotname = "outdir/plots/DC%d_CH%d_event%d.png" % (DCNum, i+1, curr_event)
						plt.savefig(plotname)
						plt.clf()

				elif plot == 2:
					print "plotting data from DC%d event %d of %d on same plot" %(DCNum,curr_event,num_events) 
					f, axarr = plt.subplots(4,4,sharex=True, sharey=True,figsize=(8,8))
					plt.suptitle("DC#%d event%d all channels win:%d-%d\nNote: Orange plot is triggered channel" %(DCNum,curr_event,WinStart,WinStart+3))
					f.text(0.5, 0.02, 'Sample #', ha='center')
					f.text(0.02, 0.5, 'ADC count', va='center', rotation='vertical')
					MaxVal = int(max(map(max,ch[:14])))
					MinVal = int(min(map(min,ch[:14])))
					for i in range(4):
						for j in range(4):
							if 4*i+j == trig_ch:
								axarr[j,i].plot(sample,ch[4*i+j],'C1')
							else:
								axarr[j,i].plot(sample,ch[4*i+j])

							if pedsub == 1:
#								axarr[j,i].axes.set_ylim(-20,100)
								axarr[j,i].axes.set_ylim(-20,MaxVal+20)
							else:
#								axarr[j,i].axes.set_ylim(-20,2200)
								axarr[j,i].axes.set_ylim(MinVal-20,MaxVal+20)

							axarr[j,i].set_title('CH %d' %(4*i+j+1))

					plotname = 'outdir/plots/DC%d_all_ch_event#%d.png' % (DCNum, curr_event)	
					plt.savefig(plotname)
					plt.clf()

				ch = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
				sample = array( 'd' ) 

if plot == 3:
	for i in range(0,16):#0-16
		print "\nplotting histagram of data for %d events from ch%d" %(num_events,i+1)
		plt.hist(ch[i])     
		plt.title('DC%d CH%d win:%d-%d std:%.3f,mean:%.3f,Entries:%d' %(dcnum,i+1,win_start,win_start+3,np.std(ch[i]),np.mean(ch[i]),len(ch[i])))
		plt.xlabel("pedestal RMS")
		plt.ylabel("ADC counts")
		plotname = 'outdir/plots/DC%d_ch%d_hist_%d_events.png' % (dcnum,i+1,num_events)
		plt.savefig(plotname)

elif plot == 4:
	print "plotting histagram of data for %d event on singal plot" %(num_events) 
	f, axarr = plt.subplots(4,4,sharex=True, sharey=True,figsize=(8,8))
	plt.suptitle("DC#%d all channels win:%d-%d" %(dcnum,win_start,win_start+3))
	f.text(0.5, 0.02, 'pedestal RMS', ha='center')
	f.text(0.02, 0.5, 'One entery per storage cell', va='center', rotation='vertical')
	for i in range(4):
		for j in range(4):
			axarr[j,i].hist(ch[4*i+j])
			axarr[j,i].set_title('CH %d' %(4*i+j+1))
	plotname = 'outdir/plots/DC%d_all_ch_hist_%d_events.png' % (dcnum,num_events)
	plt.savefig(plotname)

if pedsub == 1:
	os.system("sudo rm %s" %(PedTempFilename))
