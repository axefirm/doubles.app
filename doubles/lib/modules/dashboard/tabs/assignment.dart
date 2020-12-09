import 'package:doubles/modules/task/add_task_screen.dart';
import 'package:doubles/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:doubles/modules/dashboard/bloc/dashboard_bloc.dart';

import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  List<Task> list = [];
  DashboardBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc = DashboardBloc();
    _bloc.add(GetTasks());
  }

   Widget _buildTask(int index,String title,String dueDate,bool isDone){
     return Padding(
       padding: EdgeInsets.symmetric(horizontal: 25.0),
       child: ListTile(
         title: Text(title),
         subtitle: Text(dueDate.substring(0, 10)),
         trailing: Checkbox(onChanged: (value){
           isDone = value;
         },
           activeColor: Colors.redAccent,
           value: isDone,
         ),
       ),
     );
   }

   @override
   Widget build(BuildContext context) {
     return BlocProvider<DashboardBloc>(
       create: (context) => _bloc,
       child: BlocListener<DashboardBloc, DashboardState>(
         listener: _blocListener,
         child: BlocBuilder<DashboardBloc, DashboardState>(
           builder: _blocBuilder,
         ),
       ),
     );
   }

   void _blocListener(BuildContext context, DashboardState state) {
     if (state is DashboardSuccess) {
       print("DashboardSuccess");
       print(state.res.data["getTasks"]);
       // List<Task> list = state.res.data["getTasks"];

       for(var item in state.res.data["getTasks"]){
          Task test =Task(item["_id"],item["dueDate"],item["level"],item["title"],item["isDone"]);
          list.add(test);
       }
     } else if (state is DashboardFailed) {

     }
   }

   Widget _blocBuilder(BuildContext context, DashboardState state) {
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

      body:
      ListView.builder(
          itemCount: this.list.length,
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
            return _buildTask(index,this.list[index].title, this.list[index].dueDate,this.list[index].isDone);
          },
      ),


    );
  }
}

class Task {
  String _id;
  String dueDate;
  String level;
  String title;
  bool isDone;

  Task(this._id, this.dueDate, this.level, this.title, this.isDone);

  Task.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        dueDate = json['dueDate'],
        level = json['level'],
        isDone = json['isDone'],
        title = json['title'];
}
