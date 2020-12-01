import "package:flutter/material.dart";
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {
  static FlutterSecureStorage storage = new FlutterSecureStorage();
  static String token;
  static HttpLink httpLink = HttpLink(
    uri: "http://localhost:4000/graphql",
  );
  static AuthLink authLink = AuthLink(
      getToken: () async { return await storage.read(key: 'token'); }
  );
  static Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: InMemoryCache(),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    );
  }
}