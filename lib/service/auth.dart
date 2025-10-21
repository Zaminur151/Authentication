import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anony
  Future signInAnony() async{
    try {
      UserCredential userCre = await _auth.signInAnonymously();
      User? user = userCre.user;
      return user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}