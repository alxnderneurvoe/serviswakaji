// ignore_for_file: unrelated_type_equality_checks

import '../model/auth.dart';
import '../model/toast.dart';
import '../model/note.dart';
import '../navigasi/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  bool isReset = false;

  @override
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
        backgroundColor: darkbrown,
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
                navigateToLoginPage(context);
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: darkbrown,
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

    if (user == true) {
      showToast(
        message: "Check your E-mail",
        backgroundColor: Colors.deepPurple,
        textColor: [Colors.deepPurpleAccent],
      );
    } else {
      showToast(
          message: "Check your E-mail",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }
}
