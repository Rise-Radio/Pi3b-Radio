#!/bin/bash

sudo chmod 777 /home/pi/*.*
myDIRECTORY="/home/pi/.config/openbox/"
if [ ! -d "$myDIRECTORY" ]; then
  echo "$myDIRECTORY doesn't exist."
  sudo mkdir "$myDIRECTORY"
fi
sudo chmod 777 "$myDIRECTORY"
myDIRECTORY="/home/pi/.config/gpicview/"
if [ ! -d "$myDIRECTORY" ]; then
  echo "$myDIRECTORY doesn't exist."
  sudo mkdir "$myDIRECTORY"
fi
sudo chmod 777 "$myDIRECTORY"
sudo chmod 777 /home/pi/.config/gpicview/*.*
sudo chmod 777 /home/pi/.config/openbox/*.*
sudo chmod 777 /var/www/html/*.*
sudo sntp -s time.google.com
sleep 5
sudo find /var/www/html/assets/videos -depth -iname "*.mp4" -type f -atime +7 -delete
sudo find /var/www/html/assets/videos -depth -iname "*.jpg" -type f -atime +7 -delete
sudo find /var/www/html/assets/videos -depth -iname "*.png" -type f -atime +7 -delete
sleep 5
openbox --reconfigure
sleep 5
sudo ./DoNetConfig.sh > /home/pi/netreport.txt
sleep 5
sudo ./CheckLastUpdate.sh
sleep 1
sudo /var/www/html/CheckNSA.sh &
#this script for audio only
iceweasel
