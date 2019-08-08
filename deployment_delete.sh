#kubectl delete ingress jenkins --namespace jenkins
#kubectl delete secret tls --namespace jenkins
kubectl delete svc  --all --namespace jenkins
kubectl delete deployments  --all --namespace jenkins
kubectl delete ns jenkins

