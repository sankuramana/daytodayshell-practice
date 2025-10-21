#!/bin/bash
disk_space=$(df -hT | grep -v Filesystem ) #filtering disk space except filesystem line
disk_treshold=2
ip_address=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) #-s will not print unnessasary
message=""
while IFS= read -r line
do
usage=$(echo $line | awk '{print $6}' |cut -d "%" -f1)
partion=$( echo $line |awk '{ print $7}')
if [ $usage -ge $disk_treshold ]; then 
message+="high disk usgae on $partion : $usage\n " #escapint 
fi 

done <<<$disk_space
echo -e "message body is $message "

sh mail.sh "sankuramana456@gmail.com" "high disk usage alert" "high disk usage" "$message" "$ip_address"
# sh mail.sh "info@joindevops.com" "High Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"



# TO_ADDRESS=$1
# SUBJECT=$2
# Alert_type=$3
# message_body=$4
# ip=$5