#!/bin/bash
set -euo pipefail

# Bobzzite System Tuning & Latency Optimizer
# Configures kernel sysctl parameters, split lock mitigation, and audio quantum latency

echo "=== bobzzite System Performance & Latency Tuner ==="

ACTION="${1:-status}"

case "$ACTION" in
    status)
        echo "--- Active Performance Governors & Tunables ---"
        if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
            echo "CPU Scaling Governor: $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)"
        fi
        if [ -f /proc/sys/kernel/split_lock_mitigate ]; then
            echo "Kernel Split Lock Mitigate: $(cat /proc/sys/kernel/split_lock_mitigate)"
        fi
        if [ -f /proc/sys/vm/max_map_count ]; then
            echo "Virtual Memory max_map_count: $(cat /proc/sys/vm/max_map_count)"
        fi
        ;;
    optimize)
        echo "Applying gaming & low-latency optimizations..."
        if [ -w /proc/sys/kernel/split_lock_mitigate ]; then
            echo 0 > /proc/sys/kernel/split_lock_mitigate || true
            echo "Split lock mitigation disabled for unthrottled gaming."
        fi
        if [ -w /proc/sys/vm/max_map_count ]; then
            sysctl -w vm.max_map_count=16777216 2>/dev/null || true
            echo "max_map_count set to 16777216 for modern anti-cheat and large memory maps."
        fi
        echo "Tuning applied successfully."
        ;;
    audio-lowlatency)
        echo "Configuring PipeWire low latency buffer quantum (64/48000)..."
        export PIPEWIRE_LATENCY="64/48000"
        echo "PIPEWIRE_LATENCY set to 64/48000 for current session."
        ;;
    help|*)
        echo "Usage: bobzzite-tweak [status|optimize|audio-lowlatency]"
        ;;
esac
