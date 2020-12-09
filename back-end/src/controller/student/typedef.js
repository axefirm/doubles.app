const { ApolloServer, gql } = require('apollo-server-express');

const student = gql`

  type Student{
    _id: ID
    firstName: String
    lastName: String
    grade: String
    university: String
    email: String
  }

  input StudentInput {
    firstName: String
    lastName: String
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
      createStudent(input: StudentInput): AuthResponse
      login(input: LoginInput): AuthResponse
  }

  type AuthResponse {
    token: String
    data: Student
    success: Boolean
    message: String
  }
`;

module.exports.studentDef = student;