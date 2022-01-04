#!/usr/bin/env python3
#   ____   _____  _____  _____  _____  __     _____  _____  _____  _____  __     ____   _____ 
#  |    \ |  _  ||   | ||     ||   __||  |   | __  ||     ||   | ||  _  ||  |   |    \ |   __|
#  |  |  ||     || | | ||-   -||   __||  |__ |    -||  |  || | | ||     ||  |__ |  |  ||__   |
#  |____/ |__|__||_|___||_____||_____||_____||__|__||_____||_|___||__|__||_____||____/ |_____|
#  
#  github: https://github.com/danielronalds                                                   
#  
#  Toggles the bar for managing wifi connections easily
#  

from i3ipc import Connection, Event
import keyboard
import os

def ToggleBar():
    global bar
    bar = not bar	
    if bar:
        i3.command('bar mode dock')
    else:
        i3.command('bar mode invisible')
    SendNotification()

def SendNotification():
    global bar
    if bar:
        message = "Bar Shown"
    else:
        message = "Bar Hidden"
    notification = "notify-send -t 1200 " + message
    os.system(notification)

bar = False 

i3 = Connection()
keyboard.add_hotkey('ctrl+alt+b', lambda: ToggleBar())
i3.main()
