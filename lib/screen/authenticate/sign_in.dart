import 'package:authentication/models/user_model.dart';
import 'package:authentication/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final Function toggle;
  const SignInScreen({super.key, required this.toggle});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthService authService = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                  
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  
                  print(email);
                  print(password);
                  
                }, 
                child: Text("SignIn")
              ),
              Row(
                children: [
                  Text("don't have an account?"),
                  
                  TextButton(
                    onPressed: (){
                      widget.toggle();
                    }, 
                    child: Text('Create account')
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}