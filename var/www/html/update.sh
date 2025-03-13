#!/bin/bash
echo "Would you like a short update, or full? (s/f)"
read answer
if [ $answer == "f" ]
then
  echo "Install PIP Req"
  sudo apt-get update
  #sudo /usr/bin/pip install mysql-python
  #sudo /usr/bin/pip install PyAudio
  #sudo /usr/bin/pip install pydub
  #sudo /usr/bin/pip install matplotlib
 # sudo apt-get -y install pavucontrol > /dev/null 2>&1
  #sudo apt-get -y install mplayer > /dev/null 2>&1
  #sudo apt-get -y install python-pyaudio > /dev/null 2>&1
  #sudo apt-get -y install libav-tools > /dev/null 2>&1
  #sudo apt-get -y install python-scipy > /dev/null 2>&1
  #sudo apt-get -y install python-matplotlib > /dev/null 2>&1
  #sudo apt-get -y install python-mysqldb > /dev/null 2>&1
  #echo "alias ffmpeg=avconv" >> ~/.bashrc
  #echo "Making DB"
  #sudo /usr/sbin/service mysql stop && sudo /usr/bin/mysqld_safe --skip-grant-tables &
  #sleep 10
  #sudo /usr/bin/mysql -uroot -e "CREATE DATABASE dejavu;"
  #sudo /usr/bin/mysql -uroot mysql -e "UPDATE user SET password=PASSWORD('riseradio') WHERE user='root';"
  #sudo /usr/bin/mysql -uroot mysql -e "FLUSH PRIVILEGES;"
  #sudo /usr/sbin/service mysql restart
  #echo "Updating VLC..."
  #sudo apt-get -y install vlc > /dev/null 2>&1
  echo "Updating OMX-Manger..."
  npm install --prefix /var/www/html/assets/nodeserver install omx-manager
  echo "Updating Express..."
  npm install --prefix /var/www/html/assets/nodeserver install express
  echo "Updating Node MPlayer..."
  npm install --prefix /var/www/html/assets/nodeserver install node-mplayer
  echo "Node Server Complete"
  sudo modprobe snd-bcm2835
fi
cd /var/www/html
#echo "Updating system and refreshing manifest..."
#sudo git fetch --all > /dev/null 2>&1
#sudo git pull > /dev/null 2>&1
sudo chown -R pi:pi /var/www/html/
php pullmanifest.php
