
import 'package:doubles/data/mutations/mutations.dart' as mutations;
import 'package:graphql_flutter/graphql_flutter.dart';

import './../graphql_config.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class Api {

  static Future<String> login(String email, String password) async {
    GraphQLClient _client = graphQLConfiguration.clientToQuery();

    var document = gql(mutations.login(email, password));
    QueryResult result;
    print(result);
    result = await _client.mutate(
      MutationOptions(
        documentNode: document,
      ),
    );
    print(result.hasException);
    print(result.exception);


    print(result.data["login"]);

    print("Tokeeeeeeeen:   " + result.data["login"]["webtoken"]);
    return result.data["login"]["webtoken"];
  }
}