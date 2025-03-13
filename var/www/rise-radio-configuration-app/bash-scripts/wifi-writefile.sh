#!/bin/bash


cat <<EOF >/etc/wpa_supplicant/wpa_supplicant.conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US

network={
  ssid="$1"
  psk="$2"
  key_mgmt=$3
}
EOF

exit 0
