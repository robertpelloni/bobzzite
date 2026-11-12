# Bobzzite OS Remote Web Dashboard Guide

## Overview

`bobzzite-webdash` provides a zero-dependency, lightweight web dashboard server written in Python (`http.server`). It exposes a responsive browser interface to monitor hardware telemetry, system memory, CPU load, and trigger diagnostic health checks remotely from any browser on the local network.

---

## Server Endpoints

| Endpoint | Method | Response | Description |
| :--- | :--- | :--- | :--- |
| `/` or `/index.html` | `GET` | `text/html` | Main web dashboard interface |
| `/api/stats` | `GET` | `application/json` | System host telemetry (hostname, CPU cores, load avg, RAM) |
| `/api/diagnostics` | `GET` | `application/json` | Quick system health check results |
| `/api/stop` | `GET` | `text/plain` | Graceful remote server shutdown |

---

## CLI Usage

```bash
# Display configuration status
bobzzite-webdash status

# Start dashboard server on custom port (default: 8080)
BOBZZITE_WEBDASH_PORT=8080 bobzzite-webdash
```

---

## Remote Access & Firewall

To access the dashboard from a phone, tablet, or secondary laptop on your local network:
```bash
# Open port 8080 in firewalld if active
sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
```
Navigate to `http://<machine-ip>:8080` in your web browser.
