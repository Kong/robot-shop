#!/bin/sh

NAMESPACE=ratings

kubectl create ns $NAMESPACE

kubectl label namespace $NAMESPACE kuma.io/sidecar-injection=enabled --overwrite

KONG_CLOUD_PULL_USER=$(gcloud secrets versions access 1 --secret="kong-cloud-pull-user")
KONG_CLOUD_PULL_PASS=$(gcloud secrets versions access 2 --secret="kong-cloud-pull-pass")

kubectl create secret -n $NAMESPACE docker-registry dockerhub-user-secret \
--docker-username=$KONG_CLOUD_PULL_USER \
--docker-password=$KONG_CLOUD_PULL_PASS

helm upgrade -i ratings ratings/ -n $NAMESPACE