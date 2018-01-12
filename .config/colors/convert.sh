#!/bin/bash

# usage ./convert.sh default > xdefault

while read -r line ; do
	if [ "$line" ]; then
		color_name=$( echo "$line" | cut -d= -f1)
		color=$( echo "$line" | cut -d= -f2 | tr -d \" )
		echo "#define $color_name $color"
	fi
done < "$1"
[[ -n ${DISPLAY} ]] && xrdb -merge ~/.Xresources
