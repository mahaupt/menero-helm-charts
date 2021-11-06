# Menero Helm Chart
To deploy menero execute:
```shell
helm repo add menero http://ehaupt.de/menero-helm-charts/ 
helm upgrade --install menero menero/menero-helm-chart --namespace=menero --create-namespace
```