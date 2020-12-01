/*
author: khuslen, sukhbat
last update: 12/2020
* */

import 'package:doubles/calendar.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:doubles/bottom_bar.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

enum BottomIcons { Home, Assignment, Mark, Menu }

class _NavigationPageState extends State<NavigationPage> {
  BottomIcons bottomIcons = BottomIcons.Home;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          bottomIcons == BottomIcons.Home ? Center(
            child: MaterialButton(
              // onPressed: (){
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
              // },
            ),
          ):Container(),
          bottomIcons == BottomIcons.Assignment ? Center(
            child: Text("Hi, assignment", style: TextStyle(fontSize: 18),),
          ):Container(),
          bottomIcons == BottomIcons.Mark ? Center(
            child: Text("Hi, courses", style: TextStyle(fontSize: 18),),
          ):Container(),
          bottomIcons == BottomIcons.Menu ? Center(
            child: Text("Hi, home more", style: TextStyle(fontSize: 18),),
          ):Container(),
          Align(
           alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomBar(
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
                      setState(() {
                        bottomIcons = BottomIcons.Home;
                      });
                    },
                    bottomIcons: bottomIcons == BottomIcons.Home ? true:false,
                    icons: Icons.home_rounded,
                    text: "Home",
                  ),
                  BottomBar(
                    onPressed: (){
                      setState(() {
                        bottomIcons = BottomIcons.Assignment;
                      });
                    },
                    bottomIcons: bottomIcons == BottomIcons.Assignment ? true:false,
                    icons: Icons.assignment_turned_in_outlined,
                    text: "Assignment",
                  ),
                  BottomBar(
                    onPressed: (){
                      setState(() {
                        bottomIcons = BottomIcons.Mark;

                      });
                    },
                    bottomIcons: bottomIcons == BottomIcons.Mark ? true:false,
                    icons: Icons.collections_bookmark,
                    text: "Courses",
                  ),
                  BottomBar(
                    onPressed: (){
                      setState(() {
                        bottomIcons = BottomIcons.Menu;
                      });
                    },
                    bottomIcons: bottomIcons == BottomIcons.Menu ? true:false,
                    icons: Icons.menu,
                    text: "More",
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
