# Bobzzite OS Ephemeral PR Preview & Staging Guide

## Overview

Bobzzite OS supports ephemeral container preview images (`pr-<num>-<sha>`) built automatically for pull requests and feature branches. This allows QA playtesters and developers to rebase physical hardware to review branches without waiting for stable releases or impacting their stable deployment.

---

## Preview Tagging Schema

```
ghcr.io/robertpelloni/<flavor>:pr-<PR_NUMBER>-<COMMIT_SHA>
```

Example:
`ghcr.io/robertpelloni/bobzzite:pr-42-a1b2c3d`

---

## CLI Usage

```bash
# Generate preview image tag syntax
bobzzite-preview tag 42 a1b2c3d

# Validate preview build arguments
bobzzite-preview test 42 a1b2c3d

# Print safe rebase command for testers
bobzzite-preview rebase-cmd 42
```

---

## Testing & Rolling Back

1. **Rebase to Ephemeral PR Image:**
   ```bash
   sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/robertpelloni/bobzzite:pr-42-a1b2c3d
   systemctl reboot
   ```

2. **Rollback to Previous Stable Deployment:**
   ```bash
   sudo rpm-ostree rollback
   systemctl reboot
   ```
