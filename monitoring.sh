#!/bin/bash
disk_space=$(df -hT | grep -v Filesystem ) #filtering disk space except filesystem line
disk_treshold=2
id_address=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
message=""
while IFS= read -r line
do
usage=$(echo $line | awk '{print $6}' |cut -d "%" -f1)
partion=$( echo $line |awk '{ print $7}')
if [ $usage -ge $disk_treshold ]; then 
message="high disk usgae on $partion : $usage "
fi 

done <<<$disk_space
echo "message body is $message "
