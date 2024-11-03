#!/bin/bash
WIFI_INTERFACE="wlp4s0"

check_wifi() {
    WIFI_STATUS=$(ip link show $WIFI_INTERFACE | grep "state UP")
    # -n参数检查字符串是否非空，-z参数检查是否为空
    if [ -n "$WIFI_STATUS" ]; then
        # echo `iw dev | awk '$1=="ssid"{print $2}'`
        nmcli -t -f active,ssid dev wifi | awk -F: '$1=="yes"{print $2; exit}'
    else
        echo "dis"
    fi
}

res=$(check_wifi)
echo $res
echo
if [ $res == "dis" ];then
    echo "#F54D37";
else
    echo "#00FF00"
fi
