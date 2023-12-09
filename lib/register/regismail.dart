// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, empty_catches, avoid_print

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/note.dart';
import '../navigasi/nav.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({super.key});

  @override
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController nohpController = TextEditingController();
  Uint8List? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Registration',
          style: GoogleFonts.novaSquare(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, bottom: 100, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.amber.shade50,
                    child: _selectedImage != null
                        ? ClipOval(
                            child: Image.memory(
                              _selectedImage!,
                              width: 180,
                              height: 180,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(
                            CupertinoIcons.person_alt_circle,
                            size: 150,
                          ),
                  ),
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: _selectedImage != null
                          ? IconButton(
                              onPressed: _pickImage,
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            )
                          : IconButton(
                              onPressed: _pickImage,
                              icon: const Icon(
                                CupertinoIcons.camera,
                                color: Colors.black,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Isi Data Pengguna Baru",
                style: GoogleFonts.novaSquare(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: validateEmail,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: validatePassword,
              ),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama'),
                onChanged: validateName,
              ),
              TextField(
                controller: nikController,
                decoration: const InputDecoration(labelText: 'NIK'),
                onChanged: validateNIK,
              ),
              TextField(
                controller: nohpController,
                decoration: const InputDecoration(labelText: 'No Hp'),
                onChanged: validateMobile,
                maxLength: 13,
                
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
                child: const Text(
                  'Register',
                  style: TextStyle(color: darkbrown, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    try {
      if (_selectedImage == null) {
        // Display an error message or show a dialog indicating that the user must select a photo
        print("Please select a photo");
        return;
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      String uid = userCredential.user!.uid;
      String imagePath = 'user_images/$uid.jpg';
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child(imagePath)
          .putData(_selectedImage!, metadata);

      await uploadTask.whenComplete(() async {
        String imageUrl =
            await FirebaseStorage.instance.ref(imagePath).getDownloadURL();

        await _firestore.collection('User').doc(uid).set({
          '1. nama': namaController.text,
          '2. nik': nikController.text,
          '4. alamat': alamatController.text,
          '3. email': emailController.text,
          '5. nohp': nohpController.text,
          'password': passwordController.text,
          'image': imageUrl,
        });
      });

      navigateToLoginPage(context);
    } catch (e) {
      // Handle registration errors here
      print(e.toString());
    }
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _selectedImage = result.files.first.bytes;
      });
    }
  }
}
