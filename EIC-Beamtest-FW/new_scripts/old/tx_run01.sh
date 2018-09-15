#!/bin/bash
for i in {1..10}
do 
	sudo ./tst_sendcmd.py "AF00FFFAF00FFFFFAF370001AE000001AF370000AE000001AF320001AE000001AF320000"
	#sleep .3
	#sudo ./tst_rcvUDP.py
	echo $i
	#sleep .1

done


