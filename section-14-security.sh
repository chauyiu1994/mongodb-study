# indicate to mongo that meed auth
sudo mongod --auth

# the user is attached to the database 
use admin
db.createUser({user: "max", pwd: "max", roles: ["userAdminAnyDatabase"]})

# authenticate
db.auth('max', 'max')

# logout should be executed in the same db
db.logout()

# must login with the same db
mongo -u max -p max --authenticationDatabase admin

# create user in shop db
use shop
db.createUser({user: 'appdev', pwd: 'dev', roles: ["readWrite"]})
mongo -u appdev -p dev --authenticationDatabase shop

# grant right to the other db
db.updateUser("appdev", {role: ["readWrite", {role: "readWrite", db: "blog"}]})

# get info of user
db.getUser("appdev")

# assignment
use admin
db.createUser({user: "globalAdmin", pwd: "admin", roles: ["userAdminAnyDatabase"]})
db.createUser({user: "dev", pwd: "dev", roles: [{roles: "writeRead", db: "customers"}, {roles: "writeRead", db: "sales"}]})

# adding ssl to mongo instance
mongod -sslMode requireSSL --sslPEMKeyFile mongodb.pem
# connecting to the instance
mongo --ssl --sslCAFile mongodb.pem --host localhost