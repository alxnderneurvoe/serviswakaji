import 'package:app_servis/navigasi/nav.dart';
import 'package:app_servis/ui/sidebar.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String nama = '';
  String nomorHp = '';
  String? jenisKendaraan;
  String platKendaraan = '';
  String nostnk = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String keluhan = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sukses'),
          content: const Text('Pemesanan service berhasil!'),
          actions: [
            TextButton(
              onPressed: () {
                navigateToDepanPage(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Service'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    nama = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Nama Pelanggan'),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    nomorHp = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Nomor HP'),
                keyboardType: TextInputType.phone,
              ),
              DropdownButtonFormField<String>(
                value: jenisKendaraan,
                onChanged: (value) {
                  jenisKendaraan = value;
                },
                items: [
                  'Sepmor - Matic',
                  'Sepmor - Gigi',
                  'Mobil - Matic',
                  'Mobil - Gigi'
                ].map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Jenis Kendaraan',
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'Tanggal : ${selectedDate.toLocal()}'.split(' ')[0],
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Waktu     : ${selectedTime.format(context)}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  IconButton(
                    icon: const Icon(Icons.access_time),
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    keluhan = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Keluhan'),
                maxLines: 4,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  _showSuccessDialog(context);
                },
                child: const Text('Booking Service'),
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
