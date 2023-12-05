// ignore_for_file: empty_catches

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('shopping_list');

  XFile? file;
  String? imageUrl;
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add a widget to display the selected image
        if (imageBytes != null) Image.memory(imageBytes!),

        // Add the IconButton for picking an image
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
              // Upload the image to Firebase Storage
              await referenceImageToUpload.putFile(File(file!.path));

              // Get the download URL of the uploaded image
              imageUrl = await referenceImageToUpload.getDownloadURL();

              // Load the image bytes for displaying in Flutter web
              List<int> bytes = await File(file!.path).readAsBytes();
              setState(() {
                imageBytes = Uint8List.fromList(bytes);
              });
            } catch (error) {
              // Handle the error
              print(error.toString());
            }
          },
          icon: const Icon(Icons.camera_alt),
        ),
        ElevatedButton(
          onPressed: () async {
            // Check if an image is uploaded
            if (imageUrl == null || imageUrl!.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please upload an image')));
              return;
            }

            // Validate the form
            if (key.currentState!.validate()) {
              String itemName = _controllerName.text;
              String itemQuantity = _controllerQuantity.text;
              Map<String, String> dataToSend = {
                'name': itemName,
                'quantity': itemQuantity,
                'image': imageUrl!,
              };

              // Add data to Firestore
              try {
                await _reference.add(dataToSend);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Data uploaded successfully')));
              } catch (error) {
                // Handle the error
                print(error.toString());
              }
            }
          },
          child: const Text('Submit'),
        )
      ],
    );
  }
}
