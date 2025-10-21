#!/bin/bash
disk_space=$(df -ht | grep -v Filesyatem ) #filtering disk space except filesystem line
while IFS= read -r line
do
echo " disk space $line"

done <<<$disk_space
