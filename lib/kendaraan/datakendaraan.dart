// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_string_interpolations, avoid_print

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:app_servis/ui/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KendaraanUserPage extends StatefulWidget {
  @override
  _KendaraanUserPageState createState() => _KendaraanUserPageState();
}

class _KendaraanUserPageState extends State<KendaraanUserPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;
  late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kendaraan Pengguna'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: darkbrown,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            CircleAvatar(
              radius: 60,
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
                color: darkbrown,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Alxndern',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '${_user.email}',
              style: const TextStyle(fontSize: 18.0, color: Colors.grey),
            ),
            const SizedBox(height: 50.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DATA DIRI PELANGGAN',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            DataTable(
              dataRowMinHeight: 30.0,
              columnSpacing: 10.0,
              columns: const [
                DataColumn(
                    label: Text('aaaaaaaaaaaaaa',
                        style: TextStyle(color: Color.fromARGB(0, 0, 0, 255)))),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('UID'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${_user.uid}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Nama'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${_userData['1. nama']}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('NIK'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${_userData['2. nik']}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Nomor Hp'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${_userData['5. nohp']}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Alamat'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(
                    child: Text('${_userData['4. alamat']}'),
                  )),
                ]),
                const DataRow(cells: [
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                ]),
              ],
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                navigateToUpdateUserPage(context);
              },
              child: const Text(
                'Edit Profil',
                style: TextStyle(color: darkbrown),
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  Future<void> _getUserData() async {
    try {
      _user = _auth.currentUser!;

      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore.collection('User').doc(_user.uid).get();

      setState(() {
        _userData = userData.data() ??
            {}; // Use null-aware operator to handle null case
      });
    } catch (e) {
      print('Failed to get user data: $e');
    }
  }
}
