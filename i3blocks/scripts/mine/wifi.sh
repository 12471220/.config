#!/bin/bash
WIFI_INTERFACE="wlp4s0"

check_wifi() {
    WIFI_STATUS=$(ip link show $WIFI_INTERFACE | grep "state UP")
    # -n参数检查字符串是否非空，-z参数检查是否为空
    if [ -n "$WIFI_STATUS" ]; then
        echo `iw dev | awk '$1=="ssid"{print $2}'`
    else
        echo "dis"
    fi
}

echo `check_wifi`
