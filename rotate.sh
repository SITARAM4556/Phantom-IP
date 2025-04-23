#!/bin/bash

WG_PATH="./wg_confs"
SLEEP_TIME=10

# Optional kill switch using iptables
setup_kill_switch() {
    sudo iptables -I OUTPUT ! -o wg0 -m mark ! --mark 51820 -j DROP
}

remove_kill_switch() {
    sudo iptables -D OUTPUT ! -o wg0 -m mark ! --mark 51820 -j DROP
}

# Main loop
while true; do
    for conf in "$WG_PATH"/*.conf; do
        echo "[+] Switching to: $conf"
        sudo wg-quick down wg0 >/dev/null 2>&1
        sudo wg-quick up "$conf"
        sleep "$SLEEP_TIME"
    done
done
