import 'package:app_servis/ui/booking.dart';
import 'package:app_servis/ui/datauser.dart';
import 'package:app_servis/ui/profil.dart';
import 'package:app_servis/ui/reset.dart';
import 'package:flutter/material.dart';
import 'package:app_servis/depan.dart';
import 'package:app_servis/login.dart';
import 'package:app_servis/regis.dart';
import 'package:app_servis/pilihan.dart';

// void navigateToDepanPage(BuildContext context) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => const HomePage(isBookingServiceAvailable: false)),
//   );
// }

void navigateToDepanPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const HomePage(serviceData: [],)),
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
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
}

void navigateToRegisPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => RegisPage()),
  );
}

void navigateToProfilPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProfilPage()),
  );
}

void navigateToBookingPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BookingPage()),
  );
}

void navigateToIsiDataPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DataPelangganPage()),
  );
}

void navigateToResetPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ResetPage()),
  );
}