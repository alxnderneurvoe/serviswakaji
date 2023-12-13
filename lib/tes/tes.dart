// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Storage Example'),
        ),
        body: const Center(
          child: ImageFromFirebaseStorage(),
        ),
      ),
    );
  }
}

class ImageFromFirebaseStorage extends StatefulWidget {
  const ImageFromFirebaseStorage({super.key});

  @override
  _ImageFromFirebaseStorageState createState() => _ImageFromFirebaseStorageState();
}

class _ImageFromFirebaseStorageState extends State<ImageFromFirebaseStorage> {
  final String imageUrl = 'your_image_url'; // Replace with your actual image URL

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
    );
  }
}
