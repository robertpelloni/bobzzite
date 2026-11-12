# Bobzzite OS - Battery Health & Charge Threshold Optimizer Guide

The `bobzzite-battery` utility inspects Linux power supply kernel nodes (`/sys/class/power_supply/`), reports real-time battery status, measures cycle degradation, and configures hardware charge limits to maximize lithium-ion cell longevity on handheld gaming devices (Steam Deck, ROG Ally, Legion Go) and laptops.

## Longevity Problem & Solution

Lithium-ion battery chemistries degrade rapidly when maintained at 100% state of charge (SoC) under high thermal loads (e.g., intensive Godot 4 baking, shader compilation, or AAA gaming on docked handhelds).

By setting a charging limit threshold (such as `80%`), voltage stress on cathode materials is reduced by over `4x`, effectively doubling the operational lifespan of the internal battery pack.

## Usage

```bash
# Query active power supply status and current charge level
bobzzite-battery status

# Calculate energy retention compared to original design capacity
bobzzite-battery health

# Set charging threshold limit to 80% (or custom percentage)
bobzzite-battery limit 80
```

## Control Center Integration

`bobzzite-battery` is accessible under the **🎮 Hardware & Gaming Profiles** card in **Bobzzite Control Center** (`bobzzite-control-center`), providing one-click battery longevity optimization.
