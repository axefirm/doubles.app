import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:doubles/login.dart';
import 'package:doubles/signup.dart';

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
      //appBar: AppBar(title: Text("GraphQL Test"),),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height:25,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Welcome', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                  SizedBox(height: 20,),
                  Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown .",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height:20,),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/flut.png')
                    )
                ),
              ),
              SizedBox(height: 110,),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 45,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Login", style:
                    TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                  SizedBox(height:10,),
                  Container(
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 45,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Sign up", style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,
                      ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
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
