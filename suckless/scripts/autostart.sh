#!/bin/sh

# Set display from arandr saved script
sh ~/.screenlayout/monitor.sh &

slstatus &

# polkit
lxpolkit &

# background
feh --no-xinerama --bg-fill ~/.config/suckless/wallpaper/wide/dwm.png &

# sxhkd
# (re)load sxhkd for keybinds
if hash sxhkd >/dev/null 2>&1; then
	pkill sxhkd
	sleep 0.5
	sxhkd -c "$HOME/.config/suckless/sxhkd/sxhkdrc" &
fi

# Compose key
setxkbmap -option compose:rctrl

# Fix cursor
xsetroot -cursor_name left_ptr

# bluetooth applet
blueman-applet &

dunst -config ~/.config/suckless/dunst/dunstrc &
picom --config ~/.config/suckless/picom/picom.conf --animations -b &
