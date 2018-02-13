xset +fp $HOME/.fonts
xset fp rehash
xrdb -merge $HOME/.Xresources
# for volume / mute buttons & lock (see ~/.xbindkeysrc.scm)
xbindkeys &
# autolock after 5min of idle
xautolock -time 5 -locker "$HOME/bin/lock.sh" &
# keyboard mapping azerty
# setxkbmap fr &
# set Standby & Suspend to 30min - Off to 1h
xset dpms 1800 1800 3600 &
# window composer
compton --config $HOME/.config/compton/compton &
# audio
/usr/bin/pulseaudio --daemonize=no
# startpage
cd $HOME/startpage && python -m http.server 8080 &
cd $HOME/.config/colors && ./convert.sh default > xdefault
cd $HOME
# notifications
dunst &
# background (wallpaper) color
hsetroot -solid "#262a3b" &
# default cursor
xsetroot -cursor_name left_ptr &
# allows to notify automatically when wifi drops / reconnects
WIFI_INTERFACE=$(cat /proc/net/wireless | perl -ne '/(\w+):/ && print $1')
export WIFI_INTERFACE
wpa_cli -i $WIFI_INTERFACE -a $HOME/bin/wifi_notify.sh &
# wm
exec bspwm
