// ignore_for_file: avoid_web_libraries_in_flutter, non_constant_identifier_names, avoid_print, empty_catches

import 'dart:js';

import 'package:app_servis/model/toast.dart';

import '../navigasi/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    } on FirebaseAuthException {}
    return null;
  }

  Future<User?> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
    return null;
  }

  Future<User?> InLoginPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+6281370612244',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {},
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

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> getUserProfileImageURL(String userId) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('User').doc(userId).get();

      String imageUrl = userDoc['image'];

      return imageUrl;
    } catch (e) {
      print('Error getting user profile image URL: $e');
      return '';
    }
  }
}
