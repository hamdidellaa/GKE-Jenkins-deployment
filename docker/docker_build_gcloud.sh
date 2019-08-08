#!/bin/bash

PROJECT_ID=`gcloud config get-value project`
echo "Project ID is $PROJECT_ID \n"

echo "Building image from Dockerfile \n"
docker build -t jenkins-image .

echo "\nTag the image with Registry name \n"
docker tag jenkins-image gcr.io/$PROJECT_ID/jenkins:latest

echo "\nPush the Docker image to the Container Registry \n"
docker push gcr.io/$PROJECT_ID/jenkins:latest

echo "\nFinished."
echo "Removing unwanted images\n"
docker rmi jenkins jenkins-image

echo "Currently available images on local machine\n"
docker images

echo "\nTo pull the image from Container Registry onto your local machine, run the following command\n"
echo "docker pull gcr.io/$PROJECT_ID/jenkins:latest \n"
