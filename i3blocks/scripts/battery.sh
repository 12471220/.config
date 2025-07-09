#!/usr/bin/bash
# @author nate zhou
# @since 2025

BAT="BAT0"
POWER="/sys/class/power_supply"

status="$(cat $POWER/$BAT/status)"
level="$(cat $POWER/$BAT/capacity)"

if [ "$level" -le 5 ];then
    icon=""
elif [ "$level" -le 25 ];then
    icon=""
elif [ "$level" -le 50 ];then
    icon=""
elif [ "$level" -le 90 ];then
    icon=""
elif [ "$level" -le 100 ];then
    icon=""
fi

case "$status" in
    # "Discharging")
        # case "$level" in
        #     [0-5]) icon="󰂃" ;;
        #     [6-9]) icon="󰁺" ;;
        #     1[0-9]) icon="󰁻" ;;
        #     2[0-9]) icon="󰁼" ;;
        #     3[0-9]) icon="󰁽" ;;
        #     4[0-9]) icon="󰁽" ;;
        #     5[0-9]) icon="󰁾" ;;
        #     6[0-9]) icon="󰁿" ;;
        #     7[0-9]) icon="󰂀" ;;
        #     8[0-9]) icon="󰂁" ;;
        #     9[0-9]) icon="󰂂" ;;
        #     100)    icon="󰁹" ;;
        # esac
        # ;;
    "Not charging")
        icon=""
        ;;
    "Charging")
        icon="$icon ⚡️"
        ;;
    "Full")
        icon="$icon "
        ;;
esac


# ` `(U+2009) is the Thin Space
echo "$icon $level"%
echo
# echo "$color"

case $BLOCK_BUTTON in
    3) notify-send -u low -r 3301 "$icon $status($(basename "$0"))" "Rate: $level"
        ;;
    1) pkill +SIGRTMIN+12 i3blocks &
        ;;
esac
