#!/bin/bash
n="0"
while [ $n -lt 50 ]
do
	notify-send "Sys-Update" "Please be patient... Downloading updates..."
	sleep 8
	notify-send "Sys-Install" "Processing and unpacking updates..."	
	sleep 7
	n=$[$n+1]
done


