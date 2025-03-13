#!/bin/bash
if [ -f "/var/www/html/onlyaudio.cfg" ] ; then exit; fi;
while [ true ]
do
	OUTPUT=$(pgrep node)
	if [ ! "${#OUTPUT}" -gt 0 ] ;
	then node /var/www/html/assets/nodeserver/mainAudio.js > /dev/null 2>/dev/null &
	fi
	sleep 60

done

