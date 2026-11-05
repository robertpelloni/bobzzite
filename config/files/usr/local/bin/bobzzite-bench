#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - Automated System Benchmark & Performance Profiler
# ==============================================================================
# Tests CPU compute throughput, disk sequential I/O write/read speed,
# Vulkan GPU device capabilities, and CPU governor/thermal state.
# ==============================================================================

set -euo pipefail

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Performance Benchmark & Profiler ===${NC}\n"

# 1. System & Hardware Summary
echo -e "${YELLOW}[1/4] Hardware Environment Summary:${NC}"
CPU_MODEL=$(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//')
CPU_CORES=$(grep -c "^processor" /proc/cpuinfo)
MEM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
echo -e "  • CPU: ${CYAN}${CPU_MODEL} (${CPU_CORES} logical threads)${NC}"
echo -e "  • Total RAM: ${CYAN}${MEM_TOTAL}${NC}"

# CPU Scaling Governor
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
    GOV=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    echo -e "  • Active Governor: ${CYAN}${GOV}${NC}"
else
    echo -e "  • Active Governor: ${CYAN}Unknown / Virtualized${NC}"
fi

# 2. CPU Compute Benchmark (Single-threaded sha256 checksum throughput)
echo -e "\n${YELLOW}[2/4] Testing CPU Single-Core Compute Throughput...${NC}"
START_TIME=$(date +%s%N)
head -c 100M /dev/zero | sha256sum > /dev/null
END_TIME=$(date +%s%N)
ELAPSED_NS=$((END_TIME - START_TIME))
ELAPSED_MS=$((ELAPSED_NS / 1000000))
echo -e "  • 100MB SHA-256 Hashing Time: ${GREEN}${ELAPSED_MS} ms${NC}"

# 3. Disk Storage Sequential I/O Benchmark
echo -e "\n${YELLOW}[3/4] Testing Storage I/O Throughput...${NC}"
TEST_DIR="/tmp"
if [ -d "$HOME/.cache" ]; then
    TEST_DIR="$HOME/.cache"
fi
TEST_FILE="${TEST_DIR}/bobzzite_bench_tmp.bin"

echo -e "  • Performing 256MB sequential write test to ${TEST_DIR}..."
dd if=/dev/zero of="${TEST_FILE}" bs=1M count=256 conv=fdatasync 2>&1 | tail -n 1 | sed 's/^/    /'
rm -f "${TEST_FILE}"

# 4. GPU & Display Server Capabilities
echo -e "\n${YELLOW}[4/4] Probing GPU & Graphics Driver State...${NC}"
if command -v vulkaninfo >/dev/null 2>&1; then
    echo -e "  • Vulkan Devices detected:"
    vulkaninfo --summary 2>/dev/null | grep -E "GPU|deviceName|driverVersion" | sed 's/^/    /' || echo "    Vulkan summary unavailable."
elif [ -d /dev/dri ]; then
    echo -e "  • Direct Rendering Devices detected in /dev/dri:"
    ls -l /dev/dri | grep -E "card|render" | sed 's/^/    /'
else
    echo -e "  • Headless or non-GPU container environment detected."
fi

echo -e "\n${BOLD}${GREEN}✔ Bobzzite Performance Benchmark complete.${NC}\n"
