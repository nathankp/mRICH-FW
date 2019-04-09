#!/bin/bash
#  
# 
# Written by Tommy Lam, 7/24/2018
# 
# Description: Meant for setting the registers on the TX
#Sorry in advanced for the inelegant code -TL


register_num=( `cat "./registers/register_numbers.txt" `) 
register_val=( `cat "./registers/register_values.txt" `)
 
#getting the optimal voltage bias values from text files
##Note that V_optimal = V_breakdown + 3V
 
 
for ((dc = 2; dc <=2; dc+=1))
do

#setting the voltage values
for ((j = 0; j < 61; j+=1))
do
reg=${register_num[$j] }
val=${register_val[$j] }

#echo "$reg    $val"
sudo ./BMD_sendCMD_2.py "$dc" b "$reg" "$val"


done
done

echo "All done"







