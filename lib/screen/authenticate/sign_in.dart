import 'package:authentication/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            User? result = await authService.signInAnony();
            if(result == null){
              print("sign in error");
            }else{
              print(result);
              print("sign in success");
            }
          }, 
          child: Text("SignIn Anonymously")),
      ),
    );
  }
}