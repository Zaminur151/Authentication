import 'package:authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anony
  Future<UserModel?> signInAnony() async{
    try {
      UserCredential userCre = await _auth.signInAnonymously();
      User? user = userCre.user;
      return UserModel.fromFirebaseUser(user);
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}