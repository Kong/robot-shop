#!/bin/sh

NAMESPACE=keycloak

while getopts ":o:" arg; do
  case $arg in    
    o) OPS_CONTEXT=$OPTARG;;    
  esac
done

kubectl create ns $NAMESPACE

KEYCLOAK_PASSWORD=$(kubectl get secret keycloak-admin-password -n reference -o json --context $OPS_CONTEXT | jq -r .data.password | base64 -d -)

kubectl create secret generic keycloak-admin-password \
--from-literal=password=$KEYCLOAK_PASSWORD \
-n $NAMESPACE

helm upgrade -i keycloak keycloak/ -n $NAMESPACE --values values-keycloak.yaml