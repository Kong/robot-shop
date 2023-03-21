#!/bin/sh

helm repo add my-repo https://charts.bitnami.com/bitnami

NAMESPACE=rabbitmq

echo \
"apiVersion: v1
kind: Namespace
metadata:
  name: $NAMESPACE
  annotations:
    kuma.io/sidecar-injection: enabled" | kubectl apply -f -

helm upgrade -i my-release my-repo/rabbitmq --namespace $NAMESPACE