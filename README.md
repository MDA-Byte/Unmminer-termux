# Pre-compiled Unmminer for Termux

This is a WIP repo for pre-compiled Unmminer binaries with latest Termux(v0.118.0) and latest Clang(v17.0.6).

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
yes | pkg install libjansson wget nano -y
```

3. Download Unmminer, config, start:

```bash
mkdir unmminer && cd unmminer
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/unmminer
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/config.json
wget https://raw.githubusercontent.com/MDA-Byte/Unmminer-termux/main/start.sh
chmod +x unmminer start.sh
```

## Usage:

1. Edit your pools, address, worker name:

* Pools use the `"disabled"` feature so `1` = Off (not used) while `0` = On (will use this pool)
* Address & worker name is near the bottom of the config.json in format `address here.worker name here`
* Optionally use Unmminer API for monitoring

```bash
nano config.json
```

2. Start Unmminer with:

```bash
./start.sh
```

3. Close Unmminer with:

```text
CTRL + C
```

## Tips & Tricks:

* If Termux can't complete update & upgrade, please clear app cache and data.
* Disable battery manager and battery optimization for Termux app.
* If you have a "protect battery" option to stop charge at 85% or similar, enable it to help preserve battery health.
* If you long press anywhere within Termux then click `More`, there is an option to `Keep screen on`.
* Alternatively, you can pull down the notification drawer and expand Termux notification to `Acquire wakelock` this will enable you to mine with the screen off **(NOTE! not all devices obey this rule, it is a hit or miss)**.
* Use a pool with low latency to your location/internet.
* Give the miner/stratum time to stabilize hashrate (~30m-1h).