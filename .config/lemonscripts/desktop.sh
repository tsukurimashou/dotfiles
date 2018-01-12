#!/usr/bin/bash

Desktop() {
	DESKTOP=$(bspc query -T -d | jq -r '.name')
  echo $DESKTOP
}

while true; do
	echo "D$(Desktop)"
	sleep 1;
done



