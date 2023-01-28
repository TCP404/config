#!/bin/sh
WALLPAPER=$(echo ~/.wallpapers/wallpaper)

feh -rz --no-fehbg --bg-fill ${WALLPAPER}

echo ${WALLPAPER} > ~/.wallpapers/wallpaper.txt

~/.wallpapers/start_conky.sh

if [ -f "/usr/bin/betterlockscreen" ]; then
betterlockscreen -u ${WALLPAPER}
exit 0
fi

~/.lock/i3lock-gen-image.sh ${WALLPAPER}
exit 0
