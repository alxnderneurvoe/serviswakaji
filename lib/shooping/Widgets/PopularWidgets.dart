// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Navigasi/nav.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class PopularWidget extends StatefulWidget {
  const PopularWidget({super.key});

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  late List<DocumentSnapshot> products;

  @override
  void initState() {
    super.initState();

    FirestoreService()
        .getRandomProducts()
        .then((List<DocumentSnapshot> result) {
      setState(() {
        products = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        child: Row(
          children: products.map((DocumentSnapshot product) {
            Map<String, dynamic>? data =
                product.data() as Map<String, dynamic>?;

            if (data == null) {
              return Container();
            }

            bool isFavorite = data['isFavorite'] ?? false;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 170,
                height: 250,
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateToItemPage(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          // child: Image.network(
                          //   data['imageURL'],
                          //   height: 140,
                          // ),
                          child: Image.asset(
                              'assets/images/logo-1024px-black.png',
                              height: 130),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['nama'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['deskripsi'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 9),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp. ${data['harga']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade900,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              FirestoreService().toggleFavoriteStatus(
                                  product.id, !isFavorite);
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: isFavorite
                                  ? Colors.orange.shade900
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FirestoreService {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('produk');

  Future<void> toggleFavoriteStatus(String productId, bool isFavorite) async {
    await productsCollection.doc(productId).update({
      'isFavorite': isFavorite,
    });
  }

  Future<List<DocumentSnapshot<Object?>>> getRandomProducts() async {
    try {
      QuerySnapshot<Object?> querySnapshot =
          await productsCollection.limit(6).get();
      List<DocumentSnapshot<Object?>> productList = querySnapshot.docs;

      productList.shuffle(Random());
      return productList;
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }
}
