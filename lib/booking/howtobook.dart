// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_servis/model/note.dart';
import 'package:app_servis/navigasi/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToBook extends StatefulWidget {
  const HowToBook({super.key});

  @override
  State<HowToBook> createState() => _HowToBookState();
}

class _HowToBookState extends State<HowToBook> {
  int _currentStep = 0;

  List<Step> step = <Step>[
    // STEP 1
    Step(
      title: Text(
        'Tambah Booking',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
          height: 540,
          child: Column(
            children: [
              Text(
                  'Klik Tombol Booking di Dashboard atau pergi ke Side Bar kiri.'),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Di Dashboard',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Image.asset('assets/images/booking/Tambah.png',
                              width: 230),
                        ],
                      ),
                      SizedBox(width: 10),
                      Text('Atau'),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'Di Side Bar',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Image.asset('assets/images/booking/Tambah2.png',
                              width: 230),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ),
    // STEP 2
    Step(
      title: Text(
        'Input Form Booking',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
          height: 500,
          child: Column(
            children: [
              Text(
                  'Isi Form Booking sesuai dengan kendaraan dan keluhan anda.'),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    children: [
                      Image.asset('assets/images/booking/IsiData.png',
                          width: 230),
                    ],
                  ),
                ),
              ),
            ],
          )),
    ),
    // STEP 3
    Step(
      title: Text(
        'Atur Jam',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
          height: 540,
          child: Column(
            children: [
              Text(
                  'Pastikan waktu jam anda sesuai dengan waktu buka bengkel, mulai pukul 08.00 hinggan 23.00.'),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Klik Form Waktu',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Image.asset('assets/images/booking/WaktuField.png',
                            width: 230),
                      ],
                    ),
                    SizedBox(width: 10),
                    Text('Next ->'),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          'Pilih Waktu Booking',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Image.asset('assets/images/booking/Waktu.png',
                            width: 230),
                      ],
                    ),
                    SizedBox(width: 10),
                    Text('Next ->'),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          'Pilih Jam Booking',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Image.asset('assets/images/booking/Jam.png',
                            width: 230),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    ),
    Step(
      title: Text(
        'Selesai',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Klik Tombol Tambah Booking dan selesai.'),
            SizedBox(height: 15),
            Image.asset(
              'assets/images/booking/Book.png',
              width: 400,
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alur Booking Service',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: Stepper(
        currentStep: _currentStep,
        steps: step,
        onStepContinue: () {
          setState(() {
            if (_currentStep < step.length - 1) {
              _currentStep++;
            } else {
              ratingAlert(context);
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        onStepTapped: (step) {
          setState(() {
            _currentStep = step;
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(80.0),
                  ),
                  backgroundColor: MaterialStatePropertyAll(darkbrown),
                ),
                onPressed: details.onStepContinue,
                child: const Text(
                  'Next',
                  style: TextStyle(color: lightlite),
                ),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: details.onStepCancel,
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size.fromWidth(80.0),
                  ),
                  backgroundColor: MaterialStatePropertyAll(light),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(color: darkbrown),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void ratingAlert(BuildContext context) {
    double userRating = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Apakah membantu ?'),
          content: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Berikan penilaian/kepuasan Anda:'),
                const SizedBox(height: 15),
                RatingBar.builder(
                  initialRating: userRating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    userRating = rating;
                  },
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Terimakasih atas penilaian anda ^_^'),
                    duration: Duration(seconds: 4),
                  ),
                );
                navigateToDepanPage(context);
              },
              child: const Text(
                'Kirim',
                style: TextStyle(color: darkbrown),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToDepanPage(context);
              },
              child: const Text(
                'Tidak Sekarang',
                style: TextStyle(color: darkbrown),
              ),
            ),
          ],
        );
      },
    );
  }
}
