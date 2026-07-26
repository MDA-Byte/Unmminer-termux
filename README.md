# unm-termux-prebuild

Pre-compiled `nmminer` khusus untuk dijalankan di lingkungan Termux (Android). Repository ini memudahkan Anda untuk langsung menambang (mining) koin tanpa harus melakukan proses kompilasi/build yang rumit dari awal di perangkat Android Anda.

## ⚠️ Peringatan (DWYOR - Do With Your Own Risk)
- **Risiko Overheat:** Mining koin (CPU mining) di smartphone dapat menyebabkan perangkat menjadi sangat panas.
- **Kerusakan Baterai & Hardware:** Suhu panas yang ekstrem dalam waktu yang lama dapat memperpendek umur baterai hingga merusak komponen internal smartphone.
- **DWYOR:** Gunakan script dan binari ini sepenuhnya dengan risiko Anda sendiri. Penulis/pembuat repository ini **TIDAK BERTANGGUNG JAWAB** atas segala kerusakan apa pun pada perangkat Anda.

## 📦 Isi File `.tar.gz`
- `nmminer` - File binary miner yang sudah di-compile khusus untuk Termux.
- `start.sh` - Script bash pelengkap untuk menjalankan miner secara otomatis dengan mudah.
- `config.json` - File pengaturan (pool, wallet, threads).

## 🚀 Cara Penggunaan

1. **Update dan Install Dependensi Termux**
   Buka Termux dan jalankan perintah berikut:
   ```bash
   pkg update && pkg upgrade -y
   pkg install wget tar nano -y
   ```

2. **Download File Release**
   Download file `unm-termux-prebuild.tar.gz` dari Github (atau gunakan `wget`):
   ```bash
   wget https://github.com/USERNAME_ANDA/unm-termux-prebuild/releases/download/v1.0/unm-termux-prebuild.tar.gz
   ```

3. **Ekstrak File**
   ```bash
   tar -xf unm-termux-prebuild.tar.gz
   cd unm-termux-prebuild
   ```

4. **Edit Konfigurasi (Wajib)**
   Edit file `config.json` sesuai dengan pool dan alamat wallet Anda:
   ```bash
   nano config.json
   ```
   Ubah alamat wallet menjadi milik Anda, dan atur bagian `threads` sesuai dengan jumlah core CPU Android Anda (Sangat disarankan tidak memakai *max thread* untuk menghindari overheat parah). Simpan dengan menekan `CTRL + X`, lalu `Y`, lalu `Enter`.

5. **Jalankan Miner**
   Cukup jalankan script `start.sh`. Script ini akan otomatis memberikan izin eksekusi (`chmod +x`) jika diperlukan.
   ```bash
   ./start.sh
   ```
   *(Untuk menghentikan proses mining, tekan `CTRL + C`)*

---
**Catatan:** Selalu awasi suhu smartphone saat melakukan mining. Jika dirasa terlalu panas, kurangi jumlah `threads` pada file `config.json`. Happy Mining! ⛏️
