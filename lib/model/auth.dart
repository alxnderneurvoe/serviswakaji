import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/toast.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(
            message: 'The email address is already in use.',
            backgroundColor: Colors.deepPurple,
            textColor: [Colors.deepPurpleAccent]);
      } else {
        showToast(
            message: 'An error occurred: ${e.code}',
            backgroundColor: Colors.deepPurple,
            textColor: [Colors.deepPurpleAccent]);
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(
            message: 'Invalid email or password.',
            backgroundColor: Colors.deepPurple,
            textColor: [Colors.deepPurpleAccent]);
      } else {
        showToast(
            message: 'An error occurred: ${e.code}',
            backgroundColor: Colors.deepPurple,
            textColor: [Colors.deepPurpleAccent]);
      }
    }
    return null;
  }

  // Future<User?> resetPassword(String email) async {
  //   await _auth.sendPasswordResetEmail(email: email);
  //   return null;
  // }

  Future<User?> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return null;
  }
}
