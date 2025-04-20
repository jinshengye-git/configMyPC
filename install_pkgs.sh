#!/bin/bash
# 导出已安装的软件包列表
# pacman -Qqen > pacman_packages.txt
# pacman -Qqem > aur_packages.txt

# 安装官方软件包
sudo pacman -S --needed - <pacman_packages.txt
# 如果使用AUR助手如yay
yay -S --needed - <aur_packages.txt
