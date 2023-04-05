#!/bin/sh

KONG_CLOUD_PUSH_USER=$(gcloud secrets versions access 1 --secret="kong-cloud-push-user")
KONG_CLOUD_PUSH_PASS=$(gcloud secrets versions access 1 --secret="kong-cloud-push-pass")

docker login -u $KONG_CLOUD_PUSH_USER -p $KONG_CLOUD_PUSH_PASS