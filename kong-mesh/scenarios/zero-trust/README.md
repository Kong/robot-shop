Zero Trust Exercises
---
1. Limit mysql database to only application services
   1. Connect to an interactive shell and login via the mysql command line by running the following command: `mysql -u ratings -p -h mycluster-instances_mysql-operator_svc_3306.mesh -P 80 -D ratings`
   2. Run the SQL `select * from ratings` and verify you get data back
   3. Apply `kubectl apply -f mysql-permissions.yaml`
   4. Connect to an interactive shell and login via the mysql command line by running the following command: `mysql -u ratings -p -h mycluster-instances_mysql-operator_svc_3306.mesh -P 80 -D ratings`. You should now be denied access after you enter the password.
2. Exercise: Limit mongod access to only the applications that need it. Follow the above pattern for mongodb applications.
   1. Hint: You need to tag your Kong Mesh services using pod labels. See `ratings/templates/deployment.yaml`