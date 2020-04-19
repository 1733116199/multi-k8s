kubectl delete -f k8s
kubectl delete -f k8s-local/ingress-nginx.yaml
kubectl delete -f k8s-local/ingress-service.yaml
kubectl delete secret pgpassword