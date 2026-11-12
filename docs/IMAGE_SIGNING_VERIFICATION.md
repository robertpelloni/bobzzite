# Bobzzite OS Cryptographic Image Signing & Verification Guide

## Overview

Bobzzite OS container images published to GitHub Container Registry (`ghcr.io/robertpelloni/*`) are signed using [Cosign](https://github.com/sigstore/cosign) and the Sigstore public good transparency log.

The `bobzzite-sign` utility (`scripts/bobzzite-sign.sh`) verifies the authenticity, origin, and non-tampering of target images before an atomic `rpm-ostree rebase` is executed.

---

## Verification Architecture

1. **Keyless Signing via GitHub Actions OIDC**:
   - Signature workflow initiates via GitHub Actions OIDC token.
   - Fulcio issues short-lived X.509 code signing certificates linked to the official repository.
   - Rekor records transparency log entries for auditable provenance.
2. **Local Client Verification**:
   - Verifies certificate identity matches: `https://github.com/robertpelloni/bobzzite`
   - Verifies issuer matches: `https://token.actions.githubusercontent.com`

---

## CLI Usage

```bash
# Check installed verification tools & OIDC policies
bobzzite-sign check-keys

# Verify image signature for a specific flavor
bobzzite-sign verify bobzzite latest

# Output policy.json configuration
bobzzite-sign policy
```
