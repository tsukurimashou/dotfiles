Getdefaultsinkname() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}

Getdefaultsinkvol() {
    pacmd list-sinks |
        awk '/^\s+name: /{indefault = $2 == "<'$(Getdefaultsinkname)'>"}
            /^\s+volume: / && indefault {print $5; exit}'
}
Getdefaultsinkport() {
    pacmd list-sinks |
        awk '/^\s+name: /{indefault = $2 == "<'$(Getdefaultsinkname)'>"}
            /^\s+active port: / && indefault {print $3; exit}'
}
Getdefaultsinkstate() {
    pacmd list-sinks |
        awk '/^\s+name: /{indefault = $2 == "<'$(Getdefaultsinkname)'>"}
            /^\s+muted: / && indefault {print $2; exit}'
}
Volume() {
    PORT=$(Getdefaultsinkport)
    MUTE=$(Getdefaultsinkstate)
    VOL=$(Getdefaultsinkvol)

    if [ "$PORT" == "<analog-output-speaker>" ]; then
        ICON="";
    elif [ "$PORT" == "<analog-output-headphones>" ]; then
        ICON="";
    else
        ICON="?";
    fi

    if [ "$MUTE" == "yes" ]; then
        ICON=""
    fi

    echo "VOL $VOL"
}

while true; do
    echo "Z$(Volume)"
    sleep 1;
done
