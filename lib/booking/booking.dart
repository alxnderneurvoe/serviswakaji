// ignore_for_file: library_private_types_in_public_api, empty_catches, use_build_context_synchronously

import '../model/note.dart';
import '../navigasi/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onChanged: _handleNamaText,
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
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onChanged: _handleAlamatText,
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
                      onTap: () => _selectDateAndTime(context),
                      child: InputDecorator(
                        decoration: const InputDecoration(
                            labelText: 'Waktu Kedatangan',
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.date_range_rounded)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              DateFormat('dd - MM - yyyy || HH:mm')
                                  .format(selectedDate),
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
                items: [
                  "100% - 76%",
                  "75% - 51%",
                  "50 - 26%",
                  "25% - 1%",
                  "Tidak Tahu"
                ].map<DropdownMenuItem<String>>((String value) {
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
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onChanged: _handleKeluhanText,
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
          'd_Tanggal_order': DateTime.now(),
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

  Future<void> _selectDateAndTime(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: today,
      lastDate: DateTime(2025),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      final TimeOfDay? pickedTime = await showTimePicker(
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
      if (pickedTime != null && pickedTime != selectedTime) {
        TimeOfDay endOfDay = const TimeOfDay(hour: 23, minute: 0);
        if (pickedTime.hour >= 8 && pickedTime.hour < endOfDay.hour) {
          setState(() {
            selectedTime = pickedTime;
          });
        } else if (pickedTime.hour == endOfDay.hour &&
            pickedTime.minute == endOfDay.minute) {
          setState(() {
            selectedTime = pickedTime;
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Peringatan'),
                content: const Text('Waktu harus dalam rentang 08:00 - 23:00'),
                actions: [
                  TextButton(
                    onPressed: () {
                      navigateToBookingPage(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }

      if (pickedTime != null) {
        DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          selectedDate = combinedDateTime;
        });
      }
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

  void _handleNamaText(String value) {
    String sentenceCaseValue = value.toLowerCase();
    List<String> words = sentenceCaseValue.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    sentenceCaseValue = words.join(' ');
    _namaController.value = _namaController.value.copyWith(
      text: sentenceCaseValue,
      selection: TextSelection.collapsed(offset: sentenceCaseValue.length),
    );
  }

  void _handleAlamatText(String value) {
    String sentenceCaseValue = value.toLowerCase();
    List<String> words = sentenceCaseValue.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    sentenceCaseValue = words.join(' ');
    _alamatController.value = _alamatController.value.copyWith(
      text: sentenceCaseValue,
      selection: TextSelection.collapsed(offset: sentenceCaseValue.length),
    );
  }

  void _handleKeluhanText(String value) {
    String sentenceCaseValue = value.toLowerCase();
    List<String> words = sentenceCaseValue.split(' ');
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] = words[i][0].toUpperCase() + words[i].substring(1);
      }
    }
    sentenceCaseValue = words.join(' ');
    _keluhanController.value = _keluhanController.value.copyWith(
      text: sentenceCaseValue,
      selection: TextSelection.collapsed(offset: sentenceCaseValue.length),
    );
  }
}
