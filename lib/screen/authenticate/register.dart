import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggle;
  const RegisterScreen({super.key, required this.toggle});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                child: Text("Register")
              ),
              Row(
                children: [
                  Text("already have an account?"),
                  
                  TextButton(
                    onPressed: (){
                      widget.toggle();
                    }, 
                    child: Text('Log In')
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