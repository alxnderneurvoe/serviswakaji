import 'package:flutter/material.dart';
import 'package:app_servis/navigasi/nav.dart';

class PilihanPage extends StatefulWidget {
  const PilihanPage({super.key});

  @override
  State<PilihanPage> createState() => _PilihanPageState();
}

class _PilihanPageState extends State<PilihanPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bengkel Servis Wak Aji'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                navigateToLoginPage(context);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                navigateToRegisPage(context);
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
