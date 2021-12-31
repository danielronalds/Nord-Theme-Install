#!/bin/bash

SudoPassword = 

python3 ./.config/i3/alternating_layouts.py

echo $SudoPassword | sudo -S python3 ~/.config/i3/floating.py

echo $SudoPassword | sudo -S python3 ~/.config/i3/hidebar.py
