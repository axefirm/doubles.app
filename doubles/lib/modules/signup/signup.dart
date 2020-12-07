import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _gradeController = TextEditingController();
  final _universityController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              "Signup",
              style: TextStyle(color: Colors.black),
            ),
          ),
          // body: Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: double.infinity,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //       // Container(
          //       //   height: MediaQuery.of(context).size.height / 8,
          //       //   decoration: BoxDecoration(
          //       //       image: DecorationImage(
          //       //           image: AssetImage('assets/img/logo-mini.png')
          //       //       )
          //       //   ),
          //       // ),
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 40),
          //         child: SingleChildScrollView(
          //           child: Column(
          //             children: <Widget>[
          //               makeInput(
          //                   label: "First Name",
          //                   controller: _firstNameController),
          //
          //               makeInput(
          //                   label: "Last Name",
          //                   controller: _lastNameController),
          //
          //               makeInput(label: "E-mail", controller: _emailController),
          //
          //               makeInput(label: "Grade", controller: _gradeController),
          //
          //               makeInput(
          //                   label: "University",
          //                   controller: _universityController),
          //
          //               makeInput(
          //                   label: "Password",
          //                   obsecureText: true,
          //                   controller: _passwordController),
          //
          //               makeInput(
          //                   label: "Confirm Password",
          //                   obsecureText: true,
          //                   controller: _confirmPasswordController),
          //
          //               // Container(
          //               //   child: MaterialButton(
          //               //     minWidth: double.infinity,
          //               //     height: 45,
          //               //     onPressed: (){},
          //               //     color: Colors.redAccent,
          //               //     shape: RoundedRectangleBorder(
          //               //         side: BorderSide(
          //               //             color: Colors.white
          //               //         ),
          //               //         borderRadius: BorderRadius.circular(50)
          //               //     ),
          //               //     child: Text("Sign up", style:
          //               //     TextStyle(
          //               //       fontWeight: FontWeight.w600,
          //               //       color: Colors.white,
          //               //     ),
          //               //     ),
          //               //   ),
          //               // ),
          //               // Row(
          //               //   mainAxisAlignment: MainAxisAlignment.center,
          //               //   children: <Widget>[
          //               //     Text("Already have an account?"),
          //               //     Text("Login", style: TextStyle(
          //               //       fontWeight: FontWeight.w600,
          //               //       fontSize: 13,
          //               //     ),),
          //               //   ],
          //               // )
          //             ],
          //           ),
          //         ),
          //       ),
          //       // Padding(
          //       //     padding: EdgeInsets.symmetric(horizontal: 40),
          //       //     child:
          //       // ),
          //     ],
          //   ),
          // ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/logo-mini.png'))),
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
                    onPressed: () {},
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
