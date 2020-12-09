const { ApolloServer, gql } = require('apollo-server-express');

const task = gql`
  type Response {
    success: Boolean!
    message: String!
  }

  type Task{
    _id: ID
    userId: ID
    dueDate: String
    level: String
    title: String
    description: String
    isDone: Boolean
  }

  input TaskInput {
    userId: ID
    dueDate: String
    level: String
    title: String
    description: String
    isDone: Boolean
  }

  input getTaskInput {
    userId: ID
  }

  type Query{
    getTasks(input:getTaskInput): [Task]
  }

  type Mutation{
      createTask(input: TaskInput): Response!
      updateTask(input: TaskInput):  Response!
  }

`;

module.exports.taskDef = task;