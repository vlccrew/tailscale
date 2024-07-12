#!/bin/bash

# requirements
# 1. local docker registry
#     - docker run -d -p 6000:5000 --name local-registry registry:2
# 2. gcloud access to push image to us-certu-app-staging project

export REPO="127.0.0.1:6000/k8s-operator" 
export TAGS="app-staging" 
export PROJECT="us-certu-app-staging"
export REGION="us-central1-docker.pkg.dev"
make publishdevoperator 
docker pull --platform=linux/amd64 127.0.0.1:6000/k8s-operator:$TAGS
docker tag $REPO:$TAGS $REGION/$PROJECT/service/k8s-operator:$TAGS
docker push $REGION/$PROJECT/service/k8s-operator:$TAGS
