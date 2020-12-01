String signup(String email, String password, String firstName, String lastName, String grade, String university) {
  return """
  mutation {
  createStudent(input: { email: "$email", password: "$password", firstname: "$firstName", lastname:"$lastName", grade: "$grade", university: "$university"}) {
    success  
    message
    token
  }
}
""";
}
