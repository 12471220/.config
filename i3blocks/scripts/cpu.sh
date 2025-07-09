#!/usr/bin/sh
# @author nate zhou
# @since 2025

usage="$(mpstat --dec=0 1 1| awk 'NR==4 {print 100 - $NF}')"

icon=""

echo "<b>${icon}</b> ${usage}"%

case $BLOCK_BUTTON in
    3) notify-send -u low -r 3301 -t 15000 "$icon $(basename $0)" "$(ps axch -o cmd:20,%cpu --sort=-%cpu | head)"
        ;;
esac
