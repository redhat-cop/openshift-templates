
# Deploys the Prometheus using template

### REQUIRED ARGUMENTS -- Need more details


**1. NAMESPACE: Use to override the default namespace created under project**
- More description are needed

**2. RECORD_RULES: Point to record.rules as Secret object**
- Help Documentation: <https://prometheus.io/docs/prometheus/latest/configuration/recording_rules>

**3. PROM_CONFIG: Point to prometheus.yml as Secret object**
- Example: <https://github.com/prometheus/prometheus/blob/master/documentation/examples/prometheus.yml>

**4. ALERT_CONFIG: Point to alertmanager.yml as Secret object**
- Help Documentation: <https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules>

