#!/bin/bash

if [[ "$(ping -c 1 8.8.8.8 | grep '100% packet loss' )" != "" ]]; then
    echo "Internet is Down"
    exit 1
else
    echo "Internet is Up"
fi

exit 0
