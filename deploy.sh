docker build -t arnaudcortisse/multi-client:latest -t arnaudcortisse/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t arnaudcortisse/multi-server:latest -t arnaudcortisse/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t arnaudcortisse/multi-worker:latest -t arnaudcortisse/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push arnaudcortisse/multi-client:latest
docker push arnaudcortisse/multi-server:latest
docker push arnaudcortisse/multi-worker:latest
docker push arnaudcortisse/multi-client:$SHA
docker push arnaudcortisse/multi-server:$SHA
docker push arnaudcortisse/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=arnaudcortisse/multi-server:$SHA
kubectl set image deployments/client-deployment client=arnaudcortisse/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=arnaudcortisse/multi-worker:$SHA