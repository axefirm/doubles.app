import 'package:doubles/navigation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () => print("Nav to add task screen"),
      ),

      // body: ListView.builder(
      //     itemCount: 1,
      //     itemBuilder: (BuilderContext context, int index){
      //       if(index == 0){
      //         return Column(CrossAxisAlignment)
      //       }
      //     },
      //
      // ),


    );
  }
}
