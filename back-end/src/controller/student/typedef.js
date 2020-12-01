const { ApolloServer, gql } = require('apollo-server-express');

const student = gql`
  type Response {
    success: Boolean!
    message: String!
  }

  type Student{
    firstname: String
    lastname: String
    grade: String
    university: String
    email: String
  }

  input StudentInput {
    firstname: String
    lastname: String
    grade: String
    university: String
    email: String
    password: String
  }
  
  input LoginInput {
    email: String!
    password: String!
  }

  type Query{
    getStudents: [Student]
  }

  type Mutation{
      createStudent(input: StudentInput): Response
      login(input: LoginInput): AuthResponse
  }

  type AuthResponse {
    token: String
    data: Student
    error: Boolean
    errormessage: String
  }
`;

module.exports.studentDef = student;