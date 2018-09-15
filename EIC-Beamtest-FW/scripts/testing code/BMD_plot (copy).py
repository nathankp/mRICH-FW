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

usageMSG="\nUsage: python BMD_plot.py <file name> <ped sub mode> <plot enable> <dc num> <win start> <current event> <total number of events>\n" +\
"where:\n"+\
"File name: Input file name to enclude directory if saved in other location\n"+\
"ped data : 0 = event data, 1 = ped data \n"+\
"ped sub  : 0 = disable,    1 = do ped sub\n"+\
"plot en  : 0 = disable ploting               1 = plot each ch on its own plot\n"+\
"           2 = plot all ch on same plot      3 = plot hist for each ch on its own plot\n"+\
"           4 = plot hist for all ch on same\n"+\
"dcnum    : 1-4\n"+\
"win_start: 0-508\n"+\
"event    : any number\n"+\
"# events : any interger\n"

if len(sys.argv)!=8:
	print usageMSG
	exit(-1)

file_name = sys.argv[1]
pedsub   = int(sys.argv[2])
plot      = int(sys.argv[3])
dcnum     = int(sys.argv[4])
win_start = int(sys.argv[5])
event     = int(sys.argv[6])
num_events= int(sys.argv[7])

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

#	os.system("sudo bin/BMD_parser %s" %file_name)
#	os.system("sudo bin/tx_parse1 %s" %file_name)

#------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------- Doing ped sub --------------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#
pedfile_name    = "outdir/pedcalc_data/DC%d_peddata_AllWin.txt" %(dcnum)
pedsubfile_name = "outdir/pedsub_data/DC%d_pedsub_data_%devents.txt" %(dcnum,num_events)
pedsubfile_temp = "outdir/pedsub_data/pedsub_data_temp.txt"

if os.path.isfile(pedsubfile_temp):
	os.system("sudo rm %s" %(pedsubfile_temp))

if pedsub == 1:
	#reading ped file and saving to array for ped sub
	ped_data = [[0 for i in range(16)]for j in range(128)]
	ped_win = [0 for i in range(4)]
	smp_num = 0

	for i in range(4):
		ped_win[i] = (win_start+i)%512	
#		print ped_win

	print "doing ped sub on windows %d-%d" %(ped_win[0],ped_win[3])
	pedfile = open(pedfile_name,'r') # Read text file
	if ped_win[0]>ped_win[3]:# case where readout window looped around 
		for i in range(4):
			pedfile = open('%s' %(pedfile_name),'r') # Read text file
			for line in pedfile:
				line = line.replace(',',' ')  # Replace comma with blank space
				value = line.split()
				if smp_num < 128:
					if int(value[1]) == ped_win[i]:
						for ch in range(16):
#							print "win%s smp%d ch%d" %(value[1],smp_num,ch)
							ped_data[smp_num][ch] = value[ch+3]
						smp_num += 1			
			pedfile.close()

	else:# case where readout window is sequentail
#		pedfile = open('%s' %(pedfile_name),'r') # Read text file
		for line in pedfile:
			line = line.replace(',',' ')  # Replace comma with blank space
			value = line.split()
			if smp_num < 128:
				if int(value[1]) >= ped_win[0] and int(value[1]) <= ped_win[3]:
					for ch in range(16):
#						print "win%s smp%d ch%d" %(value[1],smp_num,ch)
						ped_data[smp_num][ch] = value[ch+3]
					smp_num += 1
		pedfile.close()

	# Reading raw event data and opening new file for pedsubed data
	infile = open(rawfile,'r') 	
	pedsubfile = open('%s' %(pedsubfile_name),'a')
	pedsubtemp = open('%s' %(pedsubfile_temp),'a')

	print "Doing pedestal subtraction on event %d for windows %d to %d" %(event,win_start,(win_start+3)%512)
	for line in infile:
		line = line.replace(',',' ')  # Replace comma with blank space
		value = line.split()
		if (value!=[]):
			if int(value[2]) < 128:
				#doing the subtraction on every sample
				data = str(dcnum)+"\t"+str((win_start+int(int(value[2])/32))%512)+"\t"+value[2]
				for ch in range(16):
					data += "\t"+str(int(value[ch+3])-int(ped_data[int(value[2])][ch])) 
				data +="\n"

			elif int(value[2]) == 128:# saving trigger channel and start channel to last line of data
				data  = str(dcnum)+"\t"+str((win_start-1+int(int(value[2])/32))%512)+"\t"+value[2]
				data += "\t%s\t%s\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\n" %(value[3],value[4])

			pedsubfile.write(data)
			pedsubtemp.write(data)

	infile.close()
	pedsubfile.close()
	pedsubtemp.close()

#------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------- Averaging ped data file ---------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#
elif pedsub == 2:
	print "Saving ped data for DC%d win %d to %d\n" %(dcnum,win_start,win_start+3) 
	pedarr = [[0 for i in range(16)]for j in range(128)]
	ped_val = 0
	NumEvent = 0

	# opening file and averging readouts
	infile = open(rawfile,'r') 	
	for line in infile:
		line = line.replace(',',' ')  # Replace comma with blank space
		value = line.split()
		if (value!=[]):
			#Reading in data and summing
			if int(value[2])<128:
				curwin = int(value[1])
				for i in range(16):
					ped_val = pedarr[int(value[2])][i] + int(value[i+3])
					pedarr[int(value[2])][i] = ped_val
			elif int(value[2]) == 128: 
				# Checking if all events for data set if summed, if so does averging and saves ped data into file
				win_start = int(value[4])
				if curwin == win_start+3:
					NumEvent = NumEvent + 1;
					if NumEvent == num_events:
						for j in range(128): 
							curr_win = win_start + int(j/32)
							outfile = open('%s' %(pedfile_name),'a') 	
							data = str(dcnum)+"\t"+str(curr_win)+"\t"+str(j%32)
							for i in range(16):
								data += "\t"+str((pedarr[j][i]/(num_events)))
							data += "\n"
							outfile.write(data)
						outfile.close()
						NumEvent = 0;
						pedarr = [[0 for i in range(16)]for j in range(128)]
	infile.close()

#------------------------------------------------------------------------------------------------------------------------------------#
#------------------------------------------- plotting data --------------------------------------------------------------------------#
#------------------------------------------------------------------------------------------------------------------------------------#
if plot != 0:

	if pedsub == 0:
		fIn = open(rawfile,'r') 	
	elif pedsub == 1:
		if plot < 3: 
			fIn = open('%s' %(pedsubfile_temp),'r')
		else:
			fIn = open('%s' %(pedsubfile_name),'r')
	else:
		fIn = open(rawfile,'r') 	

	ch = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
	sample = array( 'd' )
	curr_event = event+1
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
				if int(value[2]) == 127:
					ch[15].append(ch[15][126])
				else:
					ch[15].append(float(value[18]))
			
			elif int(value[2])==128: 
				trig_ch = int(value[3])-1
				win_start = int(value[4])
#				print trig_ch
				if plot == 1:
					print "plotting data from event %d of %d in individual plots" %(curr_event,num_events) 
					for i in [15]:#range(0,16) ,trig_ch
						plt.plot(sample,ch[i],color='black', linestyle='solid', marker='o',markerfacecolor='blue', markersize=5)
						plt.title('DC#%d CH#%d win:%d-%d' %(dcnum,i+1,win_start,win_start+3))
						plt.xlabel("Sample #")
						plt.ylabel("ADC count")

						if pedsub == 1:
							plt.ylim((-1500,1500))
						else:
							plt.ylim((0,2200))

						plotname = 'outdir/plots/DC%d_ch_%d_event#%d.png' % (dcnum, i+1, curr_event)
						plt.savefig(plotname)
						plt.clf()

					curr_event += 1
					ch = [array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d'),array('d')]
					sample = array( 'd' ) 

				elif plot == 2:
					print "plotting data from event %d of %d on same plot" %(curr_event,num_events) 
					f, axarr = plt.subplots(4,4,sharex=True, sharey=True,figsize=(8,8))
					plt.suptitle("DC#%d all channels win:%d-%d\nNote: Orange plot is triggered channel" %(dcnum,win_start,win_start+3))
					f.text(0.5, 0.02, 'Sample #', ha='center')
					f.text(0.02, 0.5, 'ADC count', va='center', rotation='vertical')
					for i in range(4):
						for j in range(4):
							if 4*i+j == trig_ch:
								axarr[j,i].plot(sample,ch[4*i+j],'C1')
							else:
								axarr[j,i].plot(sample,ch[4*i+j])

							if pedsub == 1:
								axarr[j,i].axes.set_ylim([-10,200])
							else:
								axarr[j,i].axes.set_ylim([-50,2200])

							axarr[j,i].set_title('CH %d' %(4*i+j+1))

					plotname = 'outdir/plots/DC%d_all_ch_event#%d.png' % (dcnum, curr_event)	
					plt.savefig(plotname)
					plt.clf()
					curr_event += 1
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
	os.system("sudo rm %s" %(pedsubfile_temp))


