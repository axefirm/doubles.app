import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'graphql/TodoFetch.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final HttpLink httpLink = HttpLink(uri: "http://localhost:4000/graphql");
    // final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    //   GraphQLClient(
    //     link: httpLink as HttpLink,
    //     cache: OptimisticCache(
    //       dataIdFromObject: typenameDataIdFromObject,
    //     ),
    //   ),
    // );

    return MaterialApp(
      home: HomePage(),
      // home: GraphQLProvider(
      //   child: HomePage(),
      //   client: client,
      // ),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("GraphQL Test"),),
      body: Container(
        child: Text("asdasdasd"),
      ),
      // body: Query(
      //   options: QueryOptions(
      //     documentNode: gql(TodoFetch.fetchAll),
      //   ),
      //   builder: (result, {fetchMore, refetch}) {
      //     return Text(result.data ?? "EMPTY");
      //   },
      // ),
    );
  }
}
