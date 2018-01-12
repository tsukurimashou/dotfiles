#!/bin/bash
if [ "$#" = "1" ]
then 
    FORMAT='$0~"Sink"{start=0} $0~"Sink #'"$1"'"{start=1} $1~"Mute"&&start {print $2~"no"}'
    pactl list sinks | awk "$FORMAT" | xargs pactl set-sink-mute $1
else
    echo "USAGE: $0 <sink id>"
fi
