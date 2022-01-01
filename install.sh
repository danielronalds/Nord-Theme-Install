#!/bin/bash

echo "[ Setup ] This script requires a sudo password"
read -p "> " sudopassword

echo $sudopassword | sudo -S echo ""

echo "[ Setup ] Adding needed ppas"
sudo add-apt-repository -y ppa:kgilmer/speed-ricer
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update

echo "[ Setup ] Installing required packages"
sudo apt install fish i3-gaps polybar picom rofi vim python3 python3-pip git nitrogen alacritty feh
pip3 install i3ipc
pip3 install keyboard
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "[ Shell Managament ] Changing shell to fish"
echo $sudopassword | chsh -s /usr/bin/fish

echo "[ Ricing ] Installing fonts"
mkdir -p $HOME/.local/share/fonts
cp -rf ./fonts $HOME/.local/share/fonts

echo "[ Ricing ] Writing i3 python script"
echo "#!/bin/bash" > ./i3/scripts.sh
echo "SudoPassword=$sudopassword">> ./i3/scripts.sh
echo "echo \$SudoPassword | echo """ >> ./i3/scripts.sh
echo "python3 ./.config/i3/alternating_layouts.py &" >> ./i3/scripts.sh
echo "sudo python3 ~/.config/i3/floating.py &" >> ./i3/scripts.sh
echo "sudo python3 ~/.config/i3/hidebar.py &" >> ./i3/scripts.sh

chmod +x ./i3/scripts.sh

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

# alacritty
[ -d "$HOME/.alacritty.yml" ] && rm -rf $HOME/.alacritty.yml
cp -r ./.alacritty.yml $HOME/.alacritty.yml

# Vim
[ -d "$HOME/.vimr" ] && rm -rf $HOME/.vimr
cp -r ./.vimrc $HOME/.vimrc

