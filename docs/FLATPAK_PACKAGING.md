# bobzzite Flatpak Packaging & Distribution Guide

bobzzite packages custom bob-ecosystem applications into isolated, sandbox-compliant Flatpak bundles.

---

## 1. Packaged Applications

- **`com.robertpelloni.bobzilla`**: Web browser optimized for bob ecosystem hubs and documentation.
- **`com.robertpelloni.bobfilez`**: Decentralized project and asset manager for game creators.

Manifests are stored in `packages/flatpak/`.

---

## 2. Building Flatpaks Locally

To build and export applications using `flatpak-builder`:

```bash
# Build bobzilla
scripts/build-flatpaks.sh bobzilla

# Build bobfilez
scripts/build-flatpaks.sh bobfilez

# Build all applications
scripts/build-flatpaks.sh all
```

---

## 3. Testing Local Flatpak Bundles

```bash
flatpak-builder --run build-dir packages/flatpak/com.robertpelloni.bobzilla.yml bobzilla
```
