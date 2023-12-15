// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/note.dart';
import '../ui/button/sidebar.dart';
import 'Widgets/PopularWidgets.dart';
import 'Widgets/CategoryWidgets.dart';
import 'Widgets/NewestWidgets.dart';

class BerandaShopPage extends StatelessWidget {
  const BerandaShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      CupertinoIcons.search,
                      color: darkbrown,
                    ),
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_list),
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
          const PopularWidget(),
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
          const NewestWidget(),
        ],
      ),
      drawer: const MyDrawer(
        userId: '',
      ),
    );
  }
}
