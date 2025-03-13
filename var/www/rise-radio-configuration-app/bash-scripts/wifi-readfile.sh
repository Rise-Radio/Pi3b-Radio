#!/bin/bash

filename="/etc/wpa_supplicant/wpa_supplicant.conf"
while read -r line; do
    name="$line" #substring it for just the value needed
    echo "$name"
done < "$filename"

exit 0
