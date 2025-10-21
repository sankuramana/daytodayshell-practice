#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
echo "ERROR:: please run this script with root priviliage:
exit 1
fi

usage(){ 
echo  " USAGE:: sudo sh backup.sh <s.dir> <d.dir> <days>[optional] default 14 days"
exit 1
}

if [ $# -lt 2 ]; then
