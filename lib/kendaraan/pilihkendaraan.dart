import 'package:app_servis/kendaraan/authkendaraan.dart';
import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:app_servis/ui/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleSelectionPage extends StatefulWidget {
  const VehicleSelectionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleSelectionPageState createState() => _VehicleSelectionPageState();
}

class _VehicleSelectionPageState extends State<VehicleSelectionPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User _user;

  @override
  Widget build(BuildContext context) {
    _user = _auth.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kendaraan Anda',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
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
              }
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
                                showDeleteConfirmationDialog(context, vehicle);
                              },
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    );
                  },
                ),
              );
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
          const SizedBox(height: 25),
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
