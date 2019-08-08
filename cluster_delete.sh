#!/bin/bash

echo "Clusters Available"
gcloud container clusters list

echo "Please provide following details to delete Kubernetes cluster"

read -p "Enter Compute Engine zone (default us-east1-b): " z_name
z_name=${z_name:-us-east1-b}
gcloud config set compute/zone $z_name

read -p "Enter Kubernetes Cluster name which you want to delete: " k8_name
gcloud container clusters delete $k8_name

echo "Available networks"
gcloud compute networks list

read -p "Enter Compute Engine network which you want to delete: " net_name
gcloud compute networks delete $net_name


