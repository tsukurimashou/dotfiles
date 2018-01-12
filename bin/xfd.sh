#!/bin/sh

source ~/.config/colors/default

check_xfd()
{
	if [ "$(command -v xfd)" ]; then
		showfont
	else
		printf "Application 'xfd' is not installed !\n"
		exit 1
	fi
}

showfont()
{
	rows='19'
	cols='34'
	font='-benis-lemon-medium-r-normal--10-110-75-75-m-50-ISO10646-1'
  font='-unscii-unscii-medium-r-normal-full-16-160-75-75-c-80-iso10646-1'

	xfd_bg="$bg"
	xfd_fg="$fg"

	xfd_color solarized_dark

	printf "xfd*Background: $xfd_bg\n\
            xfd*Foreground: $xfd_fg\n" | xrdb -merge

	xfd -rows $rows -columns $cols -fn $font 2>&1 >/dev/null &
}

check_xfd
exit 0
