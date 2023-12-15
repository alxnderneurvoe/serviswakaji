// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, empty_catches, avoid_print

import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/note.dart';

class InputBarang extends StatefulWidget {
  const InputBarang({super.key});

  @override
  _InputBarangState createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController deskripsiKontrol = TextEditingController();
  TextEditingController hargaKontrol = TextEditingController();
  TextEditingController namaKontrol = TextEditingController();
  TextEditingController perusahaanKontrol = TextEditingController();
  TextEditingController ratingKontrol = TextEditingController();
  TextEditingController warnaKontrol = TextEditingController();
  Uint8List? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Input Barang',
          style: GoogleFonts.novaSquare(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 50, bottom: 100, right: 20, left: 20),
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
                  "Input Barang",
                  style: GoogleFonts.novaSquare(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                // TextFormField(
                //   controller: perusahaanKontrol,
                //   decoration: const InputDecoration(labelText: 'Perusahaan'),
                //   validator: (value) {
                //     if (value?.isEmpty ?? true) {
                //       return 'Harap mengisi Perusahaan ';
                //     }
                //     return null;
                //   },
                // ),
                TextFormField(
                  controller: namaKontrol,
                  decoration: const InputDecoration(labelText: 'Nama Barang'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Harap mengisi Nama Barang';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: hargaKontrol,
                  decoration: const InputDecoration(labelText: 'Harga Barang'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Harap mengisi Harga Barang';
                    }
                    return null;
                  },
                ),
                // TextFormField(
                //   controller: warnaKontrol,
                //   decoration: const InputDecoration(labelText: 'Warna'),
                //   validator: (value) {
                //     if (value?.isEmpty ?? true) {
                //       return 'Harap mengisi warna';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   controller: ratingKontrol,
                //   decoration: const InputDecoration(labelText: 'Rating'),
                //   maxLength: 1,
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value?.isEmpty ?? true) {
                //       return 'Harap mengisi Rating';
                //     }
                //     return null;
                //   },
                // ),
                TextFormField(
                  controller: deskripsiKontrol,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                  minLines: 1,
                  maxLines: 4,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Harap mengisi Deskripsi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    register();
                  },
                  child: const Text(
                    'Input',
                    style: TextStyle(color: darkbrown, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    try {
      if (_selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a photo'),
            duration: Duration(seconds: 4),
          ),
        );
        return;
      }

      String imagePath = 'ban/${namaKontrol.text.trim()}.jpg';
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child(imagePath)
          .putData(_selectedImage!, metadata);

      await uploadTask.whenComplete(() async {
        String imageUrl =
            await FirebaseStorage.instance.ref(imagePath).getDownloadURL();

        await _firestore
            .collection('produk')
            .doc(namaKontrol.text)
            .set({
          'deskripsi': deskripsiKontrol.text,
          'harga': hargaKontrol.text,
          'nama': namaKontrol.text,
          'perusahaan': 'FEDERAL',
          'rating': 5,
          'warna': 'Hitam',
          'gambar': imageUrl,
          'isFavorite': false,
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data Masuk'),
          duration: Duration(seconds: 4),
        ),
      );
    } catch (e) {
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
