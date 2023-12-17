// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_servis/ui/button/botbar.dart';
import '../booking/authbooking.dart';
import '../kendaraan/pilihkendaraan.dart';
import '../model/note.dart';
import '../navigasi/nav.dart';
import '../shooping/berandashop.dart';
import '../ui/button/FAB/expandFAB.dart';
import '../ui/button/floatingbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../user/profil.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser!;

    return Scaffold(
      backgroundColor: lightlite,
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: darkbrown,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 50,
              child: const Text(
                'BOOKING LIST',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('User')
                  .doc(_user.uid)
                  .collection('Booking')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot booking = snapshot.data!.docs[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  booking['a_Plat_kendaraan'],
                                  style: const TextStyle(fontSize: 20),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(booking['b_Nama_pelanggan']),
                                    Text(booking['m_Keluhan']),
                                    Text(DateFormat('dd-MM-yyyy, HH:mm').format(
                                        booking['d_Tanggal_booking'].toDate())),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        showDeleteConfirmationDialog(
                                            context, booking);
                                      },
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  // navigateToBookingDetailPage(context);
                                },
                              ),
                            ],
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
                          'Selamat Datang di Aplikasi Bengkel Servis',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Text(
                          'Layanan Terbaik untuk Kendaraan Anda',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 500,
                          child: AnimatedSplashScreen(
                            splash: Lottie.asset('assets/splashscreen.json'),
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
                navigateToBookingPage(context);
              },
              child: const Text(
                'Tambah Booking',
                style: TextStyle(color: darkbrown),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
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
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BerandaShopPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VehicleSelectionPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilPage()),
        );
        break;
    }
  }
}
