import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final String userId;
  DatabaseService(this.userId);

  CollectionReference<Map<String, dynamic>> fireStoreCollection = FirebaseFirestore.instance.collection('test');

  Future updateData( String name, String device, int rating) async{
    await fireStoreCollection.doc(userId).set({
        'name': name,
        'device' : device,
        'rating' : rating
    });
  }
}