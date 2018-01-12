#!/bin/bash

Volume() {
    PORT=$(pactl list sinks | awk -v RS="" '/RUNNING/' | grep 'Active Port' | cut -d ' ' -f 3)
    MUTE=$(pactl list sinks | awk -v RS="" '/RUNNING/' | grep 'Mute' | cut -d ' ' -f 2)

    if [ "$PORT" == "analog-output-speakers" ]; then
        ICON="⮞";
    elif [ "$PORT" == "analog-output-headphones" ]; then
        ICON="⮜";
    else
        ICON="?";
    fi

    if [ "$MUTE" == "yes" ]; then
        ICON="✕"
    fi

    VOL=$(pactl list sinks | awk -v RS="" '/RUNNING/' | grep 'Volume:' | cut -d ' ' -f 6 | cut -d '/' -f 1 | cut -d $'\n' -f 1)
    echo "$ICON $VOL"
}

while true; do
    echo "V$(Volume)"
    sleep 1;
done
