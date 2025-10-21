import 'package:authentication/screen/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class AuthenticateSceen extends StatefulWidget {
  const AuthenticateSceen({super.key});

  @override
  State<AuthenticateSceen> createState() => _AuthenticateSceenState();
}

class _AuthenticateSceenState extends State<AuthenticateSceen> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}