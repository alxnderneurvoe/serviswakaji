// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Navigasi/nav.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            accountName: Text(
              "Muhammad Habibillah",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "fullstackdev@bussines.co.id",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                "assets/images/avatar.jpg",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.red,
            ),
            title: const Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              navigateToHomePage(context);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.person,
              color: Colors.red,
            ),
            title: const Text(
              "Profil",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              navigateToProfilPage(context);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.cart_fill,
              color: Colors.red,
            ),
            title: const Text(
              "Cart",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              navigateToCartPage(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            ),
            title: const Text(
              "Fav List",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // navigateToFavPage(context);
            },
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.settings,
              color: Colors.red,
            ),
            title: const Text(
              "Setting",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 50),
          const ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
