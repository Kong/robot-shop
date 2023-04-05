#!/bin/sh

NAMESPACE=web

if [ -z $KONG_OIDC_CLIENT_ID ]; then
  echo Must "export KONG_OIDC_CLIENT_ID"
  exit
fi


if [ -z $KONG_OIDC_CLIENT_SECRET ]; then
  echo Must "export KONG_OIDC_CLIENT_SECRET"
  exit
fi


if [ -z $KONG_OIDC_SESSION_SECRET ]; then
  echo Must "export KONG_OIDC_SESSION_SECRET"
  exit
fi

OIDC_CONFIG_FILE="oidc_secret.yaml"

cat oidc_secret_tmp.yaml | envsubst '$KONG_OIDC_CLIENT_ID $KONG_OIDC_CLIENT_SECRET $KONG_OIDC_SESSION_SECRET' > $OIDC_CONFIG_FILE

kubectl apply -f $OIDC_CONFIG_FILE -n $NAMESPACE

echo "apiVersion: configuration.konghq.com/v1
kind: KongPlugin
metadata:
  name: openid-connect-kong
  annotations:
    kubernetes.io/ingress.class: kong
plugin: openid-connect
configFrom:
  secretKeyRef:
    name: oidc-config-secret
    key: config" | kubectl -n $NAMESPACE apply -f -