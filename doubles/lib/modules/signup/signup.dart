import 'package:doubles/modules/dashboard/dashboard.dart';
import 'package:doubles/modules/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _gradeController = TextEditingController();
  final _universityController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  FToast fToast;

  // ignore: close_sinks
  SignUpBloc signup;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    signup = SignUpBloc();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => signup,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: _blocListener,
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: _blocBuilder,
        ),
      ),
    );
  }

  void _blocListener(BuildContext context, SignUpState state) {
    if (state is SignUpSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else if (state is SignUpFailed) {
      fToast.showToast(
        child: Text('Бүртгэл амжилтгүй.'),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );
    }
  }

  Widget _blocBuilder(BuildContext context, SignUpState state) {
    return Stack(
      children: [
        SizedBox(
          height: 10,
        ),
        Image.asset(
          'assets/img/mm.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color(0xFFD54546).withOpacity(0.85),
          ),
        ),
        Scaffold(
          //resizeToAvoidBottomInset: false,
          //backgroundColor: Colors.white,
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
            title: Text(
              "Бүртгүүлэх",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/logo-mini.png'))),
                ),
                SizedBox(
                  height: 20,
                ),
                makeInput(
                    label: "First Name", controller: _firstNameController),
                makeInput(label: "Last Name", controller: _lastNameController),
                makeInput(label: "E-mail", controller: _emailController),
                makeInput(label: "Grade", controller: _gradeController),
                makeInput(
                    label: "University", controller: _universityController),
                makeInput(
                    label: "Password",
                    obsecureText: true,
                    controller: _passwordController),
                makeInput(
                    label: "Confirm Password",
                    obsecureText: true,
                    controller: _confirmPasswordController),
                Container(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 45,
                    onPressed: () => {_onSignupButtonPressed()},
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    Text(
                      "Login",
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

  _onSignupButtonPressed() {
    print("signup");
    print(_emailController.text);
    print(this._emailController.text);
    signup.add(Signup(email: this._emailController.text, password: this._passwordController.text, firstName: this._firstNameController.text, grade: this._gradeController.text, lastName: this._lastNameController.text, university: this._universityController.text));
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
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent)),
            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.redAccent)
            // ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
