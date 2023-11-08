import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DataPelangganPage extends StatefulWidget {
  @override
  _DataPelangganPageState createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  String nama = '';
  String alamat = '';
  String nohp = '';
  String nik = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Data Pelanggan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
              onChanged: (value) {
                setState(() {
                  nama = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'NIK'),
              onChanged: (value) {
                setState(() {
                  nik = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Alamat'),
              onChanged: (value) {
                setState(() {
                  alamat = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              onChanged: (value) {
                setState(() {
                  nohp = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                DatabaseReference dataPelangganReference =
                    FirebaseDatabase.instance.ref('level/user');
                dataPelangganReference.push().set({
                  'nama': nama,
                  'nik': nik,
                  'alamat': alamat,
                  'nohp': nohp,
                }).then((value) {
                  print('Data berhasil disimpan');
                }).catchError((error) {
                  print('Terjadi kesalahan: $error');
                });
              },
              child: const Text('Simpan Data Pelanggan'),
            ),
          ],
        ),
      ),
    );
  }
}
