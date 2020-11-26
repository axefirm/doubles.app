const express = require('express');
const { ApolloServer, gql } = require('apollo-server-express');
const { graphqlHTTP } = require('express-graphql');
const { buildSchema } = require('graphql');
const { resolvers } = require('./src/resolvers.js');
const { typeDefs } = require('./src/typeDefs.js');

let MongoClient = require('mongodb').MongoClient;
let ObjectId = require('mongodb').ObjectId;

const app = express();

let db;

const apolloServer = new ApolloServer({
    typeDefs,
    resolvers,
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

apolloServer.applyMiddleware({ app });

app.listen(4000);
console.log(`Running a GraphQL API server at http://localhost:4000 ${server.graphqlPath}`);
