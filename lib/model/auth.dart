// ignore_for_file: avoid_web_libraries_in_flutter, non_constant_identifier_names, avoid_print

import 'dart:js';

import 'package:app_servis/navigasi/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/toast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<User?> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return null;
  }

  Future<User?> InLoginPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        UserCredential result = await _auth.signInWithCredential(credential);
        User? user = result.user;
        print('User signed in: ${user?.uid}');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Error: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        String smsCode = '...';
        AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        _auth.signInWithCredential(credential).then((UserCredential result) {
          User? user = result.user;
          print('User signed in: ${user?.uid}');
        }).catchError((e) {
          print('Error: ${e.message}');
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    return null;
  }
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getUserData(String uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data()!;
        print('User data: $userData');
      } else {
        print('User does not exist');
        navigateToResetPage(context as BuildContext);
      }
    } catch (e) {
      print('Failed to get user data: $e');
    }
  }

  Future<void> addUser(
    String nama,
    String nik,
    String alamat,
    String nohp,
  ) async {
    await _firestore.collection('User').add({
      'nama': nama,
      'nik': nik,
      'alamat': alamat,
      'nohp': nohp,
    });
  }

  Future<void> updateUser(
    String documentId,
    String nama,
    String nik,
    String alamat,
    String nohp,
  ) async {
    await _firestore.collection('User').doc(documentId).update({
      'nama': nama,
      'nik': nik,
      'alamat': alamat,
      'nohp': nohp,
    });
  }

  Future<void> deleteUser(
    String documentId,
  ) async {
    await _firestore.collection('User').doc(documentId).delete();
  }
}
