#!/usr/bin/bash

ICON="$HOME/.xlock/icon.png"
TMP="/tmp/scrot.png"

scrot $TMP
if [ -f $TMP ]; then
	# grab screenshot, blur and add icon in the middle
  RES=$(xrandr | grep 'current' | sed -E 's/.*current\s([0-9]+)\sx\s([0-9]+).*/\1x\2/')
  ffmpeg -f x11grab -video_size $RES -y -i $DISPLAY -i $ICON -filter_complex "boxblur=10:2,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $TMP -loglevel quiet
	# lock
	i3lock -u -i $TMP
	# rm temp file
	rm $TMP
else
	echo "error file $TMP doesn't exist"
fi
