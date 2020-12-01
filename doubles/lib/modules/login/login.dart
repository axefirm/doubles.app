<<<<<<< HEAD:doubles/lib/login.dart
/*
author: khuslen, sukhbat
last update: 12/2020
* */

=======
import 'package:doubles/modules/login/login_bloc.dart';
>>>>>>> a902885f75f10bc97cc564de8e758b423e1f347f:doubles/lib/modules/login/login.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc login;
  FToast fToast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login = LoginBloc();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => login,
      child: BlocListener<LoginBloc, LoginState>(
        listener: _blocListener,
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: _blocBuilder,
        ),
      ),
    );
  }

  void _blocListener(BuildContext context, LoginState state){
    if(state is LoginSuccess){
      ///TODO
    }else if(state is LoginFailed){
      fToast.showToast(
        child: Text('test'),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );
    }
  }

  Widget _blocBuilder(BuildContext context, LoginState state){
    return Stack(
      children: [
        Image.asset(
          'assets/img/m.jpg',
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            color: Color(0xFFE3F2FD).withOpacity(0.4),
          ),
        ),
        Scaffold(
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
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 8,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                  AssetImage('assets/img/logo-mini.png'))),
                        ), //logo
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      makeInput(
                          label: "UserName", controller: _usernameController),
                      SizedBox(
                        height: 10,
                      ),
                      makeInput(label: "Password",
                          obsecureText: true,
                          controller: _passwordController),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 45,
                        onPressed: () =>
                        {
                          _onLoginButtonPressed(),
                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget makeInput(
      {label, obsecureText = false, TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obsecureText,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent)),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.redAccent)
            // ),
          ),
        )
      ],
    );
  }

  _onLoginButtonPressed() {
    login.add(Login(_usernameController.text, _passwordController.text));
  }
}
