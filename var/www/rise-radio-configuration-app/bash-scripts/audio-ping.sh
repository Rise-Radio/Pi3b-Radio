#!/bin/bash

ping -w 5 -c 4 $1
#printf "$(ping -w 5 -c 4 $1)"

exit 0
