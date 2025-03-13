#!/bin/bash
MYTIME=$(date +%s)
MYLASTCHG=$(stat -c %Y /home/pi/didupdate.txt)
MYELAPSEDTIME=$((MYTIME-MYLASTCHG))
echo $MYELAPSEDTIME
if (( MYELAPSEDTIME > 86400)); then
  echo Time to update...
  sudo /home/pi/immediatecronjob.sh
else
  echo Not yet time to update...
fi
 
