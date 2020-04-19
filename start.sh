minikube addons enable ingress

kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password

kubectl apply -f k8s-local/ingress-nginx.yaml
kubectl apply -f k8s-local/ingress-service.yaml
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
xdg-open https://"$( minikube ip )"
while true
do
kubectl get deployments
sleep 1
clear
done