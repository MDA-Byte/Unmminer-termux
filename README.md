# Pre-compiled nmminer for Termux

This is a WIP repo for pre-compiled `nmminer` binaries (for Cereblix / CRB) with latest Termux(v0.118.0) and latest Clang(v17.0.6).

# **`Disclaimer: I accept no warranties or liabilities on this repo. Use it at your own risk!!!`**

# **`This is for any ARMv8 device`**

# **`If Termux apk does not install, this is done purposely. The provided apk will only work on arm 64-bit operating system, which in turn requires arm 64-bit hardware. This is to avoid wasting time for users and myself. (Mining on 32-bit devices is not profitable)`**

## Installation:

1. Download & install latest arm64-v8a [Termux](https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk):

```text
https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk
```

2. Get Termux ready:

* Type `y` then enter key in any prompts!

```bash
yes | pkg update -y
yes | pkg upgrade -y
yes | pkg install wget nano -y
```

3. Download nmminer, config, start:

```bash
mkdir nmminer && cd nmminer
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/nmminer
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/config.json
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/start.sh
chmod +x nmminer start.sh
```

## Usage:

1. Edit your pool, wallet address, and threads in `config.json`:

```bash
nano config.json
```
*   `pool`: Your mining pool URL (default stratum.cereblix.com:3333)
*   `wallet`: Your CRB payout address
*   `worker`: Your rig/worker name (will be appended as `.worker` to your address)
*   `threads`: Number of threads, or `"auto"` for automatic detection

2. Start nmminer with the animated MDA-Tech banner:

```bash
./start.sh
```
*(The script will automatically parse `config.json` and pass the correct arguments to nmminer).*

3. Close nmminer with:

```text
CTRL + C
```

## Tips & Tricks:

* If Termux can't complete update & upgrade, please clear app cache and data.
* Disable battery manager and battery optimization for Termux app.
* If you have a "protect battery" option to stop charge at 85% or similar, enable it to help preserve battery health.
* If you long press anywhere within Termux then click `More`, there is an option to `Keep screen on`.
* Alternatively, you can pull down the notification drawer and expand Termux notification to `Acquire wakelock` this will enable you to mine with the screen off **(NOTE! not all devices obey this rule, it is a hit or miss)**.
* Give the miner/stratum time to stabilize hashrate (~30m-1h).
