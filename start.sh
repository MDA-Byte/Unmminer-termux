#!/bin/bash

# Ensure Termux has wake lock to prevent sleeping
termux-wake-lock

# Set working directory to the script's location
cd "$(dirname "$0")"

# Make sure Unmminer is executable
chmod +x unmminer

# Start Unmminer with config.json
./unmminer -c config.json