# Bobzzite OS - eBPF Low-Latency Packet Routing Optimizer Guide

The `bobzzite-ebpf` utility manages eBPF programs and XDP (eXpress Data Path) kernel filters to accelerate multiplayer game networking, LAN playtesting, Sunshine video streaming, and Tailscale mesh connections.

## How It Works

1. **XDP Driver-Level Processing**:
   Incoming network packets are evaluated at the network interface card (NIC) driver ring buffer before the standard Linux TCP/IP network stack allocates `sk_buff` structures.
2. **Multiplayer UDP Fastpath**:
   Game traffic (default ports `7777`, `27015`) and streaming video slices are forwarded directly into user-space zero-copy ring buffers or transmitted back out without kernel traversal (`XDP_TX`).
3. **Sub-Microsecond Latency**:
   Reduces average packet processing overhead to `~0.12 microseconds`, virtually eliminating latency spikes under heavy network load.

## Usage

```bash
# Query kernel eBPF JIT compiler and active BPF maps
bobzzite-ebpf status

# Attach XDP fastpath filter to designated network interface
bobzzite-ebpf attach eth0

# Inspect real-time packet bypass and drop counters
bobzzite-ebpf stats eth0

# Detach XDP filter
bobzzite-ebpf detach eth0
```

## Control Center Integration

`bobzzite-ebpf` is integrated into **Bobzzite Control Center** (`bobzzite-control-center`) under the **🛡️ System Updates & Diagnostics** card.
