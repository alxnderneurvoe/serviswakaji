// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Sidebar/SideBar.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                ),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  "assets/images/avatar.jpg",
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'MASTER',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'fullstackdev@bussines.co.id',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
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
            DataTable(
              dataRowMinHeight: 30.0,
              dataRowMaxHeight: 50.0,
              columnSpacing: 10.0,
              columns: const [
                DataColumn(
                    label: Text('aaaaaaaaaaaaaa',
                        style: TextStyle(color: Color.fromARGB(0, 0, 0, 255)))),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: const [
                DataRow(cells: [
                  DataCell(Expanded(child: Text('UID'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('xrctvyui345678'))),
                ]),
                DataRow(cells: [
                  DataCell(Expanded(child: Text('Nama'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('Muhammad Habibillah'))),
                ]),
                DataRow(cells: [
                  DataCell(Expanded(child: Text('Nomor Hp'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('+62 852 XXXX XXXX'))),
                ]),
                DataRow(cells: [
                  DataCell(Expanded(child: Text('Alamat'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(
                      child: Text(
                          'Jl. Darussalam Gg. Panti Asuhan No. 7, Hagu Selatan, Lhokseumawe'))),
                ]),
                DataRow(cells: [
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                ]),
              ],
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                'Edit Profil',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
