// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadingImageToFirebaseStorage extends StatefulWidget {
//   @override
//   _UploadingImageToFirebaseStorageState createState() =>
//       _UploadingImageToFirebaseStorageState();
// }

// class _UploadingImageToFirebaseStorageState
//     extends State<UploadingImageToFirebaseStorage> {
//   File _imageFile;

//   ///NOTE: Only supported on Android & iOS
//   ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
//   final picker = ImagePicker();

//   Future pickImage() async {
//     final pickedFile = await picker.getImage(source: ImageSource.camera);

//     setState(() {
//       _imageFile = File(pickedFile.path);
//     });
//   }
// }
// extends State<UploadingImageToFirebaseStorage> {
//   File _imageFile;

//   ...

//   Future uploadImageToFirebase(BuildContext context) async {
//     String fileName = basename(_imageFile.path);
//     StorageReference firebaseStorageRef =
//         FirebaseStorage.instance.ref().child('uploads/$fileName');
//     StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
//     StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//     taskSnapshot.ref.getDownloadURL().then(
//           (value) => print("Done: $value"),
//         );
//   }
//   ...
// }