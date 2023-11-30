// ignore_for_file: avoid_print

import 'package:app_servis/model/note.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_servis/model/auth.dart';
import '../model/komponen.dart';
import '../navigasi/nav.dart';

class PilihanPage extends StatelessWidget {
  const PilihanPage({super.key});
  static String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 107, 93),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 300,
                width: 300,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const ScreenTitle(title: 'Selamat Datang'),
                    const Text(
                      'Aplikasi resmi Bengkel Service Wak Aji\nPastikan kendaraanmu dirawat oleh ahlinya',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 70),
                    Hero(
                      tag: 'login_btn',
                      child: CustomButton(
                        buttonText: 'Login',
                        onPressed: () {
                          navigateToLoginPage(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Hero(
                      tag: 'signup_btn',
                      child: CustomButton(
                        buttonText: 'Sign Up',
                        isOutlined: true,
                        onPressed: () {
                          navigateToRegisPage(context);
                        },
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: lightlite,
                          child: IconButton(
                            icon: const Icon(
                              Icons.phone,
                              color: darkbrown,
                              size: 30,
                            ),
                            onPressed: () {
                              navigateToLoginPhonePage(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: FittedBox(
                            child: FloatingActionButton.large(
                              focusColor: lightlite,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              onPressed: () async {
                                UserCredential? userCredential =
                                    await signInWithGoogle();

                                if (userCredential != null) {
                                  User user = userCredential.user!;
                                  print(
                                      'Signed in with Google: ${user.displayName}');
                                }
                              },
                              backgroundColor: lightlite,
                              child: Image.asset(
                                'assets/images/google.png',
                                height: 50,
                                width: 52,
                                color: darkbrown,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: FittedBox(
                            child: FloatingActionButton.large(
                              focusColor: lightlite,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                              ),
                              onPressed: () async {
                                UserCredential? userCredential =
                                    await signInWithGoogle();

                                if (userCredential != null) {
                                  User user = userCredential.user!;
                                  print(
                                      'Signed in with Google: ${user.displayName}');
                                }
                              },
                              backgroundColor: lightlite,
                              child: Image.asset(
                                'assets/images/facebook.png',
                                height: 60,
                                width: 61,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
