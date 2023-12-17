// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations, avoid_print

import '../home/depan.dart';
import '../kendaraan/pilihkendaraan.dart';
import '../model/note.dart';
import '../navigasi/nav.dart';
import '../shooping/berandashop.dart';
import '../ui/button/FAB/expandFAB.dart';
import '../ui/button/botbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ui/button/floatingbutton.dart';
import 'hapusakun.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _currentIndex = 3;

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
      backgroundColor: lightlite,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              // child: Image.network('${_userData['image']}'),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Pelanggan',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_user.email}',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DATA DIRI PELANGGAN',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            DataTable(
              dataRowMinHeight: 40.0,
              columnSpacing: 10.0,
              columns: const [
                DataColumn(
                  label: Text('..............',
                      style: TextStyle(color: Color.fromARGB(0, 0, 0, 255))),
                ),
                DataColumn(label: Text('')),
                DataColumn(
                  label: Text(
                      '.......................................................................................',
                      style: TextStyle(color: Color.fromARGB(0, 0, 0, 255))),
                ),
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
                  const DataCell(Text('Alamat')),
                  const DataCell(Text(':')),
                  DataCell(Text('${_userData['4. alamat']}',
                      textAlign: TextAlign.justify)),
                ]),
                const DataRow(cells: [
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                ]),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    navigateToUpdateUserPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(130, 40),
                  ),
                  child: const Text(
                    'Edit Profil',
                    style: TextStyle(
                      color: darkbrown,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    navigateToPilihanPage(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(130, 40),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: darkbrown),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                showDeleteConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(130, 40),
              ),
              child: const Text(
                'Hapus Akun',
                style: TextStyle(color: reddelete),
              ),
            ),
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
