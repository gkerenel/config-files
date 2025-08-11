#!/bin/bash

# INSTALL THMES AND ICONS

tar xJf Sweet-Ambar-Blue-Dark.tar.xz
mv Sweet-Ambar-Blue-Dark .themes/

tar xJf papirus-icon-theme-darkcyan-folders.tar.xz
mv Papirus Paparus-Light Paparus-Dark .icons/

tar xJf Bibata-Modern-Ice.tar.xz
mv Bibata-Modern-Ice .icons/


# INSTALL PACKAGES

sudo apt install bspwm xorg \
    polybar rofi picom feh lxappearance \
    xclip  dunst upower \
    dunst libnotify-bin \
    pulseaudio pulseaudio-utils \
    pavucontrol brightnessctl

