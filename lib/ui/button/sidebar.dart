// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  late String imageUrl;

  late User _user;
  late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
    imageUrl='';
    getImageUrl();
  }

  Future<void>getImageUrl()async{
    final ref = _storage.ref().child('gs://servis-6a153.appspot.com/user_images/D6Ae59AcidbpglM52PCLxeQouwy1.jpg');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl=url;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: lightlite,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: brown,
            ),
            accountName: Text('${_userData['1. nama']}'),
            accountEmail: Text('${_user.email}'),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            arrowColor: light,
          ),
          ListTile(
            leading: const Icon(Icons.space_dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              navigateToDepanPage(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: const Text('Profil'),
            onTap: () {
              navigateToProfilPage(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online_outlined),
            title: const Text('Booking Service'),
            onTap: () {
              navigateToBookingPage(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.car_rental_outlined),
            title: const Text('Kendaraan Anda'),
            onTap: () {
              navigateToPilihKendaraanPage(context);
            },
          ),
          const SizedBox(height: 100.0),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }

  Future<void> _getUserData() async {
    try {
      _user = _auth.currentUser!;

      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore.collection('User').doc(_user.uid).get();

      setState(() {
        _userData = userData.data() ?? {};
      });
    } catch (e) {
      print('Failed to get user data: $e');
    }
  }
}