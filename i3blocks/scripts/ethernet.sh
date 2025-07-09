#!/usr/bin/sh
# @author nate zhou
# @since 2025

device="eno1"
status="$(nmcli device status|grep "^$device\s"|awk '{print $3}')"
# status="$(cat /sys/class/net/e*/operstate 2>/dev/null)"
# 󰈂
icon="󰈁"
color="#ffffff"

# status type: unavaliable, connected
[ "$status" != "connected" ] && color="#888888" && icon="󰈂"

echo "$icon"
echo
echo "$color"

case $BLOCK_BUTTON in
    3) notify-send -u low -r 3301 "$icon $status ($(basename $0))" "$(nmcli connection show --active | awk 'NR >1 {print $3,$4}')"
        ;;
    1) pkill -SIGRTMIN+11 i3blocks &
        ;;
esac
