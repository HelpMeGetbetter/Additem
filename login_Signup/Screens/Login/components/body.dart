

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/login_Signup/Screens/Login/components/background.dart';
import 'package:flutter_auth/login_Signup/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/login_Signup/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/login_Signup/components/rounded_button.dart';
import 'package:flutter_auth/login_Signup/components/rounded_input_field.dart';
import 'package:flutter_auth/login_Signup/components/rounded_password_field.dart';
import 'package:flutter_auth/login_Signup/Screens/Signup/components/body.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';





class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();





  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String email = '';

  String password = '';

  BuildContext context;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: _emailController,
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                controller: _passwordController,
                onChanged: (value) {},
              ),
              RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    try {
                      FirebaseUser user =
                          (await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          )).user;
                      if (user != null) {
                        Navigator.pushNamed(context, '/');
                      }
                    } catch (e) {
                      print(e);
                      _emailController.text = "";
                      _passwordController.text = "";
                      // TODO: AlertDialog with error
                    }
                  },
                  
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}




