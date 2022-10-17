#!/bin/bash
./iv.bash > ./v.res/file.txt
list=`cat ./v.res/file.txt`

prev_group=0
# group=
# value=
sum=0
count=0
# echo $list

IFS=$'\n'

for str in $list
do
    group=`echo $str | cut -d ':' -f2 | cut -d '=' -f2`
    value=`echo $str | cut -d ':' -f3 | cut -d '=' -f2`
    # echo $value
    if [[ $group -ne $prev_group ]]
    then
        echo "Average_Running_Children_of_ParentID=$prev_group is $(echo "$sum / $count" | bc -l)"
        count=0
        sum=0
    fi
    count=$(($count+1))
    sum=$(echo "$sum + $value" | bc -l)
    prev_group=$group
    echo $str
done

if [[ $count -gt 0 ]]
then
    echo "Average_Running_Children_of_ParentID=$prev_group is $(echo "$sum / $count" | bc -l)"
fi