#!/bin/bash
ip link set dev wlp4s0 up
wpa_supplicant -i wlp4s0 -c <(wpa_passphrase "MobileWiFi-E818" "20GHN0MH")
dhcpcd wlp4s0
