import 'package:doubles/add_task_screen.dart';
import 'package:doubles/navigation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:doubles/add_task_screen.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {

   Widget _buildTask(int index){
     return Padding(
       padding: EdgeInsets.symmetric(horizontal: 25.0),
       child: ListTile(
         title: Text('Task Title'),
         subtitle: Text('Oct 22, 2019'),
         trailing: Checkbox(onChanged: (value){
           print(value);
         },
           activeColor: Colors.redAccent,
           value: true,
         ),
       ),
     );
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0), // here the desired height
          child:
            GradientAppBar(
              //title: Text('2020'),
              backgroundColorStart: Colors.red[100],
              backgroundColorEnd: Colors.redAccent,
            ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreenPage(),
        ),
        ),
      ),

      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            if(index == 0){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0 ,vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text("1 of 10", style: TextStyle(
                    //   color: Colors.grey,
                    //   fontSize: 10,
                    //   fontWeight: FontWeight.w600,
                    // ),),
                  ],
                ),
              );
            }
            return _buildTask(index);
          },
      ),


    );
  }
}
