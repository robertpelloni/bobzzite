# bobzzite Live & Offline ISO Generation

This guide explains how to generate bootable installation ISO images for **bobzzite** using Universal Blue's `isogenerator`.

---

## 1. Prerequisites

- A machine with `podman` or `docker` installed.
- Root or rootless container privileges.
- At least 25 GB free disk space.

---

## 2. Generating the ISO via Universal Blue Container

Universal Blue provides an automated containerized tool (`ghcr.io/ublue-os/isogenerator`) to produce standard Fedora Anaconda installer ISOs configured to pull or embed your custom OCI container image.

### Building an Online / Net-Installer ISO

```bash
podman run --rm --privileged \
  --volume ./build:/build \
  ghcr.io/ublue-os/isogenerator:latest \
  --image-repo ghcr.io/robertpelloni \
  --image-name bobzzite \
  --image-tag latest \
  --version 41 \
  --output /build/bobzzite-latest.iso
```

### Building an Offline / Embedded ISO

To embed the entire bobzzite container image directly into the installer ISO (for offline installation without internet access):

```bash
podman run --rm --privileged \
  --volume ./build:/build \
  ghcr.io/ublue-os/isogenerator:latest \
  --image-repo ghcr.io/robertpelloni \
  --image-name bobzzite \
  --image-tag latest \
  --version 41 \
  --offline \
  --output /build/bobzzite-offline-latest.iso
```

---

## 3. Writing the ISO to USB Media

Once the ISO file is generated in the `./build/` directory, flash it to a USB drive using `dd` or tools like BalenaEtcher / Fedora Media Writer:

```bash
# Identify your USB drive (e.g. /dev/sdX)
lsblk

# Flash ISO
sudo dd if=./build/bobzzite-latest.iso of=/dev/sdX bs=4M status=progress conv=fsync
```

---

## 4. Boot & Installation

1. Insert the USB drive into your gaming PC or handheld device.
2. Enter the BIOS / boot selection menu (F12, F11, or Volume Down on Steam Deck).
3. Boot the **bobzzite** installer.
4. Follow the Anaconda installer instructions to partition storage and complete installation.
5. On first boot, launch **Bobzzite Control Center** from the application menu to finalize dev tools and gaming settings.
