# Bobzzite OS - Hardware Matrix Coverage Audit Guide

The `bobzzite-coverage` utility validates that all supported hardware form factors and architecture targets possess end-to-end support across specification catalogs, OS container images, build matrices, and technical documentation.

## Audit Criteria

For each target flavor (`bobzzite`, `bobzzite-deck`, `bobzzite-nvidia`, `bobzzite-arm64`), the auditor verifies:

1. **Repository Profile Specification**:
   Existence of valid JSON specification in `hardware_profiles/<flavor>.json`.
2. **System Image Offline Catalog**:
   Presence of embedded profile JSON in `config/files/usr/share/bobzzite/hardware_profiles/<flavor>.json`.
3. **Build Engine Integration**:
   Active integration in `scripts/build-flavors.sh` and `.github/workflows/build.yml`.
4. **Hardware Driver & Compositor Assertions**:
   Compliance with display leasing, low-latency PipeWire buffers, and GPU video encoders.

## Usage

```bash
# Run complete hardware matrix coverage audit in terminal
bobzzite-coverage audit

# Output Markdown report table for release documentation
bobzzite-coverage report
```

## Control Center Integration

`bobzzite-coverage` is accessible under the **🎮 Hardware & Gaming Profiles** card in **Bobzzite Control Center** (`bobzzite-control-center`), providing one-click validation of repository and hardware target readiness.
