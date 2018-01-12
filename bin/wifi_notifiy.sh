#!/bin/bash

case "$2" in
    CONNECTED)
        notify-send "Wifi connected";
        ;;
    DISCONNECTED)
        notify-send "Wifi disconnected";
        ;;
esac
