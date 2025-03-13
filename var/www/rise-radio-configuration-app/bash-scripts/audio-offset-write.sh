#!/bin/bash

cat <<EOF >/var/www/html/offset.cfg
$1
EOF

exit 0
