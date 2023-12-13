// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Storage Example'),
        ),
        body: Center(
          child: ImageFromFirebaseStorage(),
        ),
      ),
    );
  }
}

class ImageFromFirebaseStorage extends StatefulWidget {
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
