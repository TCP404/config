#!/bin/sh
# random a wallpaper and lockscreen image from ~/.wallpapers/wallpaper/

WALLPAPER=$(echo ~/.wallpapers/wallpaper/)

notify-send SFW STARTING

feh -rz --bg-fill --no-fehbg ${WALLPAPER}

echo ${WALLPAPER} > ~/.wallpapers/wallpaper.txt

# if has betterlockscreen
if [ -f "/usr/bin/betterlockscreen" ]; then
betterlockscreen -u ${WALLPAPER}
else
~/.lock/i3lock-gen-image.sh ${WALLPAPER}
fi

notify-send SFW ENABLE

