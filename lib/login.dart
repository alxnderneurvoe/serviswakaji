import 'package:app_servis/model/auth.dart';
import 'package:app_servis/model/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './navigasi/nav.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigningIn = false;
  bool isReset = false;

  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _signIn();
              },
              child: Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
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
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                navigateToResetPage(context);
              },
              child: const Text('Forgot Password ?'),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSigningIn = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      isSigningIn = false;
    });

    if (user != null) {
      showToast(
        message: "Login Successfully",
        backgroundColor: Colors.deepPurple,
        textColor: [Colors.deepPurpleAccent],
      );
      navigateToDepanPage(context);
    } else {
      showToast(
          message: "Some error happend",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }
}
