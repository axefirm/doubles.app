/*
author: khuslen, sukhbat
last update: 12/2020
* */


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
      width: MediaQuery.of(context).size.width,
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
              // Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentPage()));
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
        ],
      ),
    );
  }
}
