import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
        child:
        GradientAppBar(
          title: Text('2020'),
          backgroundColorStart: Colors.red[100],
          backgroundColorEnd: Colors.redAccent,
        ),

      ),
    );
  }
}
