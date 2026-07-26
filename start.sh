#!/bin/bash

# ==========================================
# Script Auto-Start nmminer khusus Termux
# ==========================================

MINER_BIN="./nmminer"
CONFIG_FILE="config.json"

echo "=========================================="
echo "      Memulai nmminer di Termux..."
echo "=========================================="

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: File '$CONFIG_FILE' tidak ditemukan!"
    echo "Pastikan Anda sudah mengekstrak semua file dan mengedit config.json."
    exit 1
fi

if [ ! -f "$MINER_BIN" ]; then
    echo "Error: File binari '$MINER_BIN' tidak ditemukan!"
    echo "Pastikan file nmminer berada di folder yang sama dengan start.sh"
    exit 1
fi

if [ ! -x "$MINER_BIN" ]; then
    echo "Menambahkan izin eksekusi (chmod +x) pada $MINER_BIN..."
    chmod +x "$MINER_BIN"
fi

echo "Membaca konfigurasi..."
# Menjalankan nmminer dengan config.json
# (Asumsi nmminer mendukung parameter -c config.json)
$MINER_BIN -c $CONFIG_FILE

# Catatan: Jika nmminer versi Anda tidak mendukung perintah "-c config.json",
# hapus/komen baris di atas dan gunakan baris di bawah ini:
#
# ALGO=$(grep '"algo"' $CONFIG_FILE | cut -d '"' -f 4)
# POOL=$(grep '"pool"' $CONFIG_FILE | cut -d '"' -f 4)
# WALLET=$(grep '"wallet"' $CONFIG_FILE | cut -d '"' -f 4)
# PASS=$(grep '"password"' $CONFIG_FILE | cut -d '"' -f 4)
# THREADS=$(grep '"threads"' $CONFIG_FILE | tr -dc '0-9')
# $MINER_BIN -a $ALGO -o $POOL -u $WALLET -p $PASS -t $THREADS
