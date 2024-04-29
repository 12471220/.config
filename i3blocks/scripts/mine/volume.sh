if [ $(pamixer --get-mute) == "true" ];then
    echo 'mute'
else
    echo $(pamixer --get-volume)
fi