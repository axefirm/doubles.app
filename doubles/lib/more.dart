import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:doubles/navigation.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: NavigationPage(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.redAccent, Colors.red[100]]
          )
        ),
        child: Column(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/logo-mini.png')
                              )
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Semester                              >", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Holiday                                 >", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Instructors                            >", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Themes                                 >", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text("Passcode                              >", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text("Logout", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
