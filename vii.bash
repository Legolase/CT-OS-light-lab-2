#!/bin/bash
list=`sudo ./vii.res/helper.bash`
sleep 1
# sudo grep "rchar" /proc/857/io | cut -d ' ' -f 2

IFS=$'\n'

st=""

for str in $list
do
    pid=`echo $str | cut -d ' ' -f1`
    cmnd=`echo $str | cut -d ' ' -f2`
    rchar_old=`echo $str | cut -d ' ' -f3`
    rchar_new=`sudo grep -s "rchar" /proc/$pid/io | cut -d ' ' -f 2`
    if [[ $rchar_new != "" ]]
    then
        st=$st"$pid $cmnd $(($rchar_new - $rchar_old))\n"
    fi
done

echo -e $st | sort -nk3 | tr ' ' ':' | tail -n 3