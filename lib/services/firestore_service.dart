import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreService {

  final CollectionReference users = Firestore.instance.collection("users");

  Future<void> updateUserData({@required String uid, @required String full_name, @required int age}) async {
    return await users.document(uid).setData({
      'full_name': full_name,
      'age': age,
      'protect_points': 0,
      'date_account_created': DateTime.now()
    });
  }

  Future<DocumentSnapshot> getUserDocumentSnapshot(String uid) async {
    return await users.document(uid).get();
  }
}
