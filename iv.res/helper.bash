#!/bin/bash
for ((i = 1; i < "$#"; i+=2))
do
sum_exec_runtime=`sed "s/\ \{2,\}/ /g" /proc/"${!i}"/sched 2>null | grep -e "sum_exec_runtime" | cut -d ' ' -f 3`
nr_switches=`sed "s/\ \{2,\}/ /g" /proc/"${!i}"/sched 2>null | grep -e "nr_switches" | cut -d ' ' -f 3`
if [[ $sum_exec_runtime != "" && $nr_switches != "" ]]
then
result=`echo "$sum_exec_runtime / $nr_switches" | bc -l`
next=$(($i+1))
echo "ProcessID=${!i} : Parent_ProcessID=${!next} : Average_Running_Time=$result" # ps -aux -f | sed "s/ \{2,\}/ /g" | cut -d ' ' -f
fi
done