autocutsel -fork &
autocutsel -selection PRIMARY -fork &
/usr/bin/urxvtd -f -q -o 
setxkbmap -option caps:escape
xset -b
xset m 30/10 0
xrandr --output DP-3 --scale 1.25x1.25
xrdb -merge .Xresources
xbindkeys
wal -R
exec i3


