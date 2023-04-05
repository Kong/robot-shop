#!/bin/sh

NAMESPACE=mongodb

helm repo add mongodb https://mongodb.github.io/helm-charts

helm repo update

# install operator
helm upgrade --install community-operator mongodb/community-operator --namespace $NAMESPACE --create-namespace

kubectl label namespace mongodb kuma.io/sidecar-injection=enabled --overwrite

kubectl apply -f mongo.yaml --namespace $NAMESPACE