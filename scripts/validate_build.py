#!/usr/bin/env python3
"""Build validation tool for bobzzite repository."""

import os
import sys

def check_containerfile_copies():
    containerfile = "Containerfile"
    if not os.path.exists(containerfile):
        print(f"FAIL: {containerfile} not found")
        return False

    with open(containerfile, "r") as f:
        content = f.readlines()

    errors = 0
    for idx, line in enumerate(content, 1):
        line = line.strip()
        if line.startswith("COPY"):
            parts = line.split()
            if len(parts) >= 3:
                src = parts[1]
                # Strip any quotes or trailing slashes
                clean_src = src.strip('"\'').rstrip("/")
                if not os.path.exists(clean_src):
                    print(f"FAIL: {containerfile}:{idx} COPY source does not exist: {src}")
                    errors += 1
                else:
                    print(f"PASS: COPY source exists: {src}")

    return errors == 0

def check_scripts():
    scripts_to_check = [
        "config/scripts/build.sh",
        "scripts/post-install.sh",
        "scripts/install-indie-tools.sh",
        "scripts/configure-godot-codium.sh",
        "scripts/bobzzite-control-center.py",
        "scripts/bobzzite-devbox.sh",
        "scripts/bobzzite-onboarding.sh",
        "scripts/bobzzite-mesh.sh",
        "scripts/bobzzite-doctor.sh",
        "scripts/build-flavors.sh",
        "scripts/bobzzite-backup.sh",
        "scripts/build-flatpaks.sh",
        "scripts/bobzzite-tweak.sh",
        "scripts/bobzzite-gamepad.sh",
        "scripts/bobzzite-tray.py",
        "scripts/bobzzite-clean.sh",
        "scripts/bobzzite-bench.sh",
        "scripts/bobzzite-audio.sh",
        "scripts/bobzzite-deploy.sh",
        "scripts/bobzzite-stream.sh",
        "scripts/bobzzite-package.sh",
        "scripts/bobzzite-vr.sh",
        "scripts/bobzzite-assets.sh",
        "scripts/bobzzite-i18n.sh",
        "scripts/bobzzite-test.sh",
        "scripts/bobzzite-export-templates.sh",
        "scripts/bobzzite-hardware-audit.sh",
        "scripts/bobzzite-gdextension.sh",
        "scripts/bobzzite-iso.sh",
        "scripts/bobzzite-webrtc.sh",
        "scripts/bobzzite-profile-validate.sh",
        "scripts/bobzzite-compat.sh",
        "scripts/bobzzite-ci.sh",
        "scripts/bobzzite-quirks.sh",
        "scripts/bobzzite-webdash.py",
        "scripts/bobzzite-sign.sh",
        "scripts/bobzzite-preview.sh",
        "scripts/bobzzite-security.sh",
        "scripts/bobzzite-summary.sh",
        "scripts/bobzzite-report.sh",
        "scripts/bobzzite-provenance.sh",
        "scripts/bobzzite-diff.sh",
        "scripts/bobzzite-migrate.sh",
        "scripts/bobzzite-ipfs.sh",
        "scripts/bobzzite-sandbox.sh",
        "scripts/bobzzite-metrics.sh",
        "scripts/bobzzite-bench-gate.sh",
        "scripts/bobzzite-eye-track.sh",
        "config/files/usr/local/bin/bobzzite-validate"
    ]
    errors = 0
    for script in scripts_to_check:
        if not os.path.exists(script):
            print(f"FAIL: Script not found: {script}")
            errors += 1
            continue

        if not os.access(script, os.X_OK):
            print(f"FAIL: Script is not executable: {script}")
            errors += 1
            continue

        with open(script, "r") as f:
            first_line = f.readline().strip()
            if not first_line.startswith("#!"):
                print(f"FAIL: Script missing shebang: {script}")
                errors += 1
                continue

        print(f"PASS: Script valid and executable: {script}")

    return errors == 0

def check_required_docs():
    required_docs = [
        "VERSION.md",
        "ROADMAP.md",
        "TODO.md",
        "VISION.md",
        "MEMORY.md",
        "DEPLOY.md",
        "IDEAS.md",
        "CHANGELOG.md",
        "HANDOFF.md",
        "README.md",
        "AGENTS.md",
        "docs/USER_GUIDE.md",
        "docs/ISO_BUILD.md",
        "docs/MULTIPLAYER.md",
        "docs/DIAGNOSTICS.md",
        "docs/HARDWARE_FLAVORS.md",
        "docs/BACKUP_ROLLBACK.md",
        "docs/FLATPAK_PACKAGING.md",
        "docs/PERFORMANCE_TUNING.md",
        "docs/CONTROLLER_SUPPORT.md",
        "docs/MAINTENANCE.md",
        "docs/BENCHMARKS.md",
        "docs/AUDIO_SETUP.md",
        "docs/STREAMING.md",
        "docs/BUILD_HEALTH.md",
        "docs/GAME_PACKAGING.md",
        "docs/VR_SETUP.md",
        "docs/HARDWARE_DETECTION.md",
        "docs/HARDWARE_MATRIX_TESTING.md",
        "docs/HARDWARE_MATRIX_PROFILES.md",
        "docs/ASSET_PIPELINE.md",
        "docs/LOCALIZATION.md",
        "docs/AUTOMATED_TESTING.md",
        "docs/HARDWARE_CUSTOMIZATION.md",
        "docs/GODOT_CODIUM_INTEGRATION.md",
        "docs/EXPORT_TEMPLATES.md",
        "docs/HARDWARE_CAPABILITIES.md",
        "docs/QUICK_REFERENCE.md",
        "docs/HARDWARE_COMPLIANCE.md",
        "docs/GDEXTENSION_GUIDE.md",
        "docs/HARDWARE_PROFILES_INTEGRATION.md",
        "docs/HARDWARE_MATRIX_COMPARISON.md",
        "docs/WEBRTC_STREAMING.md",
        "docs/HARDWARE_CONFIG_MATRIX.md",
        "docs/HARDWARE_PROFILE_VALIDATION.md",
        "docs/HARDWARE_PROFILE_ANALYSIS.md",
        "docs/HARDWARE_COMPATIBILITY_MATRIX.md",
        "docs/CONTINUOUS_INTEGRATION.md",
        "docs/MULTI_ARCH_BUILDS.md",
        "docs/WEBRTC_CLIENT_GUIDE.md",
        "docs/HARDWARE_QUIRKS.md",
        "docs/REMOTE_WEB_DASHBOARD.md",
        "docs/IMAGE_SIGNING_VERIFICATION.md",
        "docs/EPHEMERAL_PREVIEW_BUILDS.md",
        "docs/HARDWARE_PROFILES_CATALOG.md",
        "docs/SECURITY_AUDITING.md",
        "docs/HARDWARE_TELEMETRY.md",
        "docs/HARDWARE_PROFILE_SUMMARY.md",
        "docs/HARDWARE_COMPATIBILITY_REPORT.md",
        "docs/NETWORK_TELEMETRY.md",
        "docs/SUPPLY_CHAIN_PROVENANCE.md",
        "docs/HARDWARE_PROFILE_DIFF.md",
        "docs/HARDWARE_MIGRATION_ASSISTANT.md",
        "docs/DECENTRALIZED_MIRRORS.md",
        "docs/ROOTLESS_SANDBOXING.md",
        "docs/PROMETHEUS_METRICS.md",
        "docs/HARDWARE_PROFILE_COMPARISON_DATA.md",
        "docs/BENCHMARK_GATEKEEPER.md",
        "docs/VR_EYE_TRACKING.md"
    ]
    errors = 0
    for doc in required_docs:
        if not os.path.isfile(doc):
            print(f"FAIL: Missing required doc: {doc}")
            errors += 1
        else:
            size = os.path.getsize(doc)
            if size == 0:
                print(f"FAIL: Doc is empty: {doc}")
                errors += 1
            else:
                print(f"PASS: Doc exists ({size} bytes): {doc}")

    return errors == 0

def main():
    print("=== Running bobzzite Build Validation ===")
    cf_ok = check_containerfile_copies()
    scripts_ok = check_scripts()
    docs_ok = check_required_docs()

    if cf_ok and scripts_ok and docs_ok:
        print("\n=== ALL BUILD VALIDATION CHECKS PASSED ===")
        sys.exit(0)
    else:
        print("\n=== BUILD VALIDATION FAILED ===")
        sys.exit(1)

if __name__ == "__main__":
    main()
