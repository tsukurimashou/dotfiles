#!/usr/bin/bash

Mail() {
	DATETIME=$(date "+%H:%M")
	echo -n "⮣ 0"
}

while true; do
	echo "M$(Mail)"
	sleep 1
done
