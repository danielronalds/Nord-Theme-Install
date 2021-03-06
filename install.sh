#!/bin/bash
#   ____   _____  _____  _____  _____  __     _____  _____  _____  _____  __     ____   _____ 
#  |    \ |  _  ||   | ||     ||   __||  |   | __  ||     ||   | ||  _  ||  |   |    \ |   __|
#  |  |  ||     || | | ||-   -||   __||  |__ |    -||  |  || | | ||     ||  |__ |  |  ||__   |
#  |____/ |__|__||_|___||_____||_____||_____||__|__||_____||_|___||__|__||_____||____/ |_____|
#  
#  github: https://github.com/danielronalds                                                   
#  
#  Install script for Nord i3 rice 
#  


echo "[ Setup ] This script requires a sudo password"
read -p "> " sudopassword

echo $sudopassword | sudo -S echo ""

echo "[ Setup ] Adding needed ppas"
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
sudo add-apt-repository ppa:papirus/papirus
sudo apt update

echo "[ Setup ] Installing required packages"
sudo apt install fish i3-gaps polybar picom rofi vim python3 python3-pip kitty feh lxappearance git papirus-icon-theme suckless-tools neofetch htop fonts-jetbrain-mono
pip3 install i3ipc
pip3 install keyboard
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[ Shell Managament ] Changing shell to fish"
echo $sudopassword | chsh -s /usr/bin/fish

echo "[ Ricing ] Installing fonts"
mkdir -p $HOME/.local/share/fonts
cp -rf ./fonts $HOME/.local/share/fonts

chmod +x ./i3/scripts.sh

echo "[ Ricing ] Installing GTK theme"
mkdir $HOME/.themes
cp -r ./Nordic-darker-v40 $HOME/.themes/Nordic-darker-v40

echo "[ Ricing ] Installing i3_python_extensions"
sudo pip install i3ipc keyboard
git clone https://github.com/danielronalds/i3_python_extensions.git
mv ./i3_python_extensions/i3_python_extensions.py ./i3/i3_python_extensions.py
echo "" >> ./i3/config
echo "# Python Scripts" >> ./i3/config
echo "exec_always echo $sudopassword | sudo -S python3 ~/.config/i3/i3_python_extensions.py" >> ./i3/config

echo "[ Ricing ] Moving config files"

[ -d "$HOME/.config" ] && mkdir $HOME/.config

# Fish
[ -d "$HOME/.config/fish" ] && rm -rf $HOME/.config/fish
cp -r ./fish $HOME/.config/fish

# i3
[ -d "$HOME/.config/i3" ] && rm -rf $HOME/.config/i3
cp -r ./i3 $HOME/.config/i3

# rofi
[ -d "$HOME/.config/rofi" ] && rm -rf $HOME/.config/rofi
cp -r ./rofi $HOME/.config/rofi

# Polybar
[ -d "$HOME/.config/polybar" ] && rm -rf $HOME/.config/polybar
cp -r ./polybar $HOME/.config/polybar

# Kitty
[ -d "$HOME/.config/kitty" ] && rm -rf $HOME/.config/kitty
cp -r ./kitty $HOME/.config/kitty

# Vim
[ -d "$HOME/.vimr" ] && rm -rf $HOME/.vimr
cp -r ./.vimrc $HOME/.vimrc

vim -c PlugUpdate 

echo "Script Completed"
