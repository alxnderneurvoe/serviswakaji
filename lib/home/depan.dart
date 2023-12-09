// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:app_servis/booking/authbooking.dart';
import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:app_servis/ui/button/howbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_servis/ui/button/sidebar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser!;

    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(
          children: [
            const SizedBox(height: 12),
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
                          child: ListTile(
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
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          'Selamat Datang di Aplikasi Bengkel Servis',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Layanan Terbaik untuk Kendaraan Anda',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 80.0),
                        Icon(
                          Icons.build,
                          size: 100.0,
                          color: darkbrown,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.car_repair,
                              size: 150.0,
                              color: darkbrown,
                            ),
                            Icon(
                              Icons.tire_repair,
                              size: 100.0,
                              color: darkbrown,
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
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
      drawer: const MyDrawer(),
      floatingActionButton: const HowToBookButton(),
    );
  }
}
