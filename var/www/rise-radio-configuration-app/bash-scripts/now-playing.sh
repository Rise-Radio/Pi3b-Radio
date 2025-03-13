#!/bin/bash
# get the process that contains omxplayer - but exclude the grep result by using the []
fileplaying="$(ps aux | grep '/bin/bash /usr/bin/[o]mxplayer')"

#echo "$fileplaying"

# subsring everything after the last /
echo ${fileplaying//*\/}

exit 0
