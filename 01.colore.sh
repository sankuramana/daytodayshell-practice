#!/bin/bash 
DATE=$(date +%F) # $() is ued to run the command and rplace with out put so that we can use later 
echo "date is $DATE"
a=10 b=2
sum=$((a+b))   # $(()) is the one works for  the math expressions not doe commands
echo "sum is $sum "
#colors initilizing

R='\033[0;31m'
G='\033[0;32m'
NC='\033[0m' # No Color
Y='\033[33m'
BL='\033[0;34m'
echo -e " $R today date is $DATE $N" # -e is the one enables colore
echo -e "$R sum is $sum $N"
echo -e "$NC sum is $sum $N"
echo -e "$R sum is $sum $N" # $N is the one who stops red colore else it applayes on next cpmmand.
echo -e "$Y i am coming from madanapallli"
echo -e "$BL practicing from bangalore today date us 19-10-2025$N"








