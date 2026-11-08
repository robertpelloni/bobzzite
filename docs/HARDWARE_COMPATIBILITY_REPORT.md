# Bobzzite OS Hardware Compatibility Report Guide

## Overview

The `bobzzite-report` utility (`scripts/bobzzite-report.sh`) compiles an end-to-end hardware compatibility audit of the current machine. It combines CPU instruction set checks, GPU rendering capabilities, audio latency configurations, and active device quirk status into an exportable report.

---

## Report Sections

1. **System Hardware Identification**:
   - DMI product model, physical CPU core count, and RAM capacity.
2. **Graphics & Acceleration Pipeline**:
   - Direct Rendering Manager node (`/dev/dri/renderD128`) presence and VA-API/NVENC status.
3. **Audio & Controller Latency**:
   - PipeWire pro-audio buffers and connected gamepad event nodes.
4. **Assessment & Recommendation**:
   - System compatibility tier (Tier 1/2/3) and optimal target flavor recommendation.

---

## CLI Usage

```bash
# Print summary overview in terminal
bobzzite-report summary

# Export detailed Markdown report to /tmp/bobzzite-hardware-report.md
bobzzite-report markdown

# Output JSON diagnostic summary
bobzzite-report json
```
