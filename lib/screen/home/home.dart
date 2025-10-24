import 'package:authentication/service/auth.dart';
import 'package:flutter/material.dart';

class HomeScreenn extends StatelessWidget {
  HomeScreenn({super.key});

  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            await auth.signOut();
          }, 
          child: Text('Sign out')
          ),
      ),
    );
  }
}