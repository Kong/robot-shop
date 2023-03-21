#!/bin/sh

NAMESPACE=mysql-operator

kubectl port-forward pods/mycluster-0 3306:3306 -n $NAMESPACE &
PID=$!

sleep 5

# port forward to my-cluster
mysqlsh root:sakila@localhost:3306 --sql --file ../mysql/scripts/10-dump.sql

mysqlsh root:sakila@localhost:3306 --sql --file ../mysql/scripts/20-ratings.sql

kill $PID