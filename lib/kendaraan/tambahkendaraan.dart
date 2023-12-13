// ignore_for_file: avoid_print, use_build_context_synchronously

import '../kendaraan/listkendaraan.dart';
import '../model/note.dart';
import '../navigasi/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class KendaraanPage extends StatefulWidget {
  const KendaraanPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KendaraanPageState createState() => _KendaraanPageState();
}

class _KendaraanPageState extends State<KendaraanPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Kendaraan',
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
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildDropdown('Jenis ', listKendaraan.jenisKendaraan, (
              String? value,
            ) {
              setState(() {
                selectedKendaraan = value ?? '';
                selectedBrand = '';
                selectedModel = '';
                selectedType = '';
              });
            }),
            _buildDropdown(
              'Perusahaan ',
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
              'Merek ',
              listKendaraan.MerekOptions[selectedBrand] ?? [],
              (String? value) {
                setState(() {
                  selectedModel = value ?? '';
                  selectedType = '';
                });
              },
            ),
            _buildDropdown(
              'Tipe ',
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
                              labelStyle: TextStyle(fontSize: 12),
                            ),
                            maxLength: 2,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            onChanged: _handleKodeDaerah,
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
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
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
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                            onChanged: _handleSubDaerah,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addUserKendaraan();
                navigateToPilihKendaraanPage(context);
              },
              child: const Text(
                'Simpan Kendaraan',
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
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Future<void> _addUserKendaraan() async {
    String platNumber =
        '${kodeDaerah.text.trim()} ${nomorPolisi.text.trim()} ${subDaerah.text.trim()}';
    try {
      _user = _auth.currentUser!;
      await _firestore
          .collection('User')
          .doc(_user.uid)
          .collection('Kendaraan')
          .doc()
          .set(
        {
          'Jenis Kendaraan': selectedKendaraan,
          'Perusahaan': selectedBrand,
          'Merek': selectedModel,
          'Tipe': selectedType,
          'Plat': platNumber,
        },
      );
      print('Nilai platNumber: $platNumber');
      print('Data saved to Firestore');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kendaraan berhasil disimpan!'),
          duration: Duration(seconds: 4),
        ),
      );
    } catch (e) {
      print('Failed to update user data: $e');
    }
  }

  void _handleSubDaerah(String value) {
    subDaerah.value = subDaerah.value.copyWith(
      text: value.toUpperCase(),
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  void _handleKodeDaerah(String value) {
    kodeDaerah.value = kodeDaerah.value.copyWith(
      text: value.toUpperCase(),
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}
