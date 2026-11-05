#!/bin/bash
set -euo pipefail

# Bobzzite Controller & Gamepad Manager
# Detects joysticks, tests gamepad input, and configures controller mappings

echo "=== bobzzite Game Controller & Handheld Mapping Tool ==="

ACTION="${1:-list}"

case "$ACTION" in
    list)
        echo "--- Detecting Connected Controllers & Joysticks ---"
        if [ -d /dev/input ]; then
            JS_DEVICES=( /dev/input/js* )
            if [ -e "${JS_DEVICES[0]}" ]; then
                echo "Found joystick devices:"
                ls -l /dev/input/js*
            else
                echo "No /dev/input/js* devices detected."
            fi
        fi
        if command -v lsusb >/dev/null 2>&1; then
            echo -e "\nUSB Game Controllers:"
            lsusb | grep -i -E "gamepad|controller|xbox|playstation|joystick|valve|sony|microsoft" || echo "No USB controllers matched via lsusb."
        fi
        ;;
    test)
        echo "Testing primary gamepad device (/dev/input/js0)..."
        if [ -e /dev/input/js0 ]; then
            if command -v jstest >/dev/null 2>&1; then
                jstest --normal /dev/input/js0
            else
                echo "jstest not available. Inspecting raw event stream..."
                timeout 3 cat /dev/input/js0 | hexdump -C || true
            fi
        else
            echo "Device /dev/input/js0 not present."
        fi
        ;;
    handheld-profile)
        echo "Configuring Handheld PC controller profile (Steam Deck / ROG Ally / Legion Go)..."
        echo "Applying udev input permissions for user ${USER}..."
        if [ -d /etc/udev/rules.d ] && [ -w /etc/udev/rules.d ]; then
            echo 'KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"' > /etc/udev/rules.d/99-uinput-bobzzite.rules 2>/dev/null || true
        fi
        echo "Handheld controller profile ready."
        ;;
    help|*)
        echo "Usage: bobzzite-gamepad [list|test|handheld-profile]"
        ;;
esac
