# Bobzzite OS - CI Benchmark Regression Gatekeeper Guide

The `bobzzite-bench-gate` utility enforces performance SLAs during continuous integration and release packaging builds, preventing performance regressions caused by kernel sysctl changes, compiler flags, or container layer bloat.

## Architecture & Tolerance Thresholds

1. **Deterministic Compute Workload**:
   Executes a 100MB streaming block through SHA-256 cryptographic hashing to measure consistent single-thread IPC and memory bandwidth throughput.
2. **Dynamic Baseline Comparison**:
   If a baseline file is present (e.g., recorded on release tag), the gate allows up to `1.5x` tolerance before triggering a build-breaking regression failure.
3. **Automated CI Exit Codes**:
   - `0`: Performance within acceptable SLA limits.
   - `1`: Regression detected; execution time exceeded ceiling threshold.

## Usage

```bash
# Run a one-off performance test
bobzzite-bench-gate run

# Record an authoritative performance baseline
bobzzite-bench-gate baseline /tmp/bench-baseline.txt

# Enforce regression gate against baseline (or default thresholds)
bobzzite-bench-gate check /tmp/bench-baseline.txt
```

## Control Center Integration

`bobzzite-bench-gate` is integrated under **🛡️ System Updates & Diagnostics** in **Bobzzite Control Center** (`bobzzite-control-center`), allowing instant hardware performance sanity tests.
