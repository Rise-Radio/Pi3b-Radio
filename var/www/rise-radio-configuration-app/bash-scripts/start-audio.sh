#!/bin/bash
export DISPLAY=":0.0"
case "$(pidof iceweasel | wc -w)" in

0)  /usr/bin/iceweasel
    ;;
1)  echo "Audio Started."
    ;;
esac
#/usr/bin/iceweasel &
#sleep 3
#/usr/local/bin/node /var/www/html/assets/nodeserver/mainAudio.js &

echo "Audio Started."

exit 0
