// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, avoid_print

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;

  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _nohpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Data Pelanggan'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: darkbrown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Harap mengisi nama';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nikController,
              decoration: const InputDecoration(labelText: 'NIK'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Harap mengisi nama';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _alamatController,
              decoration: const InputDecoration(labelText: 'Alamat'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Harap mengisi nama';
                }
                return null;
              },
              maxLines: 3,
              minLines: 1,
            ),
            TextFormField(
              controller: _nohpController,
              decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Harap mengisi nama';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _updateUserData();
                navigateToDepanPage(context);
              },
              child: const Text(
                'Simpan Data Pelanggan',
                style: TextStyle(
                  color: kTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getUserData() async {
    try {
      _user = _auth.currentUser!;

      setState(() {});
    } catch (e) {
      print('Failed to get user data: $e');
    }
  }

  Future<void> _updateUserData() async {
    try {
      await _firestore.collection('User').doc(_user.uid).set(
        {
          '1. nama': _namaController.text,
          '2. nik': _nikController.text,
          '4. alamat': _alamatController.text,
          '5. nohp': _nohpController.text
        },
        SetOptions(merge: true),
      );

      await _getUserData();
    } catch (e) {
      print('Failed to update user data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserData();
  }
}
