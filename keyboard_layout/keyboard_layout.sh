#!/bin/bash
# set keyboard to be colemak with esc<=>caps
setxkbmap pl -variant colemak
xmodmap -e "clear Lock" -e "keycode 66 = Escape"
xmodmap -e "clear Lock" -e "keycode 9 = Caps_Lock"
