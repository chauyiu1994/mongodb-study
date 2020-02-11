const mongodb = require("mongodb");

const MongoClient = mongodb.MongoClient;
const mongoDbUrl =
  "mongodb+srv://dev:96JYvw0IInIKtPy4@cluster0-dawig.mongodb.net/shop?retryWrites=true&w=majority";

let _db;

const initDb = callback => {
  if (_db) {
    console.log("Database is already initialized");
    return callback(null, _db);
  }
  MongoClient.connect(mongoDbUrl, { useNewUrlParser: true })
    .then(client => {
      _db = client;
      callback(null, _db);
    })
    .catch(err => {
      callback(err);
    });
};

const getDb = () => {
    if (!_db) {
        throw Error('Database not initialized');
    }
    return _db;
};

module.exports = {
    initDb,
    getDb
}

