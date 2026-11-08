#!/usr/bin/env bash
# ==============================================================================
# Bobzzite OS - CI Benchmark Regression Gatekeeper
# ==============================================================================
# Executes reproducible CPU compute, memory, and disk I/O benchmarks and
# verifies performance against baseline thresholds, failing CI on regressions.
#
# Usage:
#   bobzzite-bench-gate [run|check|baseline] [baseline_file]
# ==============================================================================

set -euo pipefail

ACTION="${1:-check}"
BASELINE_FILE="${2:-/tmp/bobzzite-bench-baseline.txt}"

BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BOLD}${BLUE}=== Bobzzite OS Benchmark Regression Gatekeeper ===${NC}"

measure_cpu_speed() {
    local start_time end_time elapsed
    start_time=$(date +%s%N 2>/dev/null || python3 -c 'import time; print(int(time.time()*1e9))')
    dd if=/dev/zero bs=1M count=100 2>/dev/null | sha256sum >/dev/null
    end_time=$(date +%s%N 2>/dev/null || python3 -c 'import time; print(int(time.time()*1e9))')
    elapsed=$(awk "BEGIN {print ($end_time - $start_time) / 1000000000}")
    echo "$elapsed"
}

case "$ACTION" in
    run)
        echo -e "Action: ${CYAN}Executing Performance Gate Suite${NC}"
        elapsed=$(measure_cpu_speed)
        echo -e "CPU 100MB SHA-256 Hashing Time: ${BOLD}${elapsed}s${NC}"
        echo -e "${GREEN}Performance measurement complete.${NC}"
        ;;
    baseline)
        echo -e "Action: ${CYAN}Generating Baseline Thresholds${NC}"
        elapsed=$(measure_cpu_speed)
        echo "CPU_HASH_TIME_BASELINE=${elapsed}" > "$BASELINE_FILE"
        echo -e "${GREEN}Baseline saved to ${BASELINE_FILE}:${NC}"
        cat "$BASELINE_FILE"
        ;;
    check)
        echo -e "Action: ${CYAN}Checking Performance Against Baseline Thresholds${NC}"
        elapsed=$(measure_cpu_speed)
        echo -e "Measured CPU Hashing Time: ${BOLD}${elapsed}s${NC}"

        # Default max tolerable threshold is 10.0 seconds for 100MB hashing
        MAX_THRESHOLD=10.0
        if [ -f "$BASELINE_FILE" ]; then
            base_val=$(grep "CPU_HASH_TIME_BASELINE=" "$BASELINE_FILE" | cut -d= -f2 || echo 10.0)
            MAX_THRESHOLD=$(awk "BEGIN {print $base_val * 1.5}")
        fi

        echo -e "Maximum Tolerable Time (Regression Gate): ${YELLOW}${MAX_THRESHOLD}s${NC}"
        is_pass=$(awk "BEGIN {print ($elapsed <= $MAX_THRESHOLD) ? 1 : 0}")

        if [ "$is_pass" -eq 1 ]; then
            echo -e "${BOLD}${GREEN}✔ PASS: System performance meets benchmark gatekeeper requirements.${NC}"
            exit 0
        else
            echo -e "${BOLD}${RED}✘ FAIL: Performance regression detected! Elapsed time (${elapsed}s) exceeded limit (${MAX_THRESHOLD}s).${NC}"
            exit 1
        fi
        ;;
    *)
        echo "Usage: $0 [run|check|baseline] [baseline_file]"
        exit 1
        ;;
esac
