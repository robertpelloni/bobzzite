# Bobzzite OS Hardware Profile Analysis & Rebase Routing Guide

## Overview

The `bobzzite-deploy profile-analyze` tool performs automated hardware probing and scoring to match the current physical device against the optimal Bobzzite target flavor.

---

## Probing Criteria

1. **DMI Product Identifier (`/sys/class/dmi/id/product_name`)**:
   - Detects handheld gaming PCs (Steam Deck LCD/OLED, ASUS ROG Ally, Lenovo Legion Go, AYANEO, GPD, OneXPlayer).
2. **PCI Vendor and Class Codes (`lspci`)**:
   - Detects discrete NVIDIA GPUs via vendor code `10de`.
3. **Direct Rendering Manager Nodes (`/dev/dri/renderD128`)**:
   - Verifies hardware GPU acceleration presence.

---

## Fit Scoring & Recommendations

| Physical System Signature | 1st Priority Flavor (100% Fit) | Alternate (Fallback) | Not Recommended |
| :--- | :--- | :--- | :--- |
| **Handheld PC APU** | `bobzzite-deck` | `bobzzite` (70%) | `bobzzite-nvidia` (20%) |
| **NVIDIA GeForce Workstation** | `bobzzite-nvidia` | `bobzzite` (60%) | `bobzzite-deck` (30%) |
| **Desktop AMD / Intel** | `bobzzite` | `bobzzite-deck` (65%) | `bobzzite-nvidia` (10%) |

---

## CLI Usage

```bash
# Run deep profile analysis and suitability scores
bobzzite-deploy profile-analyze

# Automated rebase based on detected fit
bobzzite-deploy auto-detect
```
