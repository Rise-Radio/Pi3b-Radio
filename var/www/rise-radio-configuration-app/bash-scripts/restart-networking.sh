#!/bin/bash

/etc/init.d/networking restart &
systemctl daemon-reload
systemctl restart dhcpcd

exit 0
