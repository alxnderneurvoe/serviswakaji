// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/cupertino.dart';

import '../../model/auth.dart';
import '../../model/note.dart';
import '../../navigasi/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.userId});
  final String userId;
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseService _firebaseService = FirebaseService();
  late Future<String> _imageUrl;

  late User _user;
  late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
    _imageUrl = _firebaseService.getUserProfileImageURL(widget.userId);
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
              child: FutureBuilder<String>(
                future: _imageUrl, // Assuming _imageUrl is a Future<String>
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      print('Error loading image: ${snapshot.error}');
                      return const Text('Error loading image');
                    }
                    // Use the retrieved image URL
                    return Image.network(
                      snapshot.data!,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                    );
                  } else {
                    // While the Future is still resolving
                    return const CircularProgressIndicator();
                  }
                },
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
          ListTile(
            leading: const Icon(CupertinoIcons.cart),
            title: const Text('Belanja'),
            onTap: () {
              navigateToShopPage(context);
            },
          ),
          const SizedBox(height: 100.0),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              navigateToPilihanPage(context);
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
