#!/bin/sh

helm repo add mysql-operator https://mysql.github.io/mysql-operator/

helm repo update

NAMESPACE=mysql-operator

helm install my-mysql-operator mysql-operator/mysql-operator --namespace $NAMESPACE --create-namespace

kubectl label namespace $NAMESPACE kuma.io/sidecar-injection=enabled

kubectl create secret generic mypwds \
        --from-literal=rootUser=root \
        --from-literal=rootHost=% \
        --from-literal=rootPassword="sakila" -n $NAMESPACE

echo "apiVersion: mysql.oracle.com/v2
kind: InnoDBCluster
metadata:
  name: mycluster
spec:
  secretName: mypwds
  tlsUseSelfSigned: true
  instances: 1
  podAnnotations:
    traffic.kuma.io/exclude-outbound-ports: \"443\"
  router:
    instances: 1" | kubectl apply -f - -n $NAMESPACE
