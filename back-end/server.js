const express = require('express');
const { ApolloServer, gql } = require('apollo-server-express');
const { graphqlHTTP } = require('express-graphql');
const { buildSchema } = require('graphql');
const { mergeTypeDefs } = require('graphql-tools-merge-typedefs');
const GMR  = require('graphql-merge-resolvers'); // Import module
// const { resolvers } = require('./src/resolvers.js');
// const { typeDefs } = require('./src/typeDefs.js');
const { studentDef } = require('./src/controller/student/typedef');
const { studentResolver } = require('./src/controller/student/index');

var ip = require("ip");

let MongoClient = require('mongodb').MongoClient;
let ObjectId = require('mongodb').ObjectId;

const app = express();

let db;

const apolloServer = new ApolloServer({
    typeDefs: mergeTypeDefs([
        studentDef
    ]),
    resolvers: GMR.merge([
        studentResolver,
      ]),
    context: async () => {
        if (!db) {
            try {
                const dbClient = new MongoClient(
                    'mongodb://localhost:27017',
                    {
                        useNewUrlParser: true,
                        useUnifiedTopology: true,
                    }
                )

                if (!dbClient.isConnected()) await dbClient.connect()
                db = dbClient.db('doubles') // database name
            } catch (e) {
                console.log('--->error while connecting with graphql context (db)', e)
            }
        }

        return { db }
    },
})
console.log(ip.address())

apolloServer.applyMiddleware({ app });

app.listen(4000, ip.address(), function(){
console.log(`Running a GraphQL API server at http://${ip.address()}:4000${apolloServer.graphqlPath}`);
});
