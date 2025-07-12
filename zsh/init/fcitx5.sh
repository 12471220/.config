#!/bin/bash
# @author sc
# @scince 2025/7/12

# This script sets up the environment for Fcitx5
if [[ -n "$DISPLAY" ]]; then
    export XIM="fcitx"
    export XIM_PROGRAM="fcitx"
    export XMODIFIERS="@im=fcitx"
    export QT_IM_MODULE="fcitx"
    export GTK_IM_MODULE="fcitx"
fi

