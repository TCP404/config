#!/bin/sh
# random a wallpaper and lockscreen image from ~/.wallpapers/.wallpaper_nsfw

WALLPAPER=$(echo ~/.wallpapers/wallpaper_nsfw/)

notify-send NSFW STARTING

feh -rz --bg-fill --no-fehbg ${WALLPAPER}

echo ${WALLPAPER} > ~/.wallpapers/wallpaper.txt

# if has betterlockscreen
if [ -f "/usr/bin/betterlockscreen" ]; then
betterlockscreen -b 2 -u ${WALLPAPER}
else
~/.lock/i3lock-gen-image.sh ${WALLPAPER}
fi

notify-send NSFW ENABLE

