# Bobzzite OS - Hardware Matrix Coverage Audit Guide (v9.1.0)

The `bobzzite-coverage` utility validates that all supported hardware form factors and architecture targets possess end-to-end support across specification catalogs, OS container images, build matrices, and technical documentation.

---

## 1. Audit Criteria

For each target flavor (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`, `bobzzite-arm64`), the auditor verifies:

1. **Repository Profile Specification**:
   Existence of valid JSON specification in `hardware_profiles/<flavor>.json`.
2. **System Image Offline Catalog**:
   Presence of embedded profile JSON in `config/files/usr/share/bobzzite/hardware_profiles/<flavor>.json`.
3. **Build Engine Integration**:
   Active integration in `scripts/build-flavors.sh` and `.github/workflows/build.yml`.
4. **Hardware Driver & Subsystem Assertions**:
   Compliance with display leasing, low-latency PipeWire buffers, GPU video encoders, dynamic PRIME offloading, Vulkan ray tracing, adaptive fan curves, Gamescope HDR luminance mapping, and 6-axis gyro drift calibration.

---

## 2. Multi-Flavor Coverage & Certification Matrix

| Flavor Target | Profile Spec | Image Embedded | Build Matrix Target | Driver & Compositor Stack | Coverage Status |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **`bobzzite`** | `hardware_profiles/bobzzite.json` | `/usr/share/bobzzite/hardware_profiles/bobzzite.json` | `linux/amd64` (Bazzite Base) | Mesa RADV/ANV + KWin Wayland + DRI PRIME | **100% Certified** |
| **`bobzzite-deck`** | `hardware_profiles/bobzzite-deck.json` | `/usr/share/bobzzite/hardware_profiles/bobzzite-deck.json` | `linux/amd64` (Bazzite Deck) | RADV ACO + Gamescope UI + 6-Axis Gyro | **100% Certified** |
| **`bobzzite-nvidia`**| `hardware_profiles/bobzzite-nvidia.json`| `/usr/share/bobzzite/hardware_profiles/bobzzite-nvidia.json`| `linux/amd64` (Bazzite NVIDIA)| NVIDIA 565+ + NVENC + PRIME Offload | **100% Certified** |
| **`bobzzite-arm64`** | `hardware_profiles/bobzzite-arm64.json` | `/usr/share/bobzzite/hardware_profiles/bobzzite-arm64.json` | `linux/arm64` (Multi-Arch Base) | Panfrost/Turnip + KWin Wayland + V4L2M2M | **100% Certified** |

---

## 3. Command Line Interface

```bash
# Run complete hardware matrix coverage audit in terminal
bobzzite-coverage audit

# Output Markdown report table for release documentation
bobzzite-coverage report

# Programmatically verify coverage completeness in CI
if command -v bobzzite-coverage >/dev/null 2>&1; then
    bobzzite-coverage audit
elif [ -f scripts/bobzzite-coverage.sh ]; then
    ./scripts/bobzzite-coverage.sh audit
fi
```

---

## 4. Control Center Integration

`bobzzite-coverage` is accessible under the **🎮 Hardware & Gaming Profiles** card in **Bobzzite Control Center** (`bobzzite-control-center`), providing one-click validation of repository and hardware target readiness.
