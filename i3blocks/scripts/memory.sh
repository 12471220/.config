#!/usr/bin/sh
# @author nate zhou
# @since 2025


usage="$(command free | awk '/Mem:/ {printf "%.0f\n", $3/$2 * 100}')"

icon=""

# ` `(U+2009) is the Thin Space
echo "$icon" "$usage""%"

case $BLOCK_BUTTON in
    3) notify-send -u low -r 3301 -t 15000 "$icon $(basename $0)" "$(ps axch -o cmd:20,%mem --sort=-%mem | head)"
        ;;
esac
