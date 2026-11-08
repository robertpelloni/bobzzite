# Bobzzite OS Supply Chain Provenance & SBOM Guide

## Overview

Bobzzite OS generates cryptographically verifiable Software Bill of Materials (SBOM) and in-toto SLSA Level 3 provenance attestations (`bobzzite-provenance`) for all distributed container images.

---

## Standards & Formats

1. **SPDX 2.3 JSON**:
   - Comprehensive inventory of base layer packages, licenses, and download locations.
2. **in-toto SLSA Provenance**:
   - Cryptographic attestations documenting the GitHub Actions runner identity, git commit SHA digest, and build invocation entry points.

---

## CLI Usage

```bash
# Display provenance capabilities
bobzzite-provenance status

# Generate SPDX SBOM for a flavor
bobzzite-provenance sbom bobzzite-deck

# Generate in-toto SLSA provenance predicate
bobzzite-provenance attest bobzzite-deck

# Run full supply-chain verification
bobzzite-provenance verify bobzzite
```
Outputs are written to `/tmp/bobzzite-provenance/`.
