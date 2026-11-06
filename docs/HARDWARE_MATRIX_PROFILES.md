# Bobzzite OS Hardware Matrix Profiles & Tier Specifications

## Architecture Matrix Overview

Bobzzite OS optimizes system tuning, compositor scaling, and driver stacks across three core hardware tiers:

---

## 1. Handheld Gaming Tier (`bobzzite-deck`)

- **Target Systems:**
  - Valve Steam Deck LCD (Custom AMD Aerith APU, Zen 2 + RDNA 2)
  - Valve Steam Deck OLED (Custom AMD Sephiroth 6nm APU)
  - ASUS ROG Ally / ROG Ally X (AMD Ryzen Z1 / Z1 Extreme)
  - Lenovo Legion Go (AMD Ryzen Z1 Extreme, 8.8" 144Hz display)
  - AYANEO, GPD Win, ONEXPLAYER Handhelds
- **Primary Session:** Gamescope Session + Steam Gamepad UI (KDE Plasma Desktop mode accessible).
- **Default Resolution & Refresh Rates:**
  - Steam Deck: $1280 \times 800$ (60Hz / 90Hz).
  - ROG Ally / Legion Go: $1920 \times 1080$ / $2560 \times 1600$ (120Hz / 144Hz with VRR / FreeSync).
- **Driver Stack:** AMD RADV (Mesa Vulkan) with ACO shader compiler.
- **Tuning Profile:** `bobzzite-tweak gaming` (split lock mitigations, low-latency audio quantum, handheld controller glyphs).

---

## 2. Desktop AMD & Intel Tier (`bobzzite`)

- **Target Systems:**
  - Desktop PCs & Laptops with AMD Radeon RX 5000/6000/7000 Series GPUs.
  - Desktop PCs & Laptops with Intel Arc A-Series / Battlemage GPUs or Intel Iris Xe UHD iGPUs.
- **Primary Session:** KDE Plasma 6 (Wayland Session).
- **Driver Stack:** Open-Source Mesa (`radv` and `anv` Vulkan drivers).
- **Tuning Profile:** Standard Desktop / Low-Latency Audio (`bobzzite-audio low-latency`).

---

## 3. High-End NVIDIA Workstation Tier (`bobzzite-nvidia`)

- **Target Systems:**
  - Desktop PCs & Laptops with NVIDIA GeForce RTX 20/30/40 Series and GTX 16 Series GPUs.
- **Primary Session:** KDE Plasma 6 (NVIDIA Wayland / X11 Session).
- **Driver Stack:** NVIDIA Proprietary Drivers (DKMS akmods, NVENC hardware encoder, CUDA/TensorRT compute support).
- **Tuning Profile:** `bobzzite-tweak performance` (NVDEC/NVENC hardware streaming acceleration for Sunshine).
