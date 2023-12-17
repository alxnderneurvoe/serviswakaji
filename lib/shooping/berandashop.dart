// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_servis/home/depan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../kendaraan/pilihkendaraan.dart';
import '../model/note.dart';
import '../ui/button/FAB/expandFAB.dart';
import '../ui/button/botbar.dart';
import '../ui/button/floatingbutton.dart';
import '../user/profil.dart';
import 'Widgets/CategoryWidgets.dart';

class BerandaShopPage extends StatefulWidget {
  const BerandaShopPage({super.key});

  @override
  State<BerandaShopPage> createState() => _BerandaShopPageState();
}

class _BerandaShopPageState extends State<BerandaShopPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      CupertinoIcons.search,
                      color: darkbrown,
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 50,
                      width: 385,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 0, left: 10),
            child: Text(
              "Categori",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const CategoriWidget(),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 0, left: 10),
            child: Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // const PopularWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Popular In Maintanance Progress',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                '....................',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Newest",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          // const NewestWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Newest In Maintanance Progress',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                '....................',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: itemTapped,
      ),
      floatingActionButton: ExpandableFab(
        distance: 100,
        children: [
          AboutUsWeb(),
          ChatAdmin(),
          const HowToBookButton(),
        ],
      ),
    );
  }

  void itemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BerandaShopPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => VehicleSelectionPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilPage()),
        );
        break;
    }
  }
}
