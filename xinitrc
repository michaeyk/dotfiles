autocutsel -fork &
autocutsel -selection PRIMARY -fork &
xcompmgr -c &
/usr/bin/urxvtd -f -q -o 
# eval $(gpg-agent --daemon) &
setxkbmap -option caps:escape
xset -b
xrdb -merge .Xresources
wal -i "$(< "${HOME}/.cache/wal/wal")"
exec i3


