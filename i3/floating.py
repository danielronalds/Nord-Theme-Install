#!/usr/bin/env python3
#   ____   _____  _____  _____  _____  __     _____  _____  _____  _____  __     ____   _____ 
#  |    \ |  _  ||   | ||     ||   __||  |   | __  ||     ||   | ||  _  ||  |   |    \ |   __|
#  |  |  ||     || | | ||-   -||   __||  |__ |    -||  |  || | | ||     ||  |__ |  |  ||__   |
#  |____/ |__|__||_|___||_____||_____||_____||__|__||_____||_|___||__|__||_____||____/ |_____|
#  
#  github: https://github.com/danielronalds                                                   
#  
#  Toggles floating mode for all new windows
#

from i3ipc import Connection, Event
import keyboard
import os

def SetFloating(i3, e):
    if floating:
        i3.command('floating enable')
        if resize:
	        i3.command('resize set 960 720')
    else:
        i3.command('floating disable')

def ToggleFloating():
    global floating
    floating = not floating	
    if floating:
        message = "Floating enabled"
    else:
        message = "Floating disabled"
    SendNotification(message)

def ToggleResize():
    global resize
    resize = not resize	
    if resize:
        message = "Resize enabled"
    else:
        message = "Resize disabled"
    SendNotification(message)

def SendNotification(message):
	notification = "notify-send -t 1500 " + message
	os.system(notification)

floating = False 
resize = False 

i3 = Connection()
i3.on(Event.WINDOW_NEW, SetFloating)
keyboard.add_hotkey('ctrl+alt+f', lambda: ToggleFloating()) 
keyboard.add_hotkey('ctrl+alt+r', lambda: ToggleResize()) 
i3.main()
