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
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (val) =>val!.isEmpty? "Enter email" : null,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                validator: (val) =>val!.length < 6? "Enter atleast 6 digits" : null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                  
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: ()async{
                  print(email);
                  print(password);
                  UserModel? res = await authService.signInWithEmailAndPass(email, password);
                  if(res == null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Error")));
                    
                  }   
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