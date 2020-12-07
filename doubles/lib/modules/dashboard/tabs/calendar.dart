import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTab extends StatefulWidget {
  @override
  _CalendarTabState createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight){
    return TextStyle(
      color: Color(0xff30384c),
      fontWeight: fontWeight,
    );
  }
  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  Widget build(BuildContext context) {
   return Container(
     child: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           SizedBox(height: 30,),
           TableCalendar(
             startingDayOfWeek: StartingDayOfWeek.monday,
             calendarStyle: CalendarStyle(
               weekdayStyle: dayStyle(FontWeight.normal),
               weekendStyle: dayStyle(FontWeight.normal),
               selectedColor: Colors.red[200],
               todayColor: Colors.redAccent,
             ),
             daysOfWeekStyle: DaysOfWeekStyle(
               weekdayStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 16
               ),
               weekendStyle: TextStyle(
                   color: Colors.redAccent,
                   fontWeight: FontWeight.bold,
                   fontSize: 16
               ),
             ),
             headerStyle: HeaderStyle(
               formatButtonVisible: false,
               titleTextStyle: TextStyle(
                 color: Colors.redAccent,
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),

               leftChevronIcon: Icon(
                 Icons.chevron_left,
                 color: Colors.redAccent,
               ),
               rightChevronIcon: Icon(
                 Icons.chevron_right,
                 color: Colors.redAccent,
               ),
             ),
             calendarController: _controller,
           ),
           SizedBox(height: 20,),
           Container(
             padding: EdgeInsets.only(left: 30),
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(50),
                 topRight: Radius.circular(50),
               ),

               color: Colors.red[200],
             ),
             child: Stack(
               children: <Widget>[
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(top: 20),
                       child: Text('Schedule', style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),),
                     ),
                     Container(
                       padding: EdgeInsets.only(top: 10),
                       child: Row(
                         children: <Widget>[
                           Icon(
                             Icons.check_circle_rounded,
                             color: Colors.white,
                             size: 20,
                           ),
                           Container(
                             padding: EdgeInsets.only(left: 10, right: 10),
                             width: MediaQuery.of(context).size.width * 0.8,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Text('Task 1', style: (
                                     TextStyle(
                                       fontSize: 15,
                                       color: Colors.white,
                                     )
                                 ),),
                                 //SizedBox(height: 10,),
                                 Text(
                                   "Description below bby hahah", style: TextStyle(
                                   fontSize: 10,
                                   color: Colors.white,
                                 ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(top: 100),
                       child: Text('Assignment', style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                       ),),
                     ),
                     Container(
                       padding: EdgeInsets.only(top: 10),
                       child: Row(
                         children: <Widget>[
                           Icon(
                             Icons.check_circle_rounded,
                             color: Colors.white,
                             size: 20,
                           ),
                           Container(
                             padding: EdgeInsets.only(left: 10, right: 10),
                             width: MediaQuery.of(context).size.width * 0.8,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Text('Assignment 1', style: (
                                     TextStyle(
                                       fontSize: 15,
                                       color: Colors.white,
                                     )
                                 ),),
                                 //SizedBox(height: 10,),
                                 Text(
                                   "Description below bby hahah", style: TextStyle(
                                   fontSize: 10,
                                   color: Colors.white,
                                 ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 ),
                 // Positioned(
                 //   bottom: 0,
                 //   height: 200,
                 //   width:  MediaQuery.of(context).size.width,
                 //   child: Container(
                 //     decoration: BoxDecoration(
                 //       gradient: LinearGradient(
                 //         begin: FractionalOffset.topCenter,
                 //         end: FractionalOffset.bottomCenter,
                 //         colors: [
                 //           Color(0xFFD54546).withOpacity(0.85),
                 //           Color(0xFFD54546),
                 //         ],
                 //         stops: [
                 //           0.0,
                 //           1.0
                 //         ],
                 //       )
                 //     ),
                 //   ),
                 // ),
                 // Positioned(
                 //   bottom: 40,
                 //   right: 20,
                 //   child: Container(
                 //     padding: EdgeInsets.all((20)),
                 //     decoration: BoxDecoration(
                 //       borderRadius: BorderRadius.all(Radius.circular(20)),
                 //       color: Colors.redAccent,
                 //       boxShadow: [BoxShadow(
                 //         color: Colors.black38,
                 //         blurRadius: 30,
                 //       )],
                 //     ),
                 //     child: Text("+", style: TextStyle(
                 //       color: Colors.white,
                 //       fontSize: 40,
                 //     ),),
                 //   ),
                 // ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }
}
