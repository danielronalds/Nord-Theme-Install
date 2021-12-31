#!/bin/bash

echo "This script requires a sudo password"
read -p "> " sudopassword

echo $sudopassword | sudo -S echo ""

echo "[ Setup ] Adding needed ppas"
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update

echo "[ Setup ] Installing required packages"
sudo apt install fish i3-gaps polybar picom rofi vim python3 python3-pip git nitrogen alacritty
pip3 install i3ipc
pip3 install keyboard

echo "[ Ricing ] Installing fonts"
mkdir -p "$FontsDir"
cp -rf ./fonts $HOME/.local/share/fonts

echo "[ Ricing ] Writing i3 python script"
echo "#!/bin/bash" > ./i3/scripts.sh
echo "SudoPassword = '$sudopassword'">> ./i3/scripts.sh
echo "python3 ./.config/i3/alternating_layouts.py" >> ./i3/scripts.sh
echo "echo \$SudoPassword | sudo -S python3 ~/.config/i3/floating.py" >> ./i3/scripts.sh
echo "echo \$SudoPassword | sudo -S python3 ~/.config/i3/hidebar.py" >> ./i3/scripts.sh

echo "[ Ricing ] Moving config files"

# Fish
rm -rf $HOME/.config/fish
cp ./fish $HOME/.config/fish

# i3
rm -rf $HOME/.config/i3
cp ./i3 $HOME/.config/i3

# rofi
rm -rf $HOME/.config/rofi
cp ./rofi $HOME/.config/rofi

# Polybar
rm -rf $HOME/.config/polybar
cp ./polybar $HOME/.config/polybar

# alacritty
rm -rf $HOME/.alacritty.yml
cp ./.alacritty.yml $HOME/.alacritty.yml

# Vim
rm -rf $HOME/.vimr
cp ./.vimrc $HOME/.vimrc
