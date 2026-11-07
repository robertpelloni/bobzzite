# Bobzzite OS Hardware Matrix Verification & Testing Guide

## Overview

Bobzzite OS generates three specialized operating system image flavors targeting distinct hardware environments:
1. `bobzzite`: Desktop & Laptop AMD Radeon and Intel Arc / UHD graphics.
2. `bobzzite-deck`: Valve Steam Deck (LCD/OLED), ASUS ROG Ally, Lenovo Legion Go, and other handheld PCs.
3. `bobzzite-nvidia`: Desktop and Laptop NVIDIA GeForce RTX / GTX GPUs utilizing proprietary drivers.

To ensure consistency, build stability, and dependency compatibility across all three flavors, the `scripts/build-flavors.sh` engine provides automated matrix testing (`test-matrix`).

---

## Matrix Verification: `scripts/build-flavors.sh all test-matrix`

Run the matrix test suite directly from the terminal or trigger it via the **Bobzzite Control Center**:

```bash
# Execute multi-flavor matrix test suite
./scripts/build-flavors.sh all test-matrix
```

### Verification Checks

1. **Multi-Stage Build Argument Resolution:**
   - Validates that `BASE_IMAGE`, `IMAGE_NAME`, and `IMAGE_VERSION` resolve cleanly before and within the `FROM ${BASE_IMAGE}` stage in `Containerfile`.
2. **Upstream Base Registry Accessibility:**
   - Probes GHCR upstream repositories (`ghcr.io/ublue-os/bazzite`, `ghcr.io/ublue-os/bazzite-deck`, `ghcr.io/ublue-os/bazzite-nvidia`) to ensure base image digests and metadata are reachable.
3. **Containerfile Context Integrity:**
   - Confirms all `COPY` directives (`config/files/`, `branding/wallpapers/`, `branding/icons/`, `branding/plymouth/`, `branding/sddm/`, `branding/sounds/`, `config/scripts/`) match repository contents.

---

## Continuous Integration Matrix Testing

GitHub Actions runs parallel matrix builds in `.github/workflows/build.yml` across all three hardware targets. Every pull request and release build executes `scripts/validate_build.py` prior to compilation to guarantee zero regression across target architectures.
