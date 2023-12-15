// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/note.dart';

class BanPage extends StatefulWidget {
  const BanPage({super.key});

  @override
  State<BanPage> createState() => _BanPageState();
}

class _BanPageState extends State<BanPage> {
  late Future<List<DocumentSnapshot>> productsFuture;
  TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    productsFuture = FirestoreService().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Ban Page',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            searchController.clear();
                            filteredProducts = [];
                          });
                        },
                        icon: const Icon(Icons.clear),
                      )
                    : null,
              ),
              onChanged: (value) async {
                List<DocumentSnapshot> products =
                    await FirestoreService().getProducts();
                setState(() {
                  String query = searchController.text.toLowerCase();
                  filteredProducts = products
                      .where((product) =>
                          product['perusahaan'].toLowerCase().contains(query) ||
                          product['nama'].toLowerCase().contains(query) ||
                          product['deskripsi'].toLowerCase().contains(query))
                      .toList();
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<DocumentSnapshot>>(
                future: productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<DocumentSnapshot> products = snapshot.data!;
                    return ListView.builder(
                      itemCount: filteredProducts.isEmpty
                          ? products.length
                          : filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts.isEmpty
                            ? products[index]
                            : filteredProducts[index];
                        return buildProductCard(product);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(DocumentSnapshot product) {
    Map<String, dynamic>? data = product.data() as Map<String, dynamic>?;

    if (data == null) {
      return Container();
    }

    bool isFav = data['isFavorite'] ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Container(
                  alignment: Alignment.center,
                  // child: Image.network(
                  //   product['gambar'],
                  //   width: 150,
                  // ),
                  child: Image.asset(
                    'assets/images/shooping/ban.png',
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      product['perusahaan'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product['nama'],
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      product['deskripsi'],
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: product['rating'].toDouble(),
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.orange.shade900,
                      ),
                      onRatingUpdate: (index) {},
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price : Rp. ${product['harga']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade900,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              FirestoreService()
                                  .toggleFavoriteStatus(product.id, !isFav);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => const BanPage(),
                              ));
                            },
                            icon: Icon(
                              isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color:
                                  isFav ? Colors.orange.shade900 : Colors.grey,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.cart,
                              color: Colors.orange.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
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

  Future<List<DocumentSnapshot<Object?>>> getProducts() async {
    try {
      QuerySnapshot<Object?> querySnapshot = await productsCollection.get();
      List<DocumentSnapshot<Object?>> productList = querySnapshot.docs;
      return productList;
    } catch (e) {
      print('Data Kosong');
      rethrow;
    }
  }
}
