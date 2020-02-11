npm install mongodb --save
db.products.createIndex({price: 1});
db.users.createIndex({email: 1}, {unique: true})