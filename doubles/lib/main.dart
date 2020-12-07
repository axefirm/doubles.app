/*
author: khuslen, sukhbat
last update: 12/2020
* */

import 'file:///E:/projects/doubles.app/doubles/lib/modules/dashboard/tabs/assignment.dart';
import 'package:doubles/modules/signup/signup.dart';
import 'file:///E:/projects/doubles.app/doubles/lib/modules/dashboard/tabs/more.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:doubles/test.dart';
import 'package:doubles/navigation.dart';
import 'package:flutter/services.dart';
import 'file:///E:/projects/doubles.app/doubles/lib/modules/dashboard/dashboard.dart';
import 'file:///E:/projects/doubles.app/doubles/lib/modules/dashboard/tabs/more.dart';

import 'modules/login/login.dart';

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
      home: DashboardPage(),
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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Stack(
      // fit: StackFit.expand,
      children: [
      //   new Image(
      //     image: new AssetImage('assets/img/mm.jpg'),
      //     fit: BoxFit.cover,
      //     color:Colors.red[200],
      //     colorBlendMode: BlendMode.darken,
      //   ),
        Image.asset(
          'assets/img/mm.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFD54546).withOpacity(0.85),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          //appBar: AppBar(title: Text("GraphQL Test"),),
          body: Container(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height:35,),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/img/5.png')
                          )
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Version 1.0.1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    //SizedBox(height:20,),

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
                            color: Colors.white,
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
          ),
          // body: Query(
          //   options: QueryOptions(
          //     documentNode: gql(TodoFetch.fetchAll),
          //   ),
          //   builder: (result, {fetchMore, refetch}) {
          //     return Text(result.data ?? "EMPTY");
          //   },
          // ),
        ),
      ],
    );
  }
}
