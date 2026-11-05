# bobzzite Hardware Flavors & Target Matrix

bobzzite targets three primary hardware tiers through layered OCI container images:

---

## 1. Flavor Matrix

| Flavor | Base Upstream | Target Hardware | Included Features |
|---|---|---|---|
| **`bobzzite`** | `bazzite:latest` | Desktop & Laptop AMD Radeon, Intel Arc / Iris Xe | Open-source Mesa Vulkan drivers, GameMode, Proton GE |
| **`bobzzite-deck`** | `bazzite-deck:latest` | Valve Steam Deck (LCD/OLED), ASUS ROG Ally, Lenovo Legion Go, GPD Win | Gamescope session compositor, Decky Loader plugins, TDP/fan controls |
| **`bobzzite-nvidia`** | `bazzite-nvidia:latest` | Desktop & Laptop NVIDIA GeForce RTX / GTX | Proprietary NVIDIA driver stack, NVENC hardware encoding, CUDA support |

---

## 2. Building Flavors Locally

Use the automated flavor build script:

```bash
# Build desktop AMD/Intel flavor
scripts/build-flavors.sh bobzzite

# Build handheld Deck / Ally flavor
scripts/build-flavors.sh bobzzite-deck

# Build NVIDIA GeForce flavor
scripts/build-flavors.sh bobzzite-nvidia

# Build all flavors sequentially
scripts/build-flavors.sh all
```

---

## 3. Rebasing to Specific Flavors

### Standard AMD / Intel Desktop
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:latest
systemctl reboot
```

### Handheld Steam Deck / ROG Ally
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite-deck:latest
systemctl reboot
```

### NVIDIA GeForce
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite-nvidia:latest
systemctl reboot
```
