#!/bin/bash
# Simple SHELL script for Linux and UNIX system monitoring with 
# ping command
# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# Setup email ID below
# -------------------------------------------------------------------------
 
# add ip / hostname separated by white space 
HOSTS="cyberciti.biz theos.in router"
 
# no ping request
COUNT=1
 
# email report when 
SUBJECT="Ping failed"
EMAILID="me@mydomain.com"
for myHost in $HOSTS
do
  count=$(ping -c $COUNT $myHost | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
  if [ $count -eq 0 ]; then
    # 100% failed 
    echo "Host : $myHost is down (ping failed) at $(date)" | mail -s "$SUBJECT" $EMAILID
  fi
done
