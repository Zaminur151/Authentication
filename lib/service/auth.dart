import 'package:authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  

  //auth change stream
  Stream<UserModel?> get userStream{
    return _auth.authStateChanges().map((User? firebaseUser){
      if(firebaseUser != null){
        return UserModel.fromFirebaseUser(firebaseUser);
      }else{
        return null;
      }
    });
  }

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

  // sign out 
  Future signOut() async{
    await _auth.signOut();
  }

 
}