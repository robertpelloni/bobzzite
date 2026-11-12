# Bobzzite OS - Zero-Trust Kernel Lockdown & Secure Boot Guide

The `bobzzite-lockdown` utility provides automated validation of hardware security primitives, EFI Secure Boot signatures, Linux kernel lockdown modes, and IOMMU Direct Memory Access (DMA) attack mitigations.

## Security Layers

1. **EFI Secure Boot**:
   Asserts that all boot stages (shim, GRUB2, Linux kernel) are signed with recognized trusted keys (Microsoft third-party UEFI CA or enrolled Machine Owner Keys - MOK).
2. **Kernel Lockdown (`lockdown=integrity` / `lockdown=confidentiality`)**:
   - `integrity`: Restricts userspace access to `/dev/mem`, `/dev/kmem`, custom ACPI tables, and unsigned kernel modules to prevent kernel code modification even with root privileges.
   - `confidentiality`: Extends integrity by blocking extraction of confidential kernel memory contents (e.g., encryption keys).
3. **IOMMU DMA Protection**:
   Verifies that PCI devices (such as Thunderbolt, PCIe capture cards, or USB4 peripherals) cannot execute unauthorized direct memory reads/writes via DMA.

## Usage

```bash
# Query active kernel security status
bobzzite-lockdown status

# Run comprehensive deep kernel security audit
bobzzite-lockdown audit

# Inspect recommended ostree boot arguments for enforcing lockdown
bobzzite-lockdown enforce
```

## Control Center Integration

`bobzzite-lockdown` is accessible under the **🛡️ System Updates & Diagnostics** card in **Bobzzite Control Center** (`bobzzite-control-center`), providing rapid status checks and kernel security audits.
