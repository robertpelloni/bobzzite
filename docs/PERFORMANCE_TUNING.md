# bobzzite System Performance Tuning & Latency Guide

bobzzite includes fine-grained performance tuning presets to minimize input delay, prevent frame stuttering, and ensure low audio latency during gameplay and creation.

---

## 1. Quick Tuning via Control Center
Launch **Bobzzite Control Center** and click **"System Tuning"** to inspect tunables and apply instant optimizations.

---

## 2. Command Line Usage

```bash
# Query active performance tunables
bobzzite-tweak status

# Apply low-latency gaming tweaks
bobzzite-tweak optimize

# Enable ultra-low audio latency buffer quantum
bobzzite-tweak audio-lowlatency
```

---

## 3. Tunable Parameters Explained

- **`vm.max_map_count=16777216`**: Ensures compatibility with Windows games under Proton that utilize extensive virtual memory spaces (e.g. DayZ, Hogwarts Legacy, Star Citizen).
- **`kernel.split_lock_mitigate=0`**: Disables kernel throttling caused by split locks in older Windows game executables running under Wine.
- **`PIPEWIRE_LATENCY="64/48000"`**: Reduces audio processing quantum buffer size to under 1.5ms for rhythm games and music production in Audacity.
