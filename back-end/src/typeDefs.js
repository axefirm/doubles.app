const { ApolloServer, gql } = require('apollo-server-express');

const typeDefs = gql`
  type Query{
      getUsers: [User]
  }

  type Response {
    success: Boolean!
    message: String!
  }

  type User{
    firstname: String
    lastname: String
    inDateTime: String
    outDatetime: String
    year: String
  }

  input UserInput {
    firstname: String
    lastname: String
    inDateTime: String
    outDatetime: String
    year: String
  }
  
  type Mutation{
      createUser(input: UserInput): Response
  }
`;

module.exports.typeDefs = typeDefs;