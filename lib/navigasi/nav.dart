// import 'package:app_servis/booking/databooking.dart';
import 'package:app_servis/home/depan.dart';
import 'package:app_servis/kendaraan/editkendaraan.dart';
import 'package:app_servis/kendaraan/tambahkendaraan.dart';
import 'package:app_servis/kendaraan/pilihkendaraan.dart';
import 'package:app_servis/main/login.dart';
import 'package:app_servis/main/loginphone.dart';
import 'package:app_servis/main/pilihan.dart';
import 'package:app_servis/main/regis.dart';
import 'package:app_servis/booking/booking.dart';
import 'package:app_servis/main/reset.dart';
import 'package:app_servis/user/profil.dart';
import 'package:app_servis/user/updateuser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// void navigateToDepanPage(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const HomePage(isBookingServiceAvailable: false)),
//   );
// }

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
    MaterialPageRoute(builder: (context) => const PilihanPage()),
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
