#!/bin/bash

printf "$(iwlist wlan0 scan | grep ESSID)";

exit 0
