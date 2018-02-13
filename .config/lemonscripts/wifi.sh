#!/usr/bin/bash

Wifi() {
    STATUS=$(wpa_cli -i $WIFI_INTERFACE status | grep -w 'wpa_state' | cut -d '=' -f 2)

    if [ "$STATUS" = "COMPLETED" ]; then
        SIGNAL=$(awk 'NR==3 {print $3}''' /proc/net/wireless | sed 's/.$//')
        NAME=$(wpa_cli -i $WIFI_INTERFACE status | grep -w 'ssid' | cut -d '=' -f 2)
	    if [ "$SIGNAL" -ge 60 ]; then
            ICON="";
        elif [ "$SIGNAL" -ge 30 ]; then
            ICON=""
        else
            ICON=""
        fi 
        echo -n "$NAME ${SIGNAL}%"
    elif [ "$STATUS" = "INTERFACE_DISABLED" ]; then
        ICON=""
        echo -n "Wifi disabled"
    else
        ICON=""
        echo -n "Wifi disconnected"
    fi
}

while true; do
	echo "X$(Wifi)"
	sleep 1
done
