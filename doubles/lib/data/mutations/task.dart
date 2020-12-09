String createTask(
    {String userId,
    String dueDate,
    String level,
    String title,
    String description}) {
  return """
    mutation {
  createTask(input: {userId: "$userId",dueDate: "$dueDate", level:"$level", title:"$title", description:"$description",isDone: false}) {
    success
    message
  }
}
""";
}

String getTasks({String userId}) {
  return """
    query {
       getTasks(input:{userId:"$userId"}){
      _id
      dueDate
      level
      title
      isDone
      } 
  }
""";
}
