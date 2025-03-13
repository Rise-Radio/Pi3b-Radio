#!/bin/bash

#printf "$(iwlist wlan0 scan | grep -i quality)\n$(iwlist wlan0 scan | grep -i essid)\n$(iwconfig wlan0 | grep -i 'bit rate')" | sed -e 's/^[[:space:]]*//';
printf "$(iwconfig wlan0 | grep -i quality)\n$(iwconfig wlan0 | grep -i essid)\n$(iwconfig wlan0 | grep -i 'bit rate')";
#printf "$(iwconfig wlan4 | grep -i quality)\n$(iwconfig wlan4 | grep -i essid)\n$(iwconfig wlan4 | grep -i 'bit rate')";
exit 0
