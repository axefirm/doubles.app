import 'package:doubles/main.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:doubles/navigation.dart';
import 'package:doubles/setUpPage.dart';

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
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>SetUpPage()));
                      },
                      //color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(200)
                      ),
                      child: Text("Semester                     >", style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>SetUpPage()));
                      },
                      //color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(200)
                      ),
                      child: Text("Holiday                         >", style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>SetUpPage()));
                      },
                      //color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(200)
                      ),
                      child: Text("Instructors                    >", style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.white
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("Log out", style:
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
