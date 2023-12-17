// ignore_for_file: must_be_immutable
import '../model/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VehicleDetailPage extends StatelessWidget {
  final DocumentSnapshot booking;

  const VehicleDetailPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: darkbrown,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Text(
              '${booking['Plat']}',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DATA KENDARAAN',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            DataTable(
              dataRowMinHeight: 40.0,
              columnSpacing: 10.0,
              columns: const [
                DataColumn(
                  label: Text('..............',
                      style: TextStyle(color: Color.fromARGB(0, 0, 0, 255))),
                ),
                DataColumn(label: Text('')),
                DataColumn(label: Text('')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Jenis Kendaraan'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(
                      Expanded(child: Text('${booking['Jenis Kendaraan']}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Pabrikan'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${booking['Perusahaan']}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Model'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${booking['Merek']}'))),
                ]),
                DataRow(cells: [
                  const DataCell(Expanded(child: Text('Tipe'))),
                  const DataCell(Expanded(child: Text(':'))),
                  DataCell(Expanded(child: Text('${booking['Tipe']}'))),
                ]),
                const DataRow(cells: [
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                  DataCell(Expanded(child: Text(''))),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
