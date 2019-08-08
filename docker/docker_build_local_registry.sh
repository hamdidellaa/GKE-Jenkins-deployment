#!/bin/bash

echo "\n"
echo "Deploying local registry. If registry already deployed, this step will fail"
docker run -d -p 5000:5000 --restart always --name registry registry:2

echo "\n"
echo "Build docker image from Dockerfile"
docker build -t jenkins-image .

echo "\n"
echo "Tag docker image to local registry"
docker tag jenkins-image localhost:5000/jenkins-image

echo "\n"
echo "Push docker image to local registry"
docker push localhost:5000/jenkins-image

echo"\n"
echo "Finished. Check available images using 'docker images' command.\n"
