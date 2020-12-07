/*
author: khuslen, sukhbat
last update: 12/2020
* */
import 'package:doubles/modules/dashboard/tabs/calendar.dart';
import 'package:doubles/navigation.dart';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bottom_bar.dart';

enum BottomIcons { Home, Assignment, Mark, Menu }

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPage createState() => _DashboardPage();
}

class _DashboardPage extends State<DashboardPage> {
  BottomIcons bottomIcons = BottomIcons.Home;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
        child: Container(
          height: 90,
          child: Text("2020"),
          decoration: new BoxDecoration(color: Color(0xffE57A7A)),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 24, right: 24, bottom: 10, top: 10),
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomBar(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
                setState(() {
                  tabIndex = 0;
                  bottomIcons = BottomIcons.Home;
                });
              },
              bottomIcons: bottomIcons == BottomIcons.Home ? true : false,
              icons: Icons.home_rounded,
              text: "Home",
            ),
            BottomBar(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => AssignmentPage()));
                setState(() {
                  tabIndex = 1;
                  bottomIcons = BottomIcons.Assignment;
                });
              },
              bottomIcons: bottomIcons == BottomIcons.Assignment ? true : false,
              icons: Icons.assignment_turned_in_outlined,
              text: "Assignment",
            ),
            BottomBar(
              onPressed: () {
                setState(() {
                  tabIndex = 2;
                  bottomIcons = BottomIcons.Mark;
                });
              },
              bottomIcons: bottomIcons == BottomIcons.Mark ? true : false,
              icons: Icons.collections_bookmark,
              text: "Courses",
            ),
            BottomBar(
              onPressed: () {
                setState(() {
                  tabIndex = 3;
                  bottomIcons = BottomIcons.Menu;
                });
              },
              bottomIcons: bottomIcons == BottomIcons.Menu ? true : false,
              icons: Icons.menu,
              text: "More",
            ),
          ],
        ),
      ),
      body: Container(
        child: tabIndex == 0
            ? CalendarTab()
            : tabIndex == 1
            ? Text("test 1")
            : tabIndex == 2
            ? Text("test 2")
            : Text("test 3"),
      ),
    );
  }
}
