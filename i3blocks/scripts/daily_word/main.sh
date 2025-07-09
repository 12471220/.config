#!/bin/bash

# 处理点击事件
if [[ "$button" ]]; then
  case $button in
    1) python scripts/daily_word/daily_word.py ;; # 左键点击
    # 2) echo "中键点击文字" ;; # 中键点击
    # 3) echo "右键点击文字" ;; # 右键点击
    # 4) echo "滚轮上滚文字" ;; # 滚轮上滚
    # 5) echo "滚轮下滚文字" ;; # 滚轮下滚
  esac
fi