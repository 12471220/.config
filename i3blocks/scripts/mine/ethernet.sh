#!/bin/bash
ETHERNET_INTERFACE="eno1"

check_ethernet() {
    ETHERNET_STATUS=$(ip link show $ETHERNET_INTERFACE | grep "state UP")
    if [ -n "$ETHERNET_STATUS" ]; then
        echo "conn"
    else
        echo "dis"
    fi
}
echo `check_ethernet`
