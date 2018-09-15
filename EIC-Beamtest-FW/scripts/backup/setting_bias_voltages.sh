#!/bin/bash
#  
# 
# Written by Tommy Lam, 6/29/2018
# 
# Description: Meant for setting the bias voltages for the MPPC
#Sorry in advanced for the inelegant code -TL
#not the final script (there are some biases that haven't been accounted for)
 
 
#getting the optimal voltage bias values from text files
##Note that V_optimal = V_breakdown + 3V
 
Vtop=56.0 #units are volts, top voltage
python BMD_sendCMD.py f C HV $Vtop
 
filecontent1=( `cat "./bias_voltages/DC_1.txt" `)
filecontent2=( `cat "./bias_voltages/DC_2.txt" `)
filecontent3=( `cat "./bias_voltages/DC_3.txt" `)
filecontent4=( `cat "./bias_voltages/DC_4.txt" `)
#echo ${filecontent1[1]}
 
#setting the voltage values
for ((j = 1; j <= 1; j+=1))
do
    V_op1=${filecontent1[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS1=`echo "$Vtop - $V_op1" | bc` #DC bias value
    python BMD_sendCMD.py 1 c $j $DAC_BIAS1

    V_op2=${filecontent2[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS2=`echo "$Vtop - $V_op2" | bc` #DC bias value
    python BMD_sendCMD.py 2 c $j $DAC_BIAS2

    V_op3=${filecontent3[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS3=`echo "$Vtop - $V_op3" | bc` #DC bias value
    python BMD_sendCMD.py 3 c $j $DAC_BIAS3

    V_op4=${filecontent4[$j-1] } #dummy variable to temporarily store optimal HV
    DAC_BIAS4=`echo "$Vtop - $V_op4" | bc` #DC bias value
    python BMD_sendCMD.py 4 c $j $DAC_BIAS4

done