#!/bin/bash

# Audio input switcher for PipeWire
# Usage: ./audio_input_switch.sh [headset|rode]

if [ -z "$1" ]; then
    echo "Usage: $0 [headset|rode]"
    exit 1
fi

case "$1" in
    headset)
        DEVICE_NAME="Elo 7\.1.*Analog Stereo"
        FRIENDLY_NAME="Headset (Elo 7.1)"
        ;;
    rode)
        DEVICE_NAME="RODE AI-1 Mono"
        FRIENDLY_NAME="RODE AI-1"
        ;;
    *)
        echo "Unknown device: $1"
        echo "Use 'headset' or 'rode'"
        exit 1
        ;;
esac

# Get the device ID (handling the asterisk for current default)
DEVICE_ID=$(wpctl status | rg "$DEVICE_NAME.*\[vol: 1\.00\]" | sed 's/^[^0-9]*\([0-9]\+\).*/\1/')

if [ -z "$DEVICE_ID" ]; then
    echo "Error: Could not find device matching '$DEVICE_NAME' with vol: 1.00"
    exit 1
fi

# Set as default
wpctl set-default "$DEVICE_ID"

if [ $? -eq 0 ]; then
    dunstify -a 'Mic Input' -t 500 "Switched to $FRIENDLY_NAME (ID: $DEVICE_ID)"
else
    dunstify -a 'Mic Input' "Failed to switch to $FRIENDLY_NAME"
    exit 1
fi
