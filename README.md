# ⚡ Pre-compiled UNM Miner for Termux

Welcome to the **MDA-Tech** repository! This is a Work-In-Progress (WIP) repo providing pre-compiled `unmminer` binaries (specifically designed for Cereblix / CRB) optimized for the latest Termux (v0.118.0) and compiled using the latest Clang (v17.0.6).

We made this repository so you can skip the tedious compilation process and start mining directly on your Android device in just a few minutes.

---

### ⚠️ Disclaimer (Do With Your Own Risk - DWYOR)
> I accept no warranties or liabilities for the usage of this repository and the provided binaries. CPU mining on mobile devices generates significant heat and can degrade battery health or damage hardware over prolonged periods. **Use it entirely at your own risk!**

### 📱 Device Requirements
* **Architecture:** ARMv8 (64-bit) devices only.
* **Note:** If the provided Termux APK fails to install, it means your device or OS is running on a 32-bit architecture. This restriction is intentional, as CPU mining on 32-bit devices is highly unprofitable and will only waste your time and hardware.

---

## 🚀 Quick Installation

**1. Install the recommended Termux version (arm64-v8a):**
Download and install the official debug build from the link below:
```text
https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk
```

**2. Setup Termux environment:**
Open Termux and run the following commands to update packages and install required dependencies. 
*(If prompted during installation, just type `y` and press enter).*
```bash
yes | pkg update -y
yes | pkg upgrade -y
yes | pkg install wget nano -y
```

**3. Download the Miner Toolkit:**
Create a dedicated folder and fetch the pre-compiled binary, configuration file, and the startup script.
```bash
mkdir unmminer && cd unmminer
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/unmminer
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/config.json
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/start.sh
chmod +x unmminer start.sh
```

---

## ⚙️ How to Use

**1. Configure your mining details:**
Open the configuration file to set up your pool and wallet address.
```bash
nano config.json
```
*   `pool`: Your mining pool URL (e.g., `stratum+tcp://stratum.cereblix.com:3333`)
*   `wallet`: Your CRB payout address
*   `worker`: Your rig or worker name (will be appended as `.worker` to your address)
*   `threads`: Number of CPU threads to use (leave as `"auto"` for best performance)

*(Press `CTRL + X`, then `Y`, and `Enter` to save and exit).*

**2. Start Mining:**
Run the smart startup script. It will automatically read your `config.json` and launch the miner with the awesome MDA-Tech animated banner!
```bash
./start.sh
```

**3. Stop Mining:**
To safely exit the miner, simply press:
```text
CTRL + C
```

---

## 💡 Tips & Tricks for Mobile Mining

* **Troubleshooting Updates:** If Termux fails to complete `update` & `upgrade`, try clearing the app's cache and data in your Android settings.
* **Battery Management:** Disable battery manager and remove battery optimization restrictions for the Termux app in your phone settings to prevent the OS from killing the miner in the background.
* **Battery Protection:** If your phone has a "Protect Battery" feature (stops charging at 85%), enable it. It greatly helps preserve battery health during 24/7 plugged-in mining.
* **Screen Management:** Long-press anywhere inside the Termux terminal, tap `More`, and select `Keep screen on`.
* **Background Mining:** Pull down your Android notification drawer, find the Termux notification, and tap `Acquire wakelock`. This allows the miner to run even when the screen is locked *(Note: heavily depends on your device manufacturer's RAM management rules)*.
* **Patience:** Give the miner and pool stratum some time (~30m to 1h) to stabilize and show an accurate hashrate on the pool dashboard.

Happy Mining! ⛏️
