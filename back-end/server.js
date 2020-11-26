const express = require('express');
const { ApolloServer, gql } = require('apollo-server-express');
const { graphqlHTTP } = require('express-graphql');
const { buildSchema } = require('graphql');
const { resolvers } = require('./src/resolvers.js');
const { typeDefs } = require('./src/typeDefs.js');
let db;
(async function () {
    db = await require('./config/db.js');
})();
const app = express();

console.log(db);

const server = new ApolloServer({
    typeDefs,
    resolvers,
    context: async ({req, res, connection}) => {
        return { db: db.db }
      },
});

server.applyMiddleware({ app });

app.listen(4000);
console.log(`Running a GraphQL API server at http://localhost:4000 ${server.graphqlPath}`);
// console.log("hello");