#!/bin/bash
sleep 5
MyWait=$(sudo echo $RANDOM)
MyWait=$(($MyWait % 180))
notify-send  "sleeping for $MyWait seconds before manifest update..."
sleep $MyWait
sudo pkill iceweasel
sudo pkill CheckNSA.sh
sudo pkill node
notify-send "Sys-Update" "Updating DIBTV codebase with FTPUpdater..."
sudo php /var/www/html/FTPCodeUpdater.php
notify-send "Sys-Update" "Updating DIBTVManifest and Video libraries-- THIS MAY TAKE A WHILE (5 to 10 mins.)..."
sleep 12
./NotifyDoingUpdate.sh &
Notify_PID=$!
sudo php /var/www/html/pullmanifest.php
kill $Notify_PID
echo Done! > /home/pi/didupdate.txt
notify-send "Sys-Update Complete"  "Updating Complete... Rebooting system in 30 secs..."
sleep 30
sudo /sbin/shutdown -r now




