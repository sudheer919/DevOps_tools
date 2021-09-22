#Examples
'''
- node_systemd_unit_state{job="prometheus-node",name="sshd.service"}
'''
#Prometheus Functions 
#Reference
```
https://prometheus.io/docs/prometheus/latest/querying/functions/
```

Functions
```
rate()
rate(v range-vector) calculates the per-second average rate of increase of the time series in the range vector.
example:
    rate(node_cpu_seconds_total[5m])
    rate(node_cpu_seconds_total[5m])*100
    100-(rate(node_cpu_seconds_total[5m])*100)
    100-(rate(node_cpu_seconds_total{mode="idle"}[5m])*100)

```

``` 
ceil()
ceil(v instant-vector) rounds the sample values of all elements in v up to the nearest integer.
example :
    ceil(100-(rate(node_cpu_seconds_total{mode="idle"}[5m])*100))
```


```
floor()
floor(v instant-vector) rounds the sample values of all elements in v down to the nearest integer.
example :
    floor(100-(rate(node_cpu_seconds_total{mode="idle"}[5m])*100))
```