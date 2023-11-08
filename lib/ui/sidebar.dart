import 'package:app_servis/navigasi/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Muhammad Habibillah'),
            accountEmail: Text('bibi@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 60,
              // backgroundImage: // NetworkImage(
                // 'https://i.pinimg.com/736x/e0/1c/ff/e01cff1d12220bfe0ace77bd7c50d855.jpg',
              // ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.space_dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: const Text('Profil'),
            onTap: () {
              navigateToProfilPage(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online_outlined),
            title: const Text('Booking Service'),
            onTap: () {
              navigateToBookingPage(context);
            },
          ),
          const SizedBox(height: 100.0),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}
