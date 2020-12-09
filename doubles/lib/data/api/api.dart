import 'package:doubles/data/mutations/mutations.dart' as mutations;
import 'package:doubles/modules/signup/signup_bloc.dart';
import 'package:doubles/modules/task/task_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './../graphql_config.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class Api {
  ///
  /// Нэвтрэх хэсэг
  ///
  static Future<QueryResult> login(String email, String password) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final _storage = FlutterSecureStorage();

    print("pushToken");
    String pushToken = await _storage.read(key: "pushToken");
    print(pushToken);
    var document = gql(mutations.login(email, password));
    print(document);
    QueryResult result;
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    print(result);

    return result;
  }

  ///
  /// Бүртгүүлэх хэсэг
  ///

  static Future<String> signUp(Signup event) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    print(event.email);
    var document = gql(mutations.signup(event.email, event.password,
        event.firstName, event.lastName, event.grade, event.university));
    QueryResult result;
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    print("response: " + result.data);
    return result.data["createStudent"];
  }

  static Future<QueryResult> createTask(event) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final _storage = FlutterSecureStorage();

    String userId = await _storage.read(key: "userId");

    var document = gql(mutations.createTask(
        userId: userId,
        dueDate: event.dueDate,
        level: event.level,
        title: event.title,
        description: event.description));
    QueryResult result;
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    return result;
  }
  static Future<QueryResult> getTasks() async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    final _storage = FlutterSecureStorage();

    String userId = await _storage.read(key: "userId");
    print(userId);
    var document = gql(mutations.getTasks(
        userId: userId));
    QueryResult result;
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    return result;
  }
}
