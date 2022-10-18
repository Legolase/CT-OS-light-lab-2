#!/bin/bash
for ((i = 1; i <= "$#"; i++))
do
sum_exec_runtime=`sed "s/\ \{2,\}/ /g" /proc/"${!i}"/sched 2>/dev/null | grep -e "sum_exec_runtime" | cut -d ' ' -f 3`
nr_switches=`sed "s/\ \{2,\}/ /g" /proc/"${!i}"/sched 2>/dev/null | grep -e "nr_switches" | cut -d ' ' -f 3`
if [[ $sum_exec_runtime != "" && $nr_switches != "" ]]
then
result=`echo "$sum_exec_runtime / $nr_switches" | bc -l`
next=$(grep "PPid" /proc/${!i}/status | tr '\t' ' ' | cut -d ' ' -f 2)
echo -e "ProcessID=${!i} : Parent_ProcessID=$next : Average_Running_Time=$result\t$next"
fi
done