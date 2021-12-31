#!/bin/bash

echo "This script requires a sudo password"
read -p "> " sudopassword

echo $sudopassowrd | sudo -S echo ""

echo "[ Setup ] Adding speed-ricer ppa"
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
sudo apt update

echo "[ Setup ] Installing required packages"
sudo apt install fish i3-gaps polybar picom rofi vim python3 python3-pip git nitrogen 
pip3 install i3ipc
pip3 install keyboard
