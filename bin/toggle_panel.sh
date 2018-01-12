#!/usr/bin/bash
if [ ! -f /tmp/panel-pid ]; then
	echo "no PID found - starting panel"
	cd $HOME/.config/bspwm && ./bspwmrc &
else
	echo "PID found - killing panel"
	kill -s TERM $(cat /tmp/panel-pid)
	rm /tmp/panel-pid
fi
