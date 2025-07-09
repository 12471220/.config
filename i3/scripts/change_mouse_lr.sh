#!/bin/bash

id=$(xinput|grep "Logitech USB Receiver Mouse"|awk '{print $7}'|cut -d '=' -f 2)

xinput set-prop $id "libinput Left Handed Enabled" 1


