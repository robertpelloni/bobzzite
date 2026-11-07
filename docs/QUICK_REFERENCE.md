# Bobzzite OS Command-Line & Utility Quick Reference Cheatsheet

## System Dashboard & Desktop Utilities

| Command | Description | Associated Documentation |
|---|---|---|
| `bobzzite-control-center` | Launch unified single-window management GUI | [`docs/USER_GUIDE.md`](USER_GUIDE.md) |
| `bobzzite-tray` | Launch system tray monitor applet | [`docs/USER_GUIDE.md`](USER_GUIDE.md) |
| `bobzzite-doctor` | Comprehensive system health and dependency check | [`docs/DIAGNOSTICS.md`](DIAGNOSTICS.md) |
| `bobzzite-validate` | Validate repository build integrity and documentation | [`docs/BUILD_HEALTH.md`](BUILD_HEALTH.md) |
| `bobzzite-clean` | Safely purge unused Flatpaks and temporary caches | [`docs/MAINTENANCE.md`](MAINTENANCE.md) |
| `bobzzite-bench` | Run CPU throughput, storage I/O, and GPU benchmarks | [`docs/BENCHMARKS.md`](BENCHMARKS.md) |

---

## Game Development & Tooling

| Command | Description | Associated Documentation |
|---|---|---|
| `install-indie-tools.sh` | Install Godot 4, VS Codium, GIMP, Audacity, OBS via Flatpak | [`docs/USER_GUIDE.md`](USER_GUIDE.md) |
| `configure-godot-codium.sh` | Configure bidirectional Godot 4 LSP (:6005) and DAP (:6006) | [`docs/GODOT_CODIUM_INTEGRATION.md`](GODOT_CODIUM_INTEGRATION.md) |
| `bobzzite-package` | Headless game export and release binary bundler | [`docs/GAME_PACKAGING.md`](GAME_PACKAGING.md) |
| `bobzzite-assets` | Game asset texture optimization and audio transcoding | [`docs/ASSET_PIPELINE.md`](ASSET_PIPELINE.md) |
| `bobzzite-i18n` | Localization table extraction, templating, and gettext compilation | [`docs/LOCALIZATION.md`](LOCALIZATION.md) |
| `bobzzite-test` | Headless GDScript syntax validator and unit test runner | [`docs/AUTOMATED_TESTING.md`](AUTOMATED_TESTING.md) |
| `bobzzite-export-templates` | Build custom size-optimized Godot 4 export templates | [`docs/EXPORT_TEMPLATES.md`](EXPORT_TEMPLATES.md) |

---

## Hardware, Networking & Multimedia

| Command | Description | Associated Documentation |
|---|---|---|
| `bobzzite-deploy` | Automatic hardware flavor detection and atomic rebasing | [`docs/HARDWARE_DETECTION.md`](HARDWARE_DETECTION.md) |
| `bobzzite-build-flavors` | Multi-flavor image build engine and architecture profiler | [`docs/HARDWARE_FLAVORS.md`](HARDWARE_FLAVORS.md) |
| `bobzzite-tweak` | Low-latency sysctl tuning, GameMode, and audio profiles | [`docs/PERFORMANCE_TUNING.md`](PERFORMANCE_TUNING.md) |
| `bobzzite-gamepad` | Gamepad detection, axis testing, and handheld mapping | [`docs/CONTROLLER_SUPPORT.md`](CONTROLLER_SUPPORT.md) |
| `bobzzite-audio` | PipeWire audio diagnostics and quantum buffer switching | [`docs/AUDIO_SETUP.md`](AUDIO_SETUP.md) |
| `bobzzite-stream` | Sunshine game stream host and Moonlight client manager | [`docs/STREAMING.md`](STREAMING.md) |
| `bobzzite-vr` | VR/XR headset detection, DRM display leasing, and OpenXR | [`docs/VR_SETUP.md`](VR_SETUP.md) |
| `bobzzite-mesh` | Tailscale P2P mesh networking and Syncthing asset sync | [`docs/MULTIPLAYER.md`](MULTIPLAYER.md) |
| `bobzzite-devbox` | Zero-configuration Arch and Ubuntu Distrobox containers | [`docs/USER_GUIDE.md`](USER_GUIDE.md) |
| `bobzzite-backup` | OSTree deployment pinning, atomic rollback, and snapshots | [`docs/BACKUP_ROLLBACK.md`](BACKUP_ROLLBACK.md) |
