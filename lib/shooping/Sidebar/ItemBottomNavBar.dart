// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBar extends StatelessWidget {
  const ItemBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total :",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              "\$ 65",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 200),
            ElevatedButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              icon: const Icon(CupertinoIcons.cart),
              label: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
