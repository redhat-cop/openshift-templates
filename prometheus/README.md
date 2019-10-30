# Prometheus

This directory contains templates relating to Prometheus and other metrics/monitoring tooling

## General

- [Prometheus.yml](prometheus.yml) - A template that can be used to deploy a single instance of Prometheus

## Openshift 4
In OCP 4.X -- a monitoring stack is deployed by default in the `openshift-monitoring` namespace for cluster monitoring only. The following can be used to configure different settings for this monitoring stack:

- [Ephemeral Cluster Monitoring](ephemeral-cluster-monitoring.yml) - Configures the monitoring stack so that it doesn't persist metrics after a restart. Allows you to set a retention period for metrics in Prometheus.
- [Persistent Cluster Monitoring.yml](persistent-cluster-monitoring.yml) - Configures the monitoring stack so that you are able to persist data for Prometheus and Alertmanager throughout restarts. Allows you to set a retention period for metrics in Prometheus.
