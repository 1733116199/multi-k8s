docker build -t 1733116199/multi-client:latest -t 1733116199/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t 1733116199/multi-server:latest -t 1733116199/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t 1733116199/multi-worker:latest -t 1733116199/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push 1733116199/multi-client:latest
docker push 1733116199/multi-server:latest
docker push 1733116199/multi-worker:latest
docker push 1733116199/multi-client:$SHA
docker push 1733116199/multi-server:$SHA
docker push 1733116199/multi-worker:$SHA


kubectl apply -f k8s
kubectl set image deployments/server-deployment server=1733116199/multi-server:$SHA
kubectl set image deployments/client-deployment client=1733116199/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=1733116199/multi-worker:$SHA





# kubectl delete -f k8s       
# kubectl apply -f k8s/ingress-service.yaml
# kubectl apply -f k8s/redis-cluster-ip-service.yaml
# kubectl apply -f k8s/redis-deployment.yaml
# kubectl apply -f k8s/database-persistent-volume-claim.yaml  
# kubectl apply -f k8s/postgres-cluster-ip-service.yaml       
# kubectl apply -f k8s/postgres-deployment.yaml
# sleep 10
# kubectl apply -f k8s/worker-deployment.yaml
# kubectl apply -f k8s/client-cluster-ip-service.yaml         
# kubectl apply -f k8s/client-deployment.yaml
# kubectl apply -f k8s/server-cluster-ip-service.yaml                    
# kubectl apply -f k8s/server-deployment.yaml