#!/bin/bash

# Show current display information
show_display_info() {
    echo "Current Display Information:"
    xrandr
    # read
    # -p 提示信息
    # -s 静默模式
    # -t 秒数，超时时间 
    # -n 数字, 只读取指定数量的字符
    read -p "Press Enter to continue..."
}

# Main menu
while true; do
    clear
    echo "===== Xrandr Display Settings Tool ====="
    echo "1. Show current display information"
    echo "2"
    echo "0. Exit"
    echo "====================================="
    read -p "Select function (0-1): " choice

    case $choice in
        1) show_display_info ;;
        0) echo "exit..."; exit 0 ;;
        *) echo "Invalid choice, please try again!"; read -t 1 ;;
    esac
done



