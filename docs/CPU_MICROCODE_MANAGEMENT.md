# Bobzzite OS CPU Microcode & Hardware Mitigation Management

## Overview

The `bobzzite-microcode` utility provides automated CPU microcode inspection and hardware vulnerability mitigation auditing across Intel, AMD, and ARM64 processor architectures. In immutable container-based systems like Bobzzite OS, early microcode updates are loaded into the CPU prior to kernel initialization via the initramfs (`dracut`), neutralizing speculative execution vulnerabilities (Spectre, Meltdown, Retbleed, Downfall, Zenbleed) without risking runtime instability.

---

## Architecture & Early-Loading Lifecycle

1. **BIOS / UEFI Firmware Microcode**: The motherboard firmware initializes the CPU with base microcode patch levels.
2. **Early Initramfs Hand-Off**: As the Linux kernel boots, the bootloader (systemd-boot or GRUB) presents the initial RAM filesystem containing Intel (`/kernel/x86/microcode/GenuineIntel.bin`) or AMD (`/kernel/x86/microcode/AuthenticAMD.bin`) early microcode capsules.
3. **Kernel CPU Core Application**: The kernel updates CPU model-specific registers (MSRs) before loading device drivers or user-space applications.
4. **Sysfs Vulnerability State**: Mitigation vectors are exposed dynamically by the kernel under `/sys/devices/system/cpu/vulnerabilities/`.

---

## CLI Usage

```bash
# Display CPU vendor, active microcode revision, and dracut status
bobzzite-microcode status

# Run comprehensive hardware vulnerability audit across all sysfs vectors
bobzzite-microcode audit
```

---

## Audited Vulnerability Vectors

The audit inspects the status of kernel mitigations including:
- **`gather_data_sampling`**: Downfall mitigation status
- **`itlb_multihit`**: Instruction TLB multi-hit page size protections
- **`l1tf`**: Foreshadow / L1 Terminal Fault PTE inversion
- **`mds`**: Microarchitectural Data Sampling buffer clearing
- **`meltdown`**: Kernel Page Table Isolation (KPTI)
- **`retbleed`**: Indirect Branch Restricted Speculation (IBRS)
- **`spectre_v1` / `spectre_v2`**: Usercopy barriers and indirect branch predictors
- **`srbds`**: Special Register Buffer Data Sampling
