import 'package:flutter/material.dart';





//
import 'package:flutter_auth/login_Signup/Screens/Login/login_screen.dart';
import 'package:flutter_auth/login_Signup/Screens/Signup/components/background.dart';
import 'package:flutter_auth/login_Signup/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/login_Signup/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/login_Signup/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/login_Signup/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/login_Signup/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/login_Signup/components/rounded_button.dart';
import 'package:flutter_auth/login_Signup/components/rounded_input_field.dart';
import 'package:flutter_auth/login_Signup/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth/main.dart';





class Body extends StatefulWidget {


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();




  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.35,
              ),

              RoundedInputField(
                controller: _emailController,
                hintText: "Your Email",
                onChanged: (val) {
                },
              ),
              RoundedPasswordField(
                controller: _passwordController,
                onChanged: (val) {
                },
              ),
              RoundedButton(
                  text: "SIGNUP",
                 press: ()
                  async {
                   try {
                    FirebaseUser user = (await FirebaseAuth.instance
                         .createUserWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,)).user;
                      if(user != null){
                        UserUpdateInfo updateUser = UserUpdateInfo();
                        user.updateProfile(updateUser);
                        Navigator.pushNamed(context, '/');
                      }
                   } catch (e) {
                     print(e);
                      _passwordController.text = "";
                    _emailController.text = "";
                      // TODO: alertdialog with error
                    }
                  },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/fbb.svg",
                    press: () => signUpWithFacebook(),
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitterr.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google.svg",
                    press: () => _signIn(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
// google sign in
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    Navigator.pushNamed(context, '/');

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
  }
// facebook
  Future<void> signUpWithFacebook() async {
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);

      if (result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        );
        final FirebaseUser user = (await FirebaseAuth.instance
            .signInWithCredential(credential)).user;
        print('signed in ' + user.displayName);
        return user;
      }
    } catch (e) {
      print(e.message);
    }
    Navigator.pushNamed(context, '/');
  }
// with email
}











