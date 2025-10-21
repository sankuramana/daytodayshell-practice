#!/bin/bash
disk_space=$(df -hT | grep -v Filesystem ) #filtering disk space except filesystem line
while IFS= read -r line
do
usage=$(echo $line | awk '{print $6}' |cut -d "%" -f1)
partion=$( echo $line |awk '{ print $7}')
if [ $susage -ge $disk_space]; then 
echo "high usgae on $partion : $usage "
fi 

done <<<$disk_space
