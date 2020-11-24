import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //logo
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:40),
              child: Column(
                children: <Widget>[
                  makeInput(label: "UserName"),
                  SizedBox(height:10, ),
                  makeInput(label: "Password", obsecureText: true),
                  
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                    child: MaterialButton(
                    minWidth: double.infinity,
                    height: 45,
                    onPressed: (){},
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Login", style: 
                      TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?"),
                Text("Sign up", style: TextStyle(
                  fontWeight: FontWeight.w600, 
                  fontSize: 13,
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget makeInput({label, obsecureText = false}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          obscureText: obsecureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)
            ),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.redAccent)
            // ),
          ),
        )
      ],
    );
  }

}