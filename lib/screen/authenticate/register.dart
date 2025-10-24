import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String email = '';
  String password = '';
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            children: [
              TextField(
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: ()async{
                  print(email);
                  print(password);
                  
                }, 
                child: Text("SignIn")
              ),
            ],
          ),
        ),
      ),
    );
  }
}