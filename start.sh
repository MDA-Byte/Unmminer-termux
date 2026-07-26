#!/bin/bash

# ==========================================
# Banner Animasi MDA-Tech (Bash Port)
# ==========================================
clear

print_gradient_animated() {
    local text="$1"
    local delay=0.03

    IFS=$'\n' read -rd '' -a lines <<< "$text"
    for line in "${lines[@]}"; do
        local len=${#line}
        local out=""
        for (( i=0; i<$len; i++ )); do
            local c="${line:$i:1}"
            
            if [[ "$c" == '\' ]]; then
                c="\\\\"
            fi
            
            local r=$(( 255 - (i * 255 / 55) ))
            if (( r < 0 )); then r=0; fi
            local g=$(( i * 255 / 55 ))
            if (( g > 255 )); then g=255; fi
            local b=255
            
            out+="\e[38;2;${r};${g};${b}m${c}"
        done
        echo -e "${out}\e[0m"
        sleep "$delay"
    done
}

ASCII_ART="
    __  ___ ____   ___       ______         __  
   /  |/  // __ \\ /   |     /_  __/___  ___/ /_ 
  / /|_/ // / / // /| |      / / / _ \\/ ___/ __ \\
 / /  / // /_/ // ___ | _   / / /  __/ /__/ / / /
/_/  /_//_____//_/  |_|(_) /_/  \\___/\\___/_/ /_/ 

        [ MDA-Tech - Elite Automation ]
"

print_gradient_animated "$ASCII_ART"
echo -e "\e[38;2;0;255;255m=================================================\e[0m\n"

# ==========================================
# Core Miner Script
# ==========================================

# Ensure Termux has wake lock to prevent sleeping
termux-wake-lock 2>/dev/null || true

# Set working directory to the script's location
cd "$(dirname "$0")"

CONFIG_FILE="config.json"

if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "\e[1;31m[-] Error: File '$CONFIG_FILE' tidak ditemukan!\e[0m"
    exit 1
fi

# Parsing manual JSON menggunakan grep dan sed (tanpa jq agar aman di Termux murni)
POOL=$(grep '"pool"' "$CONFIG_FILE" | sed -E 's/.*"pool"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
WALLET=$(grep '"wallet"' "$CONFIG_FILE" | sed -E 's/.*"wallet"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
WORKER=$(grep '"worker"' "$CONFIG_FILE" | sed -E 's/.*"worker"[[:space:]]*:[[:space:]]*"([^"]+)".*/\1/')
THREADS=$(grep '"threads"' "$CONFIG_FILE" | sed -E 's/.*"threads"[[:space:]]*:[[:space:]]*"?([a-zA-Z0-9]+)"?.*/\1/')

# Gabungkan wallet dan worker jika worker diisi
if [ -n "$WORKER" ] && [ "$WORKER" != "null" ]; then
    FULL_WALLET="${WALLET}.${WORKER}"
else
    FULL_WALLET="$WALLET"
fi

echo -e "\e[1;36m[*] Memuat Konfigurasi (config.json):\e[0m"
echo -e "    - Pool   : $POOL"
echo -e "    - Wallet : $FULL_WALLET"
echo -e "    - Threads: $THREADS\n"

if [ ! -f "./unmminer" ]; then
    echo -e "\e[1;31m[-] Error: File binari 'unmminer' tidak ditemukan!\e[0m"
    exit 1
fi

chmod +x unmminer

echo -e "\e[1;32m[+] Starting unmminer...\e[0m"

# Eksekusi unmminer dengan argumen dari config.json
if [ "$THREADS" = "auto" ] || [ -z "$THREADS" ]; then
    ./unmminer -o "$POOL" -u "$FULL_WALLET"
else
    ./unmminer -o "$POOL" -u "$FULL_WALLET" -t "$THREADS"
fi
