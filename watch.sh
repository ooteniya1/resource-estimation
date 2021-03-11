#!/bin/bash
# usage: watch.sh <your_command> <sleep_duration>

while :; 
  do 
  clear
  $1
  sleep $2
done