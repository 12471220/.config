#!/usr/bin/bash
# @author nate zhou
# @since 2025

status="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"
volume="$(echo $status | sed 's/[^0-9]*//g; s/^0//' )"
muted="$(echo $status | grep 'MUTED')"

[ -z "$muted" ] && icon="󰕾" color="#ffffff"|| icon="󰸈" color="#888888"

# ` `(U+2009) is the Thin Space
echo "$icon" "$volume"%
echo
echo "$color"

case $BLOCK_BUTTON in
    3) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle && notify-send -u low -r 3301 -t 1100 "$icon $(basename $0)" "$(wpctl get-volume @DEFAULT_AUDIO_SINK@)" && pkill -SIGRTMIN+1 i3blocks &
        ;;
    5) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- && wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g; s/^0//' > pkill -SIGRTMIN+1 i3blocks &
        ;;
    4) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ && wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g; s/^0//' > pkill -SIGRTMIN+1 i3blocks &
        ;;
esac

