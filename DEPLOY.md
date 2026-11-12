# Bobzzite OS - Deployment and Rebase Guide

Bobzzite OS is delivered as atomic OCI container images layered on Fedora Silverblue via Universal Blue (`bazzite`). Updates and hardware profile switches are handled safely and atomically using `rpm-ostree`.

## Hardware Flavors

- **`bobzzite`**: Standard desktop workstation profile optimized for AMD Radeon and Intel Graphics GPUs running KDE Plasma Wayland.
- **`bobzzite-deck`**: Handheld gaming console profile configured for Steam Deck, ROG Ally, and Lenovo Legion Go with embedded Gamescope sessions and handheld-daemon power management.
- **`bobzzite-nvidia`**: High-performance workstation profile pre-loaded with open-kernel NVIDIA GPU drivers, CUDA compute toolkit, OptiX denoiser, and NVENC hardware video encoding.
- **`bobzzite-arm64`**: ARM64 profile optimized for mobile SBCs and Snapdragon X Elite laptops with Panfrost and Freedreno open GPU drivers.

---

## The Complete Pre-Deployment & Rebase Pipeline

The `bobzzite-deploy` utility orchestrates the entire deployment lifecycle, ensuring system compatibility and profile compliance before modifying ostree state:

```
[1. Hardware Detection]    -->   bobzzite-deploy detect
[2. Fit Analysis]          -->   bobzzite-deploy profile-analyze
[3. Target Inspection]     -->   bobzzite-deploy profile-inspect <flavor>
[4. Side-by-Side Diff]     -->   bobzzite-deploy profile-compare <current> <target>
[5. Compliance Audit]      -->   bobzzite-deploy profile-audit
[6. Profile Assertions]    -->   bobzzite-deploy profile-validate <flavor>
[7. Compliance Summary]    -->   bobzzite-deploy profile-summary
[8. Atomic Rebase]         -->   sudo bobzzite-deploy <flavor>
```

---

## Command Reference

### 1. Automatic Hardware Detection
Probes DMI product strings, vendor IDs, and PCI graphics devices to recommend the optimal flavor:
```bash
bobzzite-deploy detect
```

### 2. Deep Hardware Profile Analysis
Calculates quantitative fit percentages and evaluates host hardware compatibility:
```bash
bobzzite-deploy profile-analyze
```

### 3. Target Profile Inspection
Queries the version-controlled JSON specification for a target flavor:
```bash
bobzzite-deploy profile-inspect bobzzite-deck
```

### 4. Differential Comparison
Compares architectural attributes, compositors, driver stacks, and audio quantum buffers:
```bash
bobzzite-deploy profile-compare bobzzite bobzzite-deck
```

### 5. Hardware Compliance Audit
Audits ACPI sleep states, Wayland DRM display leasing, Vulkan compute layers, and input device permissions:
```bash
bobzzite-deploy profile-audit
```

### 6. Profile Assertion Validation
Asserts that the target configuration satisfies all required compositor and audio buffer constraints:
```bash
bobzzite-deploy profile-validate bobzzite-deck
```

### 7. Cross-Flavor Compliance & Coverage Matrix
Generates the comprehensive cross-flavor matrix asserting compositor, encoder, and buffer parameters:
```bash
bobzzite-deploy profile-summary
bobzzite-deploy profile-compliance
```

### 8. Atomic Rebase Execution
Executes the atomic ostree rebase against the target container image:
```bash
# Rebase from remote GitHub Container Registry (GHCR) for handheld or ARM64
sudo bobzzite-deploy bobzzite-deck
sudo bobzzite-deploy bobzzite-arm64

# Or rebase from local offline OCI archive
sudo bobzzite-deploy bobzzite-deck oci-archive
```

---

## Rollback & Snapshot Recovery

If a newly deployed image encounters unforeseen hardware regressions, the system can be rolled back instantly without data loss:

```bash
# Check staged and previous deployment refs
rpm-ostree status

# Roll back to previous deployment
sudo rpm-ostree rollback

# Pin a known good deployment
sudo ostree admin pin 0
```
