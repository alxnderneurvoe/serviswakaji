// ignore_for_file: library_private_types_in_public_api

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:app_servis/kendaraan/listkendaraan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditKendaraanPage extends StatefulWidget {
  final DocumentSnapshot vehicle;
  const EditKendaraanPage({super.key, required this.vehicle});

  @override
  _EditKendaraanPageState createState() => _EditKendaraanPageState();
}

class _EditKendaraanPageState extends State<EditKendaraanPage> {
  final ListKendaraan listKendaraan = ListKendaraan();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User _user;

  String selectedKendaraan = '';
  String selectedBrand = '';
  String selectedModel = '';
  String selectedType = '';
  TextEditingController kodeDaerah = TextEditingController();
  TextEditingController nomorPolisi = TextEditingController();
  TextEditingController subDaerah = TextEditingController();

  @override
  void initState() {
    super.initState();

    selectedKendaraan = widget.vehicle['Jenis Kendaraan'];
    selectedBrand = widget.vehicle['Perusahaan'];
    selectedModel = widget.vehicle['Merek'];
    selectedType = widget.vehicle['Tipe'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Kendaraan',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDropdown('Jenis', listKendaraan.jenisKendaraan,
                (String? value) {
              setState(() {
                selectedKendaraan = value ?? '';
                selectedBrand = '';
                selectedModel = '';
                selectedType = '';
              });
            }),
            _buildDropdown(
              'Perusahaan',
              listKendaraan.PerusahaanOptions[selectedKendaraan] ?? [],
              (String? value) {
                setState(() {
                  selectedBrand = value ?? '';
                  selectedModel = '';
                  selectedType = '';
                });
              },
            ),
            _buildDropdown(
              'Merek',
              listKendaraan.MerekOptions[selectedBrand] ?? [],
              (String? value) {
                setState(() {
                  selectedModel = value ?? '';
                  selectedType = '';
                });
              },
            ),
            _buildDropdown(
              'Type',
              listKendaraan.TipeOptions[selectedModel] ?? [],
              (String? value) {
                setState(() {
                  selectedType = value ?? '';
                });
              },
            ),
            const SizedBox(height: 20),
            const Text("Plat Kendaraan"),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
                bottom: 30.0,
                top: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: kodeDaerah,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              labelText: 'Kode Daerah',
                              counterText: '',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            maxLength: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: nomorPolisi,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              labelText: 'Nomor Polisi',
                              counterText: '',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                            maxLength: 4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: subDaerah,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              labelText: 'Sub-Daerah',
                              counterText: '',
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              border: OutlineInputBorder(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelStyle: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            maxLength: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                updateVehicle(widget.vehicle.id);
                navigateToPilihKendaraanPage(context);
              },
              child: const Text(
                'Update Vehicle',
                style: TextStyle(color: darkbrown),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label:'),
        DropdownButtonFormField<String>(
          value: options.isNotEmpty ? options.first : null,
          menuMaxHeight: 250,
          items: options.map((option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Future<void> updateVehicle(String documentId) async {
    String platNumber =
        '${kodeDaerah.text.trim()} ${nomorPolisi.text.trim()} ${subDaerah.text.trim()}';
    _user = _auth.currentUser!;
    await _firestore
        .collection('User')
        .doc(_user.uid)
        .collection('Kendaraan')
        .doc(documentId)
        .update({
      'Jenis Kendaraan': selectedKendaraan,
      'Perusahaan': selectedBrand,
      'Merek': selectedModel,
      'Tipe': selectedType,
      'Plat': platNumber,
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Kendaraan berhasil disimpan!'),
        duration: Duration(seconds: 4),
      ));
      navigateToPilihKendaraanPage(context);
    }).catchError((error) {});
  }
}
