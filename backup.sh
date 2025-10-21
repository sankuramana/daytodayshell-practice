#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
days=${3:-14} #if not provided considered as 14 days else it takes thatyou given
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FOLDER"
echo "Script started execution at: $(date)" | tee -a "$LOG_FILE"

usage() { 
  echo -e "${R}USAGE:: sudo bash backup.sh <source_dir> <destination_dir> [days - optional, default 14 days]${N}"
  exit 1
}

if [ $USERID -ne 0 ]; then 
  echo -e "${R}ERROR:: Please run this script with root privilege.${N}"
  exit 1
fi

if [ $# -lt 2 ]; then
  usage
fi

source_dir=$1
dest_dir=$2

if [ ! -d "$source_dir" ]; then
  echo -e "${R}ERROR:: Source directory '$source_dir' does not exist.${N}"
  exit 1
fi

if [ ! -d "$dest_dir" ]; then
  echo -e "${R}ERROR:: Destination directory '$dest_dir' does not exist.${N}"
  exit 1
fi
files=$(find "$source_dir" -name "*.log" -type f -mtime +$days)

if [ ! -z "$files" ]; then 
  echo "Files found:"
  echo "$files" #if files fins we ahve to zip the file 
      TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$dest_dir/app-logs-$TIMESTAMP.zip" #/app-logs is justaname use anything u want
    echo " zip file name is :$ZIP_FILE_NAME"
    echo find "$source_dir" -name "*.log" -type f -mtime +$days | zip -@ -j "$ZIP_FILE_NAME" 

else 
  echo -e "${Y}No files to archive, skipping.${N}"
fi
