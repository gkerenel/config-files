#!/bin/bash

USER_RESOURCES="$HOME/.Xresources"

USER_MODMAP="$HOME/.Xmodmap"

SYS_RESOURCES="/etc/X11/xinit/.Xresources"

SYS_MODMAP="/etc/X11/xinit/.Xmodmap"

export XDG_SESSION_TYPE="x11"


if [ -f $SYS_RESOURCES ]; then
    xrdb -merge $SYS_RESOURCES
fi

if [ -f $SYS_RESOURCES ]; then
    xmodmap $SYS_RESOURCES
fi

if [ -f "$USER_RESOURCES" ]; then
    xrdb -merge "$USER_RESOURCES"
fi

if [ -f "$USER_MODMAP" ]; then
    xmodmap "$USER_MODMAP"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for program in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$program" ] && . "$program"
    done
    unset f
fi

sxhkd -c $HOME/.config/bspwm/sxhkdrc & 

exec bspwm