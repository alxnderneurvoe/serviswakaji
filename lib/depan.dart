// import 'package:flutter/material.dart';
import './ui/sidebar.dart';

// class HomePage extends StatelessWidget {
//   final bool isBookingServiceAvailable;

//   const HomePage({Key? key, required this.isBookingServiceAvailable}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bengkel Servis Wak Aji'),
//         titleTextStyle: const TextStyle(
//           color: Colors.white,
//           fontSize: 22,
//           fontStyle: FontStyle.italic,
//         ),
//         backgroundColor: Colors.deepPurpleAccent.shade100,
//       ),
//       body: isBookingServiceAvailable
//           ? ListView(
//               children: [
//                 ListTile(
//                   title: const Text('Booking Service 1'),
//                   onTap: () {

//                   },
//                 ),
//               ],
//             )
//           : const Center(
//               child: Column(
//                 children: [
//                   SizedBox(height: 20.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Holla',
//                         style: TextStyle(fontSize: 20.0),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 30.0),
//                   Text(
//                     'Selamat Datang di Bengkel Servis',
//                     style: TextStyle(fontSize: 20.0),
//                   ),
//                   SizedBox(height: 20.0),
//                   Text(
//                     'Layanan Terbaik untuk Kendaraan Anda',
//                     style: TextStyle(fontSize: 16.0, color: Colors.grey),
//                   ),
//                   SizedBox(height: 160.0),
//                   Icon(
//                     Icons.build,
//                     size: 100.0,
//                     color: Colors.blue,
//                   ),
//                   SizedBox(height: 20.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.car_repair,
//                         size: 150.0,
//                         color: Colors.blue,
//                       ),
//                       Icon(
//                         Icons.tire_repair,
//                         size: 100.0,
//                         color: Colors.blue,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//       drawer: const MyDrawer(),
//     );
//   }
// }

////////////////////
import 'package:flutter/material.dart';

class ServiceData {
  final String name; // Atur atribut sesuai dengan struktur data Anda

  ServiceData(this.name);
}

class HomePage extends StatelessWidget {
  final List<ServiceData>
      serviceData; // Gantilah dengan tipe data sesuai dengan data service Anda

  const HomePage({Key? key, required this.serviceData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bengkel Servis Wak Aji'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: serviceData.isNotEmpty
          ? ListView(
              children: serviceData.map((service) {
                return ListTile(
                  title: Text(service.name), // Ganti dengan data yang sesuai
                  onTap: () {
                    // Navigasi ke halaman jadwal servis yang sesuai dengan data service
                  },
                );
              }).toList(),
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selamat Datang di Bengkel Servis',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Layanan Terbaik untuk Kendaraan Anda',
                    style: TextStyle(fontSize: 16.0, color: Colors.grey),
                  ),
                  SizedBox(height: 20.0),
                  Icon(
                    Icons.build,
                    size: 100.0,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.car_repair,
                        size: 150.0,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.tire_repair,
                        size: 100.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
      drawer: const MyDrawer(),
    );
  }
}
