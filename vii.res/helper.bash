#!/bin/bash
list=`ps -aux | tail -n +2 | sed "s/ \{2,\}/ /g" | cut -d ' ' -f 2,11`

IFS=$'\n'

for str in $list
do
    pid=`echo $str | cut -d ' ' -f1`
    tm=`grep -s "rchar" /proc/$pid/io | cut -d ' ' -f 2`
    if [[ $tm != "" ]]
    then
    echo "$str $tm"
    fi
done