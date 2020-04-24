import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class User {
  final String uid;

  const User({
    @required this.uid,
  });
}

class FirebaseAuthService {
  final CollectionReference users = Firestore.instance.collection('users');
  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(result.user);
  }

  Future<User> createUserWithEmailAndPassword(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _userFromFirebase(result.user);
  }

  Future<DocumentSnapshot> getUserDocumentSnapshot(String uid) async {
    try {
      return await users.document(uid).get();
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
