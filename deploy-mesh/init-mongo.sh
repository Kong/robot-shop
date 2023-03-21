#!/bin/sh

NAMESPACE=mongodb

kubectl port-forward pods/catalogue-mongodb-0 27017:27017 -n $NAMESPACE &
PID=$!

sleep 5

mongosh mongodb://catalogue-user:junk@localhost/catalogue -f ../mongo/catalogue.js

mongosh mongodb://users-user:junk@localhost/users -f ../mongo/users.js

kill $PID