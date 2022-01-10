#!/usr/bin/env python3
#   ____   _____  _____  _____  _____  __     _____  _____  _____  _____  __     ____   _____ 
#  |    \ |  _  ||   | ||     ||   __||  |   | __  ||     ||   | ||  _  ||  |   |    \ |   __|
#  |  |  ||     || | | ||-   -||   __||  |__ |    -||  |  || | | ||     ||  |__ |  |  ||__   |
#  |____/ |__|__||_|___||_____||_____||_____||__|__||_____||_|___||__|__||_____||____/ |_____|
#  
#  github: https://github.com/danielronalds                                                   
#  
#  I3 toggleable autotiling script
#  

from i3ipc import Connection, Event
import keyboard
import os

def ToggleTiling():
    global tiling
    tiling = not tiling	
    if tiling:
        message = "Tiling Auto"
    else:
        message = "Tiling Manual"
    SendNotification(message)

def SetTiling(i3, e):
    win = i3.get_tree().find_focused()
    if tiling:
        if win.rect.height > win.rect.width:
            i3.command('split v')
        else:
            i3.command('split h')

def SendNotification(message):
	notification = "notify-send -t 1500 " + message
	os.system(notification)

tiling = True 

i3 = Connection()
i3.on(Event.WINDOW_FOCUS, SetTiling) 
keyboard.add_hotkey('ctrl+alt+t', lambda: ToggleTiling()) 
i3.main()
