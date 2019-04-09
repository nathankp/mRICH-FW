#!/bin/bash
#  
# 
# Written by Tommy Lam, 6/29/2018
# 
# Description: Meant for setting the bias voltages for the MPPC
#Sorry in advanced for the inelegant code -TL
 
 
#getting the optimal voltage bias values from text files
##Note that V_optimal = V_breakdown + 3V
 
Vtop=56.0 #units are volts, top voltage
#python BMD_sendCMD.py f C HV $Vtop
 
#experimentally determined on 7/2/2018
Vtop1=58.3
Vtop2=57.8
Vtop3=58.1
Vtop4=58.6

sudo ./BMD_sendCMD.py 1 c HV $Vtop1
sudo ./BMD_sendCMD.py 2 c HV $Vtop2
sudo ./BMD_sendCMD.py 3 c HV $Vtop3
sudo ./BMD_sendCMD.py 4 c HV $Vtop4

filecontent1=( `cat "./bias_voltages/DC_1.txt" `)
filecontent2=( `cat "./bias_voltages/DC_2.txt" `)
filecontent3=( `cat "./bias_voltages/DC_3.txt" `)
filecontent4=( `cat "./bias_voltages/DC_4.txt" `)
#echo ${filecontent1[1]}
 
#setting the voltage values
for ((j = 1; j <= 15; j+=1))
do
    V_op1=${filecontent1[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS1_times2=`echo "$Vtop1 - $V_op1" | bc` #DC bias value
    DAC_BIAS1=`echo "$DAC_BIAS1_times2 * 0.5" | bc`
    sudo ./BMD_sendCMD.py 1 c $j $DAC_BIAS1
    #python BMD_sendCMD.py 1 c $j $DAC_BIAS1

    V_op2=${filecontent2[$j-1] } #dummy variable to temporarily store optimal HV
    #echo $V_op2
    DAC_BIAS2_times2=`echo "$Vtop2 - $V_op2" | bc` #2 * DC bias value
    DAC_BIAS2=`echo "$DAC_BIAS2_times2 * 0.5" | bc` #DC bias value
    echo "$DAC_BIAS2_times2 * 0.5" | bc
    sudo ./BMD_sendCMD.py 2 c $j $DAC_BIAS2
    #echo "sudo ./BMD_sendCMD.py 2 c $j $DAC_BIAS2"

    V_op3=${filecontent3[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS3_times2=`echo "$Vtop3 - $V_op3" | bc` #DC bias value
    DAC_BIAS3=`echo "$DAC_BIAS3_times2 * 0.5" | bc`
    sudo ./BMD_sendCMD.py 3 c $j $DAC_BIAS3
    #python BMD_sendCMD.py 3 c $j $DAC_BIAS3

    V_op4=${filecontent4[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS4_times2=`echo "$Vtop4 - $V_op4" | bc` #DC bias value
    DAC_BIAS4=`echo "$DAC_BIAS4_times2 * 0.5" | bc`
    sudo ./BMD_sendCMD.py 4 c $j $DAC_BIAS4

    #python BMD_sendCMD.py 4 c $j $DAC_BIAS4

done
