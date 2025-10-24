import 'package:authentication/screen/authenticate/register.dart';
import 'package:authentication/screen/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class AuthenticateSceen extends StatefulWidget {
  const AuthenticateSceen({super.key});

  @override
  State<AuthenticateSceen> createState() => _AuthenticateSceenState();
}

class _AuthenticateSceenState extends State<AuthenticateSceen> {
  
  // toggle between register and sign in screen
  bool showSignIn = true;
  void toggleAuthScreen(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignInScreen(toggle: toggleAuthScreen);
    }else{
      return RegisterScreen(toggle: toggleAuthScreen);
    }
  }
}