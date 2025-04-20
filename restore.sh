#!/bin/bash
#
## 导出已安装的软件包列表
# dpkg --get-selections > ubuntu_packages.txt
# 或者使用apt命令
# apt-mark showmanual > manual_packages.txt
#
#
sudo apt-get update
# 使用dselect恢复包
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < ubuntu_packages.txt
sudo apt-get dselect-upgrade
