#!/bin/bash
# Setting font

bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}Creating a Kubernetes namespace for Jenkins. If already exists, this step will fail.${normal}"
kubectl create ns jenkins

echo "${bold}Creating the Jenkins deployment and services${normal}"
kubectl apply -f k8s/jenkins.yaml
kubectl apply -f k8s/service_jenkins.yaml

echo "${bold}List the Jenkins Deployment.${normal}"
kubectl get deployment --namespace jenkins

echo "${bold}List the Jenkins services.${normal}"
kubectl get svc --namespace jenkins

echo "${bold}List the Jenkins pods.${normal}"
kubectl get pods --namespace jenkins

## Uncomment below lines to create Ingress service to access the Jenkins

##echo "${bold}Creating a temporary SSL certificate and key pair.${normal}"
##openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=jenkins-/O=jenkins"

##echo "${bold}Upload the certificate to Kubernetes as a secret object.${normal}"
##kubectl create secret generic tls --from-file=/tmp/tls.crt --from-file=/tmp/tls.key --namespace jenkins

##echo "${bold}Creating the load balancer${normal}"
##kubectl apply -f k8s/ingress.yaml

##echo "${bold}Check the status of the load balancer’s health checks.${normal}"
##kubectl describe ingress jenkins --namespace jenkins

##echo "${bold}It can take several minutes for the load balancer to be provisioned and for the health checks to complete.${normal}"
##echo "Execute ${bold}kubectl describe ingress jenkins --namespace jenkins${normal} until you see the backends field display HEALTHY."
##echo "From the same output, copy the IP ADDRESS value of the ${bold}Address${normal} field. This is the IP address you’ll use to connect to Jenkins."
