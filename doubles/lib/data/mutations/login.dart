String login(String email, String password) {
  return """
  mutation {
  login(input: { email: "$email", password: "$password" }) {
    token
  }
}
""";
}
