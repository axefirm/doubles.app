let MongoClient = require('mongodb').MongoClient;
let ObjectId = require('mongodb').ObjectId;
let doubles, doublesexport;
MongoClient.connect('mongodb://localhost:27017', { useNewUrlParser: true, useUnifiedTopology: true }, (err, client) => {
    doubles = client.db('doubles');
    doublesexport = {
        User: doubles.collection("user"),
    }
    module.exports.db = doublesexport;
});
