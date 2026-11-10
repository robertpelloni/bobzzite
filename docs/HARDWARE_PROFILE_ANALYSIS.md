# Bobzzite OS Hardware Profile Analysis & Rebase Routing Guide (v9.2.0)

## Overview

The `bobzzite-deploy profile-analyze` tool performs automated hardware probing, device capability extraction, and suitability scoring to match the current physical device against the optimal Bobzzite target flavor.

---

## Probing Criteria

1. **Host Architecture (`uname -m`)**:
   - Classifies `x86_64` vs `aarch64` instruction sets.
2. **DMI Product Identifier (`/sys/class/dmi/id/product_name`)**:
   - Detects handheld gaming PCs (Steam Deck LCD/OLED, ASUS ROG Ally, Lenovo Legion Go, AYANEO, GPD, OneXPlayer).
3. **PCI Vendor and Class Codes (`lspci`)**:
   - Detects discrete NVIDIA GPUs via vendor code `10de` and AMD Radeon dGPUs via `1002`.
4. **ARM64 Device Tree & SoC Identification (`/proc/device-tree/model` or `/proc/cpuinfo`)**:
   - Detects Qualcomm Snapdragon X Elite, Rockchip RK3588, and Raspberry Pi / Apple Silicon platforms.
5. **Direct Rendering Manager Nodes (`/dev/dri/renderD128`, `renderD129`)**:
   - Probes hardware GPU acceleration presence and multi-GPU PRIME topology via `bobzzite-prime`.

---

## Fit Scoring & Recommendations

| Physical System Signature | 1st Priority Flavor (100% Fit) | Alternate (Fallback) | Not Recommended |
| :--- | :--- | :--- | :--- |
| **Handheld PC APU** | `bobzzite-deck` | `bobzzite` (70%) | `bobzzite-nvidia` (20%), `bobzzite-arm64` (0%) |
| **NVIDIA GeForce Workstation** | `bobzzite-nvidia` | `bobzzite` (60%) | `bobzzite-deck` (30%), `bobzzite-arm64` (0%) |
| **Desktop AMD / Intel Arc** | `bobzzite` | `bobzzite-deck` (65%) | `bobzzite-nvidia` (10%), `bobzzite-arm64` (0%) |
| **ARM64 SoC (Snapdragon / RK3588)** | `bobzzite-arm64` | Incompatible with x86_64 images | `bobzzite`, `bobzzite-deck`, `bobzzite-nvidia` |

---

## CLI Usage

```bash
# Run deep profile analysis and suitability scores
bobzzite-deploy profile-analyze

# Automated rebase based on detected fit
bobzzite-deploy auto-detect

# Inspect hardware profile summary matrix
bobzzite-deploy profile-summary
```

---

## Control Center Integration

Hardware profile analysis and fit scores are exposed directly in the **Bobzzite Control Center** (`bobzzite-control-center`) via the **Profile Analysis** and **Deploy Compliance Audit** buttons under the **🎮 Hardware & Gaming Profiles** panel.
