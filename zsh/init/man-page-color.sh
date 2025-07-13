#!/bin/sh
# 美化 man 页的配色方案
export LESS_TERMCAP_mb=$'\e[1;34m'    # 开始闪烁 (亮蓝色)
export LESS_TERMCAP_md=$'\e[1;33m'    # 开始加粗 (深黄色)
export LESS_TERMCAP_me=$'\e[0m'       # 结束加粗/闪烁
export LESS_TERMCAP_so=$'\e[1;47;30m' # 开始高亮 (白底黑字)
export LESS_TERMCAP_se=$'\e[0m'       # 结束高亮
export LESS_TERMCAP_us=$'\e[4;35m'    # 开始下划线 (紫色)
export LESS_TERMCAP_ue=$'\e[0m'       # 结束下划线
export GROFF_NO_SGR=1                 # 修复部分终端的颜色问题
