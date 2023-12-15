// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewestWidget extends StatefulWidget {
  const NewestWidget({super.key});

  @override
  State<NewestWidget> createState() => _NewestWidgetState();
}

class _NewestWidgetState extends State<NewestWidget> {
  bool isFavRed = false;
  bool isFavSusu = false;
  bool isFavAceh = false;
  bool isFavKweti = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 175,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/drink/susuberuang.jpeg',
                            width: 150,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Susu Beruang",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Bear Brand Rasakan. Kemurnian!",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Mengonsumsi susu Bear Brand mampu memberikan energi yang hilang, melindungi tubuh dari penyakit.",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price :  Rp. 10.000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.cart,
                                  color: Colors.orange.shade900,
                                ),
                                const Padding(padding: EdgeInsets.symmetric()),
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavSusu = !isFavSusu;
                          });
                        },
                        child: Icon(
                          isFavSusu
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavSusu
                              ? Colors.orange.shade900
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 175,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/food/mieaceh.jpg',
                            width: 150,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Mie Goreng Aceh",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Buatan tangan asli Acehnese!",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Mie Aceh adalah masakan mie pedas khas Aceh di Indonesia. Mie kuning tebal dengan irisan daging sapi, daging kambing, atau makanan laut (udang dan cumi) disajikan dalam sup sejenis kari yang gurih dan pedas. Mie Aceh tersedia dalam dua jenis, Mie Aceh goreng dan Mie Aceh kuah.",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Price :  Rp. 10.000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.cart,
                                  color: Colors.orange.shade900,
                                ),
                                const Padding(padding: EdgeInsets.symmetric()),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavAceh = !isFavAceh;
                          });
                        },
                        child: Icon(
                          isFavAceh
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavAceh
                              ? Colors.orange.shade900
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 175,
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
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/food/kwetiau.jpg',
                            width: 150,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Mie Kwetiau",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Ahlinya Kwetiau basah dan kering",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Harga murah, isi melimpah ruah hingga tumpah tumpah. Emang boleh seenak ini mas ?",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Price :  Rp. 12.000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.cart,
                                  color: Colors.orange.shade900,
                                ),
                                const Padding(padding: EdgeInsets.symmetric()),
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavKweti = !isFavKweti;
                          });
                        },
                        child: Icon(
                          isFavKweti
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavKweti
                              ? Colors.orange.shade900
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 175,
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
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/dessert/merah.jpeg',
                            width: 150,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Dessert Cup - Red Velvet",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Manisnya sampai ketulang",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "Rasakan manis brownies terbaik di Indonesia. Lupakan tentangnya, mari coba bersama. Got it now sis",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Price :  Rp. 12.000",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade900,
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.cart,
                                  color: Colors.orange.shade900,
                                ),
                                const Padding(padding: EdgeInsets.symmetric()),
                              ],
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavRed = !isFavRed;
                          });
                        },
                        child: Icon(
                          isFavRed
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color:
                              isFavRed ? Colors.orange.shade900 : Colors.grey,
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
    );
  }
}
