// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Navigasi/nav.dart';

class CategoriWidget extends StatelessWidget {
  const CategoriWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Row(
          children: [
            //BAN
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  navigateToBanPage(context);
                },
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/ban.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Ban",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //OLI
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {
                  navigateToItemPage(context);
                },
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/oli.jpg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Oli Mesin",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //RANTAI
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/rantai.jpeg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Rantai",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //V-BELT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/belt.jpg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "V-Belt",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //REM
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/kaliper.jpg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Kaliper & Kampas",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //BUSI
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/busi.jpg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Busi",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //KNALPOT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/knalpot.png",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Knalpot",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // AKSESORIS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 120,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/images/shooping/aksesoris.jpg",
                            height: 90,
                            width: 90,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Aksesoris",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
