if [ $(pamixer --get-mute) == "true" ];then
    echo 'mute'
    echo
    echo "#F54D37"
else
    echo $(pamixer --get-volume)
    echo
    echo "#FFA500"
fi