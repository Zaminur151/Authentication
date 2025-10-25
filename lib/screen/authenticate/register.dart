import 'package:authentication/models/user_model.dart';
import 'package:authentication/service/auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function toggle;
  const RegisterScreen({super.key, required this.toggle});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthService auth = AuthService();
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
                validator: (val) => val!.isEmpty? 'Enter email' : null,              
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                validator: (val) => val!.length < 6? 'enter atleast 6 digit' : null,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                  
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: ()async{
                  if(_formkey.currentState!.validate()) {
                    print(email);
                    print(password);
                    UserModel? res= await auth.createUserWithEmailAndPass(email, password);
                    if(res == null){
                      print('Error');
                    }else{
                      print(res);
                    }
                  }
                  
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