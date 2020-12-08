
import 'package:doubles/data/mutations/mutations.dart' as mutations;
import 'package:doubles/modules/signup/signup_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './../graphql_config.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class Api {

  ///
  /// Нэвтрэх хэсэг
  ///
  static Future<String> login(String email, String password) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    var document = gql(mutations.login(email, password));
    QueryResult result;
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    print(result.data["login"]);
    return result.data["login"].toString();
  }

  ///
  /// Бүртгүүлэх хэсэг
  ///

  static Future<String> signUp(Signup event) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    print(event.email);
    var document = gql(mutations.signup(event.email, event.password, event.firstName, event.lastName, event.grade, event.university));
    QueryResult result;
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    print("response: " + result.data);
    return result.data["createStudent"];
  }
}