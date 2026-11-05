# Bobzzite OS Performance Profiling & Benchmark Guide

## Overview

Bobzzite OS provides built-in system performance measurement and hardware profiling via the `bobzzite-bench` tool. This tool enables indie game developers and gamers to test hardware performance baselines, verify storage read/write performance, inspect CPU scaling governor settings, and validate Vulkan driver initialization.

---

## The `bobzzite-bench` Tool

Invoke `bobzzite-bench` from a terminal or through the **Bobzzite Control Center**:

```bash
# Terminal execution
bobzzite-bench
```

### Benchmark Metrics

1. **Hardware & Governor Discovery:**
   - Detects CPU microarchitecture, total logical thread count, and available memory.
   - Inspects the active `cpufreq` scaling governor (e.g. `schedutil`, `performance`, or `powersave`).
   - On gaming handhelds (Steam Deck, ROG Ally), verifies that `gamemoded` dynamically transitions the governor to `performance`.

2. **CPU Compute Throughput:**
   - Runs a 100MB cryptographic hashing throughput test measuring integer and stream compute latency in milliseconds.

3. **Storage I/O Speed:**
   - Executes a 256MB sequential block write test with sync (`conv=fdatasync`) to measure effective disk write bandwidth on NVMe or MicroSD media.

4. **Vulkan GPU Probe:**
   - Identifies active Vulkan rendering devices, driver versions, and Direct Rendering Infrastructure nodes (`/dev/dri/card*` and `/dev/dri/renderD*`).

---

## Optimizing Benchmark Results

- To lock high clock speeds and reduce audio/framerate jitter during benchmarks, apply `bobzzite-tweak performance`.
- To clean background disk operations before running I/O tests, run `bobzzite-clean`.
- For gaming frame-time measurement during live gameplay, launch games through `mangohud %command%`.
