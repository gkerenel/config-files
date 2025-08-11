#!/bin/bash


session_type=$XDG_SESSION_TYPE

if [ "$session_type" == "wayland" ]; then
    cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy

elif [ "$session_type" == "x11" ]; then
    cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | xclip -selection clipboard
else
    echo "Тип сеанса не определен или не является Wayland/X11."
fi