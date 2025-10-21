#!/bin/bash
disk_space=$(df -hT | grep -v Filesystem ) #filtering disk space except filesystem line
while IFS= read -r line
do
echo " line: $line | cut -d "%" -f1 "

done <<<$disk_space
