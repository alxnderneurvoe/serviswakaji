import 'package:app_servis/model/auth.dart';
import 'package:app_servis/model/note.dart';
import 'package:app_servis/model/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigasi/nav.dart';

// ignore: must_be_immutable
class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({super.key});

  @override
  State<LoginPhonePage> createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _phoneNumber = TextEditingController();

  bool isSigningIn = false;
  bool isReset = false;

  @override
  void dispose() {
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightlite,
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.hindVadodara(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
        ),
        backgroundColor: darkbrown,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 250,
                width: 250,
                color: kTextColor,
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _phoneNumber,
                      decoration: const InputDecoration(
                        labelText: 'Nomor Handphone',
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _signInPhone();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          color: darkbrown,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: isSigningIn
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     navigateToResetPage(context);
                    //   },
                    //   child: const Text(
                    //     'Forgot Password ?',
                    //     style: TextStyle(color: darkbrown),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register() async {
    try {
      UserCredential userCredential =
          await _auth.InLoginPhoneNumber(
        handphone: emailController.text,
      );

      String uid = userCredential.user!.uid;

      await _firestore.collection('User').doc(uid).set({
        '1. nama': namaController.text,
        '2. nik': nikController.text,
        '4. alamat': alamatController.text,
        '3. email': emailController.text,
        '5. nohp': nohpController.text,
        'password': passwordController.text
      });
      print('Registration successful');
      navigateToLoginPage(context);
    } catch (e) {
      print('Registration failed: $e');
      showToast(
          message: "Some error happend",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }

  void _signInPhone() async {
    setState(() {
      isSigningIn = true;
    });

    String phoneNumber = _phoneNumber.text;

    User? user = await _auth.InLoginPhoneNumber(phoneNumber);

    setState(() {
      isSigningIn = false;
    });

    if (user != null) {
      showToast(
        message: "Login Successfully",
        backgroundColor: Colors.deepPurple,
        textColor: [Colors.deepPurpleAccent],
      );
      // ignore: use_build_context_synchronously
      navigateToDepanPage(context);
    } else {
      showToast(
          message: "Some error happend",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }
}
