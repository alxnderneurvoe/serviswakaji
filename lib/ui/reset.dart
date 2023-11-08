import 'package:app_servis/model/auth.dart';
import 'package:app_servis/model/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_servis/navigasi/nav.dart';

// ignore: must_be_immutable
class ResetPage extends StatefulWidget {
  ResetPage({Key? key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  bool isReset = false;

  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _resetPassword();
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: isReset
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Send Reset on E-mail",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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

  void _resetPassword() async {
    setState(() {
      isReset = true;
    });

    String email = _emailController.text;

    User? user = await _auth.resetPassword(email);

    setState(() {
      isReset = false;
    });

    if (user == 1) {
      showToast(
        message: "Check your E-mail",
        backgroundColor: Colors.deepPurple,
        textColor: [Colors.deepPurpleAccent],
      );
      navigateToPilihanPage(context);
    } else {
      showToast(
          message: "Some error happend",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }
}
