import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final bool isAnonymous;
  final String? email;
  final String? disPlayName;
  final bool isEmailVerified;
  final String? phoneNumber;
  final String? photoURL;
  final String? refreshToken;
  final String? tenantId;
  final DateTime? lastSignInTime;
  final DateTime? creationTime;
  final List? providerData;

  UserModel({
    required this.uid, 
    this.isAnonymous =false, 
    this.email, 
    this.disPlayName, 
    this.isEmailVerified = false, 
    this.phoneNumber, 
    this.photoURL, 
    this.refreshToken, 
    this.tenantId, 
    this.lastSignInTime, 
    this.creationTime, 
    this.providerData
  });

  factory UserModel.fromFirebaseUser(User? user){
    return UserModel(
      uid: user?.uid??'',
      isAnonymous: user?.isAnonymous??false,
      isEmailVerified: user?.emailVerified??false,
      email: user?.email,
      disPlayName: user?.displayName,
      phoneNumber: user?.phoneNumber,
      photoURL: user?.photoURL,
      refreshToken: user?.refreshToken,
      tenantId: user?.tenantId,
      lastSignInTime: user?.metadata.lastSignInTime,
      creationTime: user?.metadata.creationTime,
      providerData: user?.providerData
    );
  }
}