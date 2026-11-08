# Bobzzite OS - Prometheus Metrics Exporter Gateway Guide

The `bobzzite-metrics` utility exposes hardware telemetry, operating system performance counters, and runtime flavor identification in standard Prometheus text exposition format (compatible with Prometheus, VictoriaMetrics, and OpenTelemetry collectors).

## Metric Schema

| Metric Name | Type | Description |
| :--- | :--- | :--- |
| `node_load1` | gauge | 1-minute CPU load average |
| `node_load5` | gauge | 5-minute CPU load average |
| `node_load15` | gauge | 15-minute CPU load average |
| `node_memory_MemTotal_bytes` | gauge | Total host memory capacity in bytes |
| `node_memory_MemFree_bytes` | gauge | Free system memory in bytes |
| `node_memory_MemAvailable_bytes` | gauge | Available memory for applications in bytes |
| `node_thermal_zone_temp_celsius` | gauge | Primary thermal zone temperature in Celsius |
| `bobzzite_hardware_flavor` | gauge | Set to 1 with label `flavor="<name>"` |

## Usage

```bash
# Export metrics to stdout in Prometheus text exposition format
bobzzite-metrics export

# Inspect daemon status and sample metrics
bobzzite-metrics status 9100

# Start background Prometheus HTTP scraper on designated port
bobzzite-metrics start 9100
```

## Grafana & Prometheus Scrape Config

Add the following scrape configuration to your `prometheus.yml`:

```yaml
scrape_configs:
  - job_name: 'bobzzite'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100']
```

## Control Center Integration

`bobzzite-metrics` is wired into the **🎮 Hardware & Gaming Profiles** section of the **Bobzzite Control Center** (`bobzzite-control-center`), providing rapid status checks and live metric inspections.
