p=`upower -i /org/freedesktop/UPower/devices/battery_BAT0|awk '/energy-rate/{print $2}'`
res=$(printf "%.2f" $p)
echo $res'W'
