#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
Alert_type=$3
message_body=$4
ip=$5





{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"