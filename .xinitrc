if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xrandr --output eDP1 --preferred --output DP2 --left-of eDP1
feh --bg-fill /home/remeeh/Pictures/wallpapers/lowpoly.jpg
setxkbmap -layout dk
exec i3
