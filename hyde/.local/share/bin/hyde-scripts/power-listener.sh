#!/bin/bash

# This script listens for AC power plug/unplug events
# and sends a refresh signal to Waybar.

# Customize this if your AC adapter name differs
# Run: upower -e  or  ls /sys/class/power_supply/
AC_NAME="AC"

udevadm monitor --udev --subsystem-match=power_supply | \
while read -r line; do
  if echo "$line" | grep -q "$AC_NAME"; then
    # Read current status (Online=1 means plugged in)
    if [ -f "/sys/class/power_supply/$AC_NAME/online" ]; then
      STATUS=$(cat /sys/class/power_supply/$AC_NAME/online)
      if [ "$STATUS" = "1" ]; then
        notify-send "Power plugged in ⚡"
      else
        notify-send "Power unplugged 🔋"
      fi

      sleep 5
      # Refresh Waybar
      pkill -RTMIN+8 waybar
    fi
  fi
done
