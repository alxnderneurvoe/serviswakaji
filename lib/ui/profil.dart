import 'package:app_servis/ui/sidebar.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});
  final String nik = '2021903430027';
  final String nama = 'Muhammad Habibillah';
  final String email = 'bibi@gmail.com';
  final String nomorHp = '081234567890';
  final String jenisKendaraan = 'Motor';
  final String platKendaraan = 'B 1234 CD';
  final String alamat =
      'Jln. Darussalam Gg. Panti Asuhan \n No. 7 Hagu Selatan, \n Kota Lhokseumawe, Aceh, 24351';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const CircleAvatar(
              radius: 60,
              // backgroundImage: NetworkImage(
              //   'https:/i.pinimg.com/736x/e0/1c/ff/e01cff1d12220bfe0ace77bd7c50d855.jpg',
              // ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Alxndern',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'bibi@gmail.com',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
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
                // NAMA
                DataColumn(
                    label: Text('aaaaaaaaaaaaaa',
                        style: TextStyle(color: Color.fromARGB(0, 0, 0, 255)))),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: const [
                DataRow(cells: [
                  // NIK
                  DataCell(Expanded(child: Text('Nama'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('Muhammad Habibillah'))),
                ]),
                DataRow(cells: [
                  // NIK
                  DataCell(Expanded(child: Text('NIK'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('2021903430027'))),
                ]),
                DataRow(cells: [
                  // Nomor HP
                  DataCell(Expanded(child: Text('Nomor Hp'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('081234567890'))),
                ]),
                DataRow(cells: [
                  DataCell(Expanded(child: Text('Alamat'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                          'Jln Darussalan Gg. Panti Asuhan No. 7, Hagu Selatan, Kec. Banda Sakti, Kota Lhokseumawe, Aceh, 23451'),
                    ),
                  )),
                ]),
                DataRow(cells: [
                  // JENIS KELAMIN
                  DataCell(Expanded(child: Text('Jenis Kendaraan'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('Sepeda Motor - Matic'))),
                ]),
                DataRow(cells: [
                  // JENIS KELAMIN
                  DataCell(Expanded(child: Text('Nomor Hp'))),
                  DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('081234567890'))),
                ]),
              ],
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                // Tambahkan aksi yang sesuai untuk tombol Edit Profil
              },
              child: const Text('Edit Profil'),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
