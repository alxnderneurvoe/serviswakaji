// ignore_for_file: library_private_types_in_public_api

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

import '../home/depan.dart';
import '../kendaraan/authkendaraan.dart';
import '../model/note.dart';
import '../navigasi/nav.dart';
import '../shooping/berandashop.dart';
import '../ui/button/FAB/expandFAB.dart';
import '../ui/button/botbar.dart';
import '../ui/button/floatingbutton.dart';
import '../user/profil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VehicleSelectionPage extends StatefulWidget {
  const VehicleSelectionPage({super.key});

  @override
  _VehicleSelectionPageState createState() => _VehicleSelectionPageState();
}

class _VehicleSelectionPageState extends State<VehicleSelectionPage> {
  int _currentIndex = 2;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser!;

    return Scaffold(
      backgroundColor: lightlite,
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('User')
                .doc(_user.uid)
                .collection('Kendaraan')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot vehicle = snapshot.data!.docs[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            vehicle['Jenis Kendaraan'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(vehicle['Tipe']),
                              Text(vehicle['Plat']),
                            ],
                          ),
                          onTap: () {
                            navigateToVehicleDetailPage(context, vehicle);
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  navigateToEditKendaraanPage(context, vehicle);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDeleteConfirmationDialog(
                                      context, vehicle);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      const Text(
                        'Data Kendaraan kosong :(',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Silahkan tambah data anda',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: AnimatedSplashScreen(
                          splash: Lottie.asset('assets/loadingcar.json'),
                          splashIconSize: 400,
                          backgroundColor: Colors.transparent,
                          duration: 1000000000,
                          nextScreen: HomePage(),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                );
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              navigateToIsiKendaraanPage(context);
            },
            child: const Text(
              'Tambah Data Kendaraan',
              style: TextStyle(color: darkbrown),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: itemTapped,
      ),
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          AboutUsWeb(),
          ChatAdmin(),
          const HowToBookButton(),
        ],
      ),
    );
  }

  void itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BerandaShopPage()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const VehicleSelectionPage()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilPage()));
        break;
    }
  }
}
