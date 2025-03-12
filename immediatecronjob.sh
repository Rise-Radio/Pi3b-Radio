#!/bin/bash
sudo pkill iceweasel
sudo pkill CheckNSA.sh
sudo pkill node
notify-send "Sys-Update" "Updating DIBTV codebase with FTPUpdater..."
sudo php /var/www/html/FTPCodeUpdater.php
notify-send "Sys-Update" "Updating DIBTVManifest and Video libraries-- THIS MAY TAKE A WHILE (5 to 10 mins.)..."
sleep 1
./NotifyDoingUpdate.sh &
Notify_PID=$!
sudo php /var/www/html/pullmanifest.php
kill $Notify_PID
echo Done! > /home/pi/didupdate.txt
notify-send "Sys-Update Complete"  "Updating Complete... Rebooting system..."
sleep 3
sudo /sbin/shutdown -r now




