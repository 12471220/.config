#!/usr/bin/bash

level="$(brightnessctl | awk '/%/{gsub("[()]", "", $4); print $3}')"

case $level in
    [0-9]) icon="󱩎" ;;
    1[0-9]) icon="󱩏" ;;
    2[0-9]) icon="󱩐" ;;
    3[0-9]) icon="󱩐" ;;
    4[0-9]) icon="󱩑" ;;
    5[0-9]) icon="󱩒" ;;
    6[0-9]) icon="󱩓" ;;
    7[0-9]) icon="󱩔" ;;
    8[0-9]) icon="󱩕" ;;
    9[0-9]) icon="󱩖" ;;
    100)     icon="󰛨"  ;;
esac

echo "$icon" "$level"%

case $BLOCK_BUTTON in
    1) pkill -SIGRTMIN+3 i3blocks &
        ;;
    4) brightnessctl set 1%+ | awk -F'[()]' 'NR==3 {print $2}'| sed 's/%//' > pkill -SIGTMIN+3 i3blocks &
        ;;

    5) brightnessctl set 1%- | awk -F'[()]' 'NR==3 {print $2}'| sed 's/%//' > pkill -SIGTMIN+3 i3blocks &
        ;;
esac

case $BLOCK_BUTTON in
    3) notify-send -u low -r 3301 "$icon $(basename "$0")" "$status $level"
        ;;
    1) pkill +SIGRTMIN+12 i3blocks &
        ;;
esac

