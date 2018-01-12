#!/usr/bin/bash


Vpn() {
    IFACE1="tap0"
    IFACE2="tun0"
    if [[ $(ip addr show dev $IFACE1 2>&1) =~ "Device" ]] && [[ $(ip addr show dev $IFACE2 2>&1) =~ "Device" ]];  then    
        ICON=""
        TXT="inactive"
    else
        ICON=""
        # IP=$(ip addr show dev $IFACE | grep "inet " | cut -d" " -f6 | cut -d/ -f1)
        TXT="active"
    fi
    echo "VPN $TXT"
}

while true; do
    echo "V$(Vpn)"
    sleep 1;
done
