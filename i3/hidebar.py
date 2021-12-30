#!/usr/bin/env python3

# Toggles the bar for managing wifi connections easily

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
