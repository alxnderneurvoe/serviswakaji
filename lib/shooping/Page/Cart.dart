// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Sidebar/sidebar.dart';
import '../Widgets/AppBarWidget.dart';
import '../Sidebar/CartBottomBar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppBarWidget(),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Order List",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Items
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/drink/kaptenmorgan.png",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Capt. Morgan 60ml",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Live like the Captain. The Captain was here.",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "\$ 10",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 5, top: 15, bottom: 15),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Items
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/food/miekocok.jpg",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Mie Kocok Santuy",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Di kocokin atau kocok sendiri ? \nMie nya mas",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "\$ 10",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 5, top: 15, bottom: 15),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), // Items
                  // Items
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/dessert/ungu.jpeg",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  "Dessert Cup - Taro",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "Seungu Jurusan TIK ini mah gais",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "\$ 10",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40, right: 5, top: 15, bottom: 15),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Items :",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "6",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub-Total :",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "\$ 60",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivery :",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Text(
                                  "\$ 5",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total :",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$ 65",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
