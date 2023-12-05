// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, empty_catches

import 'dart:io';
import 'package:flutter/foundation.dart';

import '../model/note.dart';
import '../navigasi/nav.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

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

  String imageUrl = '';
  XFile? file;
  Uint8List? imageBytes;

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
            if (imageBytes != null) Image.memory(imageBytes!),
            IconButton(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? pickedFile =
                    await imagePicker.pickImage(source: ImageSource.camera);

                if (pickedFile == null) return;

                setState(() {
                  file = pickedFile;
                });

                if (kDebugMode) {
                  print('${file?.path}');
                }

                String uniqueFileName =
                    DateTime.now().millisecondsSinceEpoch.toString();

                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = referenceRoot.child('images');
                Reference referenceImageToUpload =
                    referenceDirImages.child(uniqueFileName);

                try {
                  await referenceImageToUpload.putFile(File(file!.path));

                  imageUrl = await referenceImageToUpload.getDownloadURL();

                  List<int> bytes = await File(file!.path).readAsBytes();
                  setState(() {
                    imageBytes = Uint8List.fromList(bytes);
                  });
                } catch (error) {
                  if (kDebugMode) {
                    print(error.toString());
                  }
                }
              },
              icon: const Icon(Icons.camera_alt),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
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
              child: const Text(
                'Register',
                style: TextStyle(color: darkbrown),
              ),
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
        email: emailController.text,
        password: passwordController.text,
      );

      String uid = userCredential.user!.uid;

      await _firestore.collection('User').doc(uid).set({
        '1. nama': namaController.text,
        '2. nik': nikController.text,
        '4. alamat': alamatController.text,
        '3. email': emailController.text,
        '5. nohp': nohpController.text,
        'password': passwordController.text,
        'image': imageUrl,
      });
      navigateToLoginPage(context);
    } catch (e) {}
  }
}
