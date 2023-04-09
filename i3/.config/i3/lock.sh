#!/bin/sh
# set -e
# xset s off dpms 0 10 0
# xset s off -dpms
systemctl hibernate
i3lock --color=000000 --ignore-empty-password --show-failed-attempts --nofork
