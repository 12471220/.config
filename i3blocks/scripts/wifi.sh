#!/usr/bin/sh
# @author nate zhou
# @since 2025

device="wlp4s0"
status="$(nmcli device status|grep "^$device\s"|awk '{print $3}')"

color="#eeeeee"

level="$(awk '/^\s*w/ {print int($3 * 100 / 70)}' /proc/net/wireless)"
# connected disconnected unavailable 
#
if [ "$status" = "connected" ];then
    if [ "$level" -le 25 ]; then
        icon="󰤟"
    elif [ "$level" -le 50 ]; then
        icon="󰤢"
    elif [ "$level" -le 75 ]; then
        icon="󰤥"
    elif [ "$level" -le 100 ]; then
        icon="󰤨"
    fi
wifi_name="$(nmcli device status | awk -v dev="$device" '$1 == dev {for (i=4; i<=NF; i++) printf "%s%s", $i, (i<NF ? " " : "\n")}')"
elif [ "$status" = "disconnected" ];then
    icon="󰤯"
    wifi_name=""
    color="#888888"
else 
    icon="󰤮"
    color="#888888"
    wifi_name=""
fi
# [ "$status" = "up" ] && icon="󰖩" || icon="󰖪" color="" level=""

# ` `(U+2009) is the Thin Space
echo "<b>${icon}</b> ${wifi_name}"
echo
echo "$color"

case "$BLOCK_BUTTON" in
    3) notify-send -u low -r 3301 "󰖩 $status($(basename "$0"))" "Intensity:$level%"
        ;;
esac
