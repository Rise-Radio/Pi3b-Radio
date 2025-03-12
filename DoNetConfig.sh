#!/bin/bash
echo "Launching PHP on DoNetConfig.php\n"
sudo php "/home/pi/DoNetConfig.php"

if [ -e /home/pi/RequestReboot.txt ];
then
	echo "Reboot Request Was Found"
	sudo rm  -f "/home/pi/RequestReboot.txt"
	sudo /sbin/shutdown -r now
else
	echo "Reboot Request Not Found"
fi
	
	
