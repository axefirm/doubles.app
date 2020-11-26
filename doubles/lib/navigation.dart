import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

enum BottomIcons {Home, Assignment, Mark, Menu}

class _NavigationPageState extends State<NavigationPage> {
  BottomIcons bottomIcons = BottomIcons.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
           alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        bottomIcons = BottomIcons.Home;
                      });
                    },
                    child: bottomIcons == BottomIcons.Home ? Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD54546).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom:  8
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.home_rounded, color: Colors.redAccent,),
                          SizedBox(width: 8,),
                          Text("Home", style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),)
                        ],
                      ),
                    ):Icon(Icons.home_rounded)
                  ),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          bottomIcons = BottomIcons.Assignment;
                        });
                      },
                      child: bottomIcons == BottomIcons.Assignment ? Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFD54546).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom:  8
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.assignment_turned_in_outlined, color: Colors.redAccent,),
                            SizedBox(width: 8,),
                            Text("Assignment", style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),)
                          ],
                        ),
                      ):Icon(Icons.assignment_turned_in_outlined)
                  ),

                  GestureDetector(
                      onTap: (){
                        setState(() {
                          bottomIcons = BottomIcons.Mark;
                        });
                      },
                      child: bottomIcons == BottomIcons.Mark ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD54546).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom:  8
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.collections_bookmark, color: Colors.redAccent,),
                            SizedBox(width: 8,),
                            Text("Courses", style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),)
                          ],
                        ),
                      ):Icon(Icons.collections_bookmark)
                  ),
                  GestureDetector(
                      onTap: (){
                        setState(() {
                          bottomIcons = BottomIcons.Menu;
                        });
                      },
                      child: bottomIcons == BottomIcons.Menu ? Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD54546).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom:  8
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.menu, color: Colors.redAccent,),
                            SizedBox(width: 8,),
                            Text("More", style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),)
                          ],
                        ),
                      ):Icon(Icons.menu)
                  ),
                  // Icon(Icons.home_rounded),
                  // Icon(Icons.assignment_turned_in_outlined),
                  // Icon(Icons.bookmarks),
                  // Icon(Icons.menu),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
