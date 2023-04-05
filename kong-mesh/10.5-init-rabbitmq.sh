#!/bin/sh

NAMESPACE=rabbitmq

if [ -z $PASSWORD ]; then
  echo Must "export PASSWORD=test"
  exit
fi

kubectl exec my-release-rabbitmq-0 -c rabbitmq -n $NAMESPACE -i -- rabbitmqctl add_user test $PASSWORD
kubectl exec my-release-rabbitmq-0 -c rabbitmq -n $NAMESPACE -i -- rabbitmqctl set_permissions -p / test '.*' '.*' '.*'