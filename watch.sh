#!/bin/bash
# usage: watch.sh <your_command> <sleep_duration>
# 
# <your command>  oc describe vpa <name of vpa cr>
# <sleep_duration> 2 

while :; 
  do 
  clear
  $1 > log.txt
  tail -n 15 log.txt
  sleep $2
done
