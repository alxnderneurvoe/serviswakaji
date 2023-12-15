// ignore_for_file: file_names

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Sidebar/ItemBottomNavBar.dart';
import '../Sidebar/SideBar.dart';
import '../Widgets/AppBarWidget.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            const AppBarWidget(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                "assets/images/drink/orangtua.jpg",
                height: 300,
              ),
            ),
            Arc(
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              height: 30,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemSize: 18,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.orange.shade900,
                              ),
                              onRatingUpdate: (index) {},
                            ),
                            const Text(
                              "\$ 10",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Orang Tua 60ml",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              width: 90,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.plus,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Taste the flavour and fly to the sky. Got it now.Taste the flavour and fly to the sky. Got it now. Taste the flavour and fly to the sky. Got it now",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Time : ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Icon(
                                    CupertinoIcons.clock,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "15 Minutes",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ItemBottomNavBar(),
      drawer: const MyDrawer(),
    );
  }
}
