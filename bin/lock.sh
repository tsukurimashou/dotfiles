#!/usr/bin/bash

ICON="$HOME/.xlock/icon.png"
TMP="/tmp/scrot.png"

scrot $TMP
if [ -f $TMP ]; then
	# blur
	convert $TMP -blur 0x8 -define filter:sigma=2 $TMP
	# add icon
	convert $TMP $ICON -gravity center -composite -matte $TMP
	# lock
	i3lock -u -i $TMP
	# rm temp file
	rm $TMP
else
	echo "error file $TMP doesn't exist"
fi
