#!/bin/sh

NAMESPACE=redis

echo \
"apiVersion: v1
kind: Namespace
metadata:
  name: $NAMESPACE
  labels:
    kuma.io/sidecar-injection: enabled" | kubectl apply -f -

kubectl apply -f redis.yaml -n $NAMESPACE