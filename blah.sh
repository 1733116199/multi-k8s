kubectl delete -f k8s       
kubectl apply -f k8s/ingress-service.yaml
kubectl apply -f k8s/redis-cluster-ip-service.yaml
kubectl apply -f k8s/redis-deployment.yaml
kubectl apply -f k8s/database-persistent-volume-claim.yaml  
kubectl apply -f k8s/postgres-cluster-ip-service.yaml       
kubectl apply -f k8s/postgres-deployment.yaml
sleep 10
kubectl apply -f k8s/worker-deployment.yaml
kubectl apply -f k8s/client-cluster-ip-service.yaml         
kubectl apply -f k8s/client-deployment.yaml
kubectl apply -f k8s/server-cluster-ip-service.yaml                    
kubectl apply -f k8s/server-deployment.yaml
minikube ip