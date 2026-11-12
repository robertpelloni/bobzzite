# Bobzzite OS - Hardware Deployment & Compliance Integration Guide (v9.3.0)

This guide describes how `bobzzite-deploy` interfaces with `bobzzite-hardware-audit`, `bobzzite-profile-validate`, `bobzzite-diff`, and `bobzzite-coverage` to provide an end-to-end verified atomic rebase workflow.

---

## 1. Integrated Architecture

Before executing an atomic rebase (`rpm-ostree rebase`), system administrators and automated deployment orchestrators should verify target hardware compatibility:

1. **Hardware Profile Assertion Validation**:
   `bobzzite-deploy profile-validate <flavor>` checks that the target profile meets compositor, audio quantum, and video encoder constraints.
2. **Deep System Hardware Compliance Audit**:
   `bobzzite-deploy profile-audit` executes live system checks across ACPI sleep states, DRM lease availability, Vulkan compute layers, and gamepad input nodes.
3. **Multi-Format Profile Differential Analysis**:
   `bobzzite-deploy profile-compare <flavor1> <flavor2> [terminal|markdown|json]` compares configuration attributes across flavors.
4. **End-to-End Compliance & Coverage Audit**:
   `bobzzite-deploy profile-compliance` runs a complete coverage audit (`bobzzite-coverage`) and prints the multi-flavor parameter matrix (`bobzzite-summary`).
5. **Hardware Fit Analysis**:
   `bobzzite-deploy profile-analyze` assigns a quantitative percentage fit score (100%, 70%, 20%) to determine whether rebasing will provide an optimal user experience.

---

## 2. Usage Examples

```bash
# Generate cross-flavor hardware profile compliance summary matrix
bobzzite-deploy profile-summary

# Run complete hardware matrix coverage audit and summary
bobzzite-deploy profile-compliance

# Compare two profiles in Markdown format
bobzzite-deploy profile-compare bobzzite bobzzite-deck markdown

# Validate hardware profile assertions for handheld target
bobzzite-deploy profile-validate bobzzite-deck

# Execute deep hardware compliance audit
bobzzite-deploy profile-audit

# Rebase to target flavor once verified (e.g. Steam Deck or ARM64)
sudo bobzzite-deploy bobzzite-deck
sudo bobzzite-deploy bobzzite-arm64
```

---

## 3. Control Center Integration

All deployment validation commands are accessible in **Bobzzite Control Center** (`bobzzite-control-center`) under the **🎮 Hardware & Gaming Profiles** panel.
