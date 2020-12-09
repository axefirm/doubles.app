import 'package:flutter/material.dart';
import 'package:doubles/modules/dashboard/tabs/more.dart';

class SetUpPage extends StatefulWidget {
  @override
  _SetUpPageState createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 150),
        child: new Container(
          child: new Image.network(
            'https://media.giphy.com/media/3o7btQ0NH6Kl8CxCfK/giphy.gif',
            width: 500,
          ),
        ),
      ),
    );
  }
}
