#!/bin/bash

# ==========================================
# Banner Animasi MDA-Tech (Bash Port)
# ==========================================
clear

# Fungsi untuk mencetak teks dengan gradasi warna animasi
print_gradient_animated() {
    local text="$1"
    local delay=0.03 # Sedikit lebih cepat di bash agar mulus

    # Pisahkan teks berdasarkan baris baru
    IFS=$'\n' read -rd '' -a lines <<< "$text"
    for line in "${lines[@]}"; do
        local len=${#line}
        local out=""
        for (( i=0; i<$len; i++ )); do
            local c="${line:$i:1}"
            
            # Hitung RGB gradasi dari Merah/Magenta ke Cyan/Biru
            local r=$(( 255 - (i * 255 / 55) ))
            if (( r < 0 )); then r=0; fi
            local g=$(( i * 255 / 55 ))
            if (( g > 255 )); then g=255; fi
            local b=255
            
            # Tambahkan karakter dengan kode warna RGB escape ke string output
            out+="\e[38;2;${r};${g};${b}m${c}"
        done
        # Print baris dengan warna dan reset di akhir, lalu tunggu (delay)
        echo -e "${out}\e[0m"
        sleep "$delay"
    done
}

ASCII_ART="
    __  ___ ____   ___       ______         __  
   /  |/  // __ \ /   |     /_  __/___  ___/ /_ 
  / /|_/ // / / // /| |      / / / _ \/ ___/ __ \
 / /  / // /_/ // ___ | _   / / /  __/ /__/ / / /
/_/  /_//_____//_/  |_|(_) /_/  \___/\___/_/ /_/ 

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

# Make sure nmminer is executable
if [ -f "./nmminer" ]; then
    chmod +x nmminer
    # Start nmminer with config.json
    echo -e "\e[1;32m[+] Starting nmminer...\e[0m"
    ./nmminer -c config.json
else
    # Jika nmminer belum ada, tapi unmminer ada, kita jalankan unmminer
    # (Hanya sebagai fallback karena di ls tadi ada file unmminer)
    if [ -f "./unmminer" ]; then
        chmod +x unmminer
        echo -e "\e[1;32m[+] Starting unmminer...\e[0m"
        ./unmminer -c config.json
    else
        echo -e "\e[1;31m[-] Error: nmminer executable not found!\e[0m"
        exit 1
    fi
fi
