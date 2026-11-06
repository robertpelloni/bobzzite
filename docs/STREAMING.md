# Bobzzite OS Game & Dev Streaming Guide

## Overview

Bobzzite OS integrates low-latency remote display and game streaming capabilities using **Sunshine** (self-hosted game stream server) and **Moonlight** (open-source client).

This enables developers to test games running on high-powered desktop workstations directly on handhelds (Steam Deck, ROG Ally, tablets) or stream their entire developer desktop session across a local network or Tailscale mesh.

---

## Sunshine Streaming Service Management: `bobzzite-stream`

The `bobzzite-stream` tool provides command-line control and status checking for the Sunshine server.

```bash
# Check Sunshine host status and video hardware encoder capabilities
bobzzite-stream status

# Start the Sunshine streaming host
bobzzite-stream start

# Open the Sunshine Web Configuration UI (https://localhost:47990)
bobzzite-stream webui

# Stop the Sunshine streaming host
bobzzite-stream stop
```

---

## Pairing with Moonlight Clients

1. Ensure the Sunshine host is active (`bobzzite-stream start`).
2. Open the Moonlight application on your client device (Steam Deck, iOS, Android, or laptop).
3. The Bobzzite host will appear automatically on the local network (or enter the Tailscale IP via `bobzzite-mesh status`).
4. Click to pair. A 4-digit PIN will be displayed on the client.
5. In your Bobzzite browser, navigate to `https://localhost:47990`, enter the PIN in the Sunshine **PIN** tab, and save.

---

## Hardware Encoder Optimization

Bobzzite OS pre-configures hardware video acceleration for Sunshine across all three hardware flavors:
- **AMD Radeon:** VA-API / AMF hardware encoding.
- **Intel Arc:** QuickSync / VA-API encoding with AV1 / HEVC support.
- **NVIDIA GeForce:** NVENC hardware encoder with zero CPU overhead.
