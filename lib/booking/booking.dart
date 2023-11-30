// ignore_for_file: empty_catches, library_private_types_in_public_api

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookingServicePage extends StatefulWidget {
  const BookingServicePage({super.key});

  @override
  _BookingServicePageState createState() => _BookingServicePageState();
}

class _BookingServicePageState extends State<BookingServicePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  bool isSendData = false;

  late User _user;
  final _formKey = GlobalKey<FormState>();
  TextEditingController kodeDaerah = TextEditingController();
  TextEditingController nomorPolisi = TextEditingController();
  TextEditingController subDaerah = TextEditingController();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();

  String? _selectedMekanik;
  String? _selectedKondisiKarbu;
  String? _selectedRadiator;
  String? _selectedPengapian;
  String? _selectedListrik;
  String? _selectedFisikCat;
  String? _selectedLampu;
  String? _selectedRangka;
  final _keluhanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Service',
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Data Kendaraan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              //PLAT KENDARAAN
              const Text(
                "Plat Kendaraan",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 1.0,
                  top: 16.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.directions_car),
                        const SizedBox(width: 17),
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
              const SizedBox(height: 14),
              // NAMA PELANGGAN
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pelanggan',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.people_alt),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Nama Pelanggan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              // ALAMAT PELANGGAN
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat Pelanggan',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.place),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Alamat Pelanggan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              // TANGGAL
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectDate(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                            labelText: 'Tanggal',
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.date_range_rounded)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              DateFormat('dd - MM - yyyy').format(selectedDate),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // WAKTU
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => _selectTime(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Waktu',
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.alarm),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(selectedTime.format(context)),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // MEKANIK
              DropdownButtonFormField(
                value: _selectedMekanik,
                items: [
                  'Irpan - Spesialis Kelistrikan',
                  'Gusti - Spesialis Mesin Dalam',
                  'Akbar - Spesialis Mesin Samping',
                  'Aufar - Spesialis Rangka',
                  'Mutia - Customer Service Umum'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedMekanik = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Mekanik',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.build),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Pengecekan Kondisi Kendaraan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              // KARBU
              DropdownButtonFormField(
                value: _selectedKondisiKarbu,
                items: ["Baik", "Kurang Baik", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedKondisiKarbu = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kondisi Karbu',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // RADIATOR
              DropdownButtonFormField(
                value: _selectedRadiator,
                items: ["Baik", "Kurang Baik", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRadiator = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kondisi Radiator',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // PENGAPIAN
              DropdownButtonFormField(
                value: _selectedPengapian,
                items: ["Baik", "Kurang Baik", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedPengapian = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kondisi Pengapian',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // LISTRIK
              DropdownButtonFormField(
                value: _selectedListrik,
                items: ["Baik", "Kurang Baik", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedListrik = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kondisi Kelistrikan',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // FISIK CAT
              DropdownButtonFormField(
                value: _selectedFisikCat,
                items: ["100% - 76%", "75% - 51%", "50 - 26%", "25% - 1%", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedFisikCat = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kondisi Fisik Cat',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // LAMPU
              DropdownButtonFormField(
                value: _selectedLampu,
                items: ["Baik", "Kurang Baik", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedLampu = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Kondisi Penerangan/Lampu',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // RANGKA
              DropdownButtonFormField(
                value: _selectedRangka,
                items: ["Baik", "Kurang Baik", "Tidak Tahu"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRangka = value ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Rangka',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.car_repair_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              // KELUHAN
              TextFormField(
                controller: _keluhanController,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Keluhan',
                  labelStyle: TextStyle(fontSize: 15),
                  icon: Icon(Icons.assignment),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Harap mengisi form keluhan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 35),
              // BUTTON BOOKING
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    _saveDataToFirestore();
                    navigateToDepanPage(context);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: darkbrown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: isSendData
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Booking Service",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveDataToFirestore() async {
    String platNumber =
        '${kodeDaerah.text.trim()} ${nomorPolisi.text.trim()} ${subDaerah.text.trim()}';
    try {
      _user = _auth.currentUser!;
      await _firestore
          .collection('User')
          .doc(_user.uid)
          .collection('Booking')
          .doc()
          .set(
        {
          'a_Plat_kendaraan': platNumber,
          'b_Nama_pelanggan': _namaController.text,
          'c_Pelanggan': _alamatController.text,
          'd_Tanggal_booking': selectedDate,
          'e_Mekanik': _selectedMekanik,
          'f_Kondisi_karbu': _selectedKondisiKarbu,
          'g_Radiator': _selectedRadiator,
          'h_Pengapian': _selectedPengapian,
          'i_Listrik': _selectedListrik,
          'j_Fisik_cat': _selectedFisikCat,
          'k_Lampu': _selectedLampu,
          'l_Rangka': _selectedRangka,
          'm_Keluhan': _keluhanController.text,
        },
      );
    } catch (e) {}
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: today,
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      if (picked.isAfter(today) || picked.isAtSameMomentAs(today)) {
        setState(() {
          selectedDate = picked;
        });
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Peringatan'),
              content:
                  const Text('Pilih tanggal hari ini atau setelah hari ini'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (picked != null && picked != selectedTime) {
      TimeOfDay endOfDay = const TimeOfDay(hour: 23, minute: 0);

      if (picked.hour >= 8 && picked.hour < endOfDay.hour) {
        setState(() {
          selectedTime = picked;
        });
      } else if (picked.hour == endOfDay.hour &&
          picked.minute == endOfDay.minute) {
        setState(() {
          selectedTime = picked;
        });
      } else {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Peringatan'),
              content: const Text('Waktu harus dalam rentang 08:00 - 23:00'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
