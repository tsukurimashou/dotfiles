#!/usr/bin/bash

Clock() {
	DATETIME=$(date "+%a %d-%m %H:%M")
	ICON=""
  echo -n "$DATETIME"
}

while true; do
	echo "C$(Clock)"
	sleep 1
done
