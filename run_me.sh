#!/bin/bash

export REPO="127.0.0.1:6000/k8s-operator" 
export TAGS="tidb-staging-0" 
export PROJECT="us-certu-app-staging"
export REGION="us-central1-docker.pkg.dev"
make publishdevoperator 
docker pull --platform=linux/amd64 127.0.0.1:6000/k8s-operator:$TAGS
docker tag $REPO:$TAGS $REGION/$PROJECT/service/k8s-operator:$TAGS
docker push $REGION/$PROJECT/service/k8s-operator:$TAGS
