import '../booking/howtobook.dart';
import '../home/depan.dart';
import '../kendaraan/datakendaraan.dart';
import '../kendaraan/editkendaraan.dart';
import '../kendaraan/tambahkendaraan.dart';
import '../kendaraan/pilihkendaraan.dart';
import '../login/loginmail.dart';
import '../login/loginphone.dart';
import '../pilihan.dart';
import '../register/regismail.dart';
import '../booking/booking.dart';
import '../login/reset.dart';
import '../user/profil.dart';
import '../user/updateuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void navigateToVehicleDetailPage(
    BuildContext context, DocumentSnapshot vehicle) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => VehicleDetailPage(vehicle: vehicle),
    ),
  );
}

void navigateToDepanPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}

void navigateToUpdateUserPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const UpdateUserPage()),
  );
}

void navigateToPilihanPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PilihanPage()),
  );
}

void navigateToLoginPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
}

void navigateToLoginPhonePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginPhonePage()),
  );
}

void navigateToRegisPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RegisPage()),
  );
}

void navigateToProfilPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProfilPage()),
  );
}

void navigateToIsiKendaraanPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const KendaraanPage()),
  );
}

void navigateToPilihKendaraanPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const VehicleSelectionPage()),
  );
}

void navigateToBookingPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BookingServicePage()),
  );
}

void navigateToResetPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ResetPage()),
  );
}

void navigateToHowToBook(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HowToBook()),
  );
}
// void navigateToBookingDetailPage(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => BookingDetailPage()),
//   );
// }

void navigateToEditKendaraanPage(
    BuildContext context, DocumentSnapshot vehicle) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditKendaraanPage(vehicle: vehicle),
    ),
  );
}
