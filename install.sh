#!/bin/bash

set -e  # Exit immediately if a command fails

# --- VARIABLES ---
THEMES_DIR="$HOME/.themes"
ICONS_DIR="$HOME/.icons"
CONFIG_DIR="$HOME/.config"

# --- CREATE DIRECTORIES ---
mkdir -p "$THEMES_DIR" "$ICONS_DIR" "$CONFIG_DIR"

# --- INSTALL THEMES & ICONS ---
echo "[*] Installing themes and icons..."

if [ -f Sweet-Ambar-Blue-Dark.tar.xz ]; then
    tar -xJf Sweet-Ambar-Blue-Dark.tar.xz
    mv -f Sweet-Ambar-Blue-Dark "$THEMES_DIR/"
fi

if [ -f papirus-icon-theme-darkcyan-folders.tar.xz ]; then
    tar -xJf papirus-icon-theme-darkcyan-folders.tar.xz
    mv -f Papirus* "$ICONS_DIR/" 2>/dev/null || true
fi

if [ -f Bibata-Modern-Ice.tar.xz ]; then
    tar -xJf Bibata-Modern-Ice.tar.xz
    mv -f Bibata-Modern-Ice "$ICONS_DIR/"
fi

# --- INSTALL SYSTEM PACKAGES ---
echo "[*] Installing required system packages..."
sudo apt update
sudo apt install -y \
    bspwm xorg \
    polybar rofi picom feh lxappearance \
    xclip dunst upower libnotify-bin \
    pulseaudio pulseaudio-utils \
    pavucontrol brightnessctl \
    python3 python3-pip

# --- INSTALL PYTHON PACKAGES ---
echo "[*] Installing required Python packages..."
declare -a packages=(
    "inquirer"
    "loguru"
    "psutil"
    "gputil"
    "pyamdgpuinfo"
    "pyyaml"
    "pillow"
    "colorama"
)

for package in "${packages[@]}"; do
    if ! pip show "$package" &> /dev/null; then
        pip install "$package" --break-system-packages
    else
        echo "    - $package already installed"
    fi
done

# --- COPY CONFIGURATION FILES ---
echo "[*] Copying configuration files..."
cp -r .config/* "$CONFIG_DIR/"

# --- FINISHED ---
echo "[✓] Installation complete!"
echo "Restart your session or run 'bspwm' to start."
