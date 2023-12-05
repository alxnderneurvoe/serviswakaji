// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:app_servis/model/note.dart';
import 'package:app_servis/model/toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../navigasi/nav.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController nohpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Registration',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: nikController,
              decoration: const InputDecoration(labelText: 'NIK'),
            ),
            TextField(
              controller: nohpController,
              decoration: const InputDecoration(labelText: 'No Hp'),
            ),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(labelText: 'Alamat'),
              minLines: 1,
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: phoneController.text,
        password: passwordController.text,
      );

      String uid = userCredential.user!.uid;

      await _firestore.collection('User').doc(uid).set({
        '1. nama': namaController.text,
        '2. nik': nikController.text,
        '4. alamat': alamatController.text,
        '3. email': phoneController.text,
        '5. nohp': nohpController.text,
        'password': passwordController.text
      });
      print('Registration successful');
      navigateToLoginPage(context);
    } catch (e) {
      print('Registration failed: $e');
      showToast(
          message: "Some error happend",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }
}
