import 'package:app_servis/model/auth.dart';
import 'package:app_servis/model/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './navigasi/nav.dart';

// ignore: must_be_immutable
class RegisPage extends StatefulWidget {
  RegisPage({Key? key});

  @override
  State<RegisPage> createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  // String? kendaraan;
  // TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // TextEditingController _nikController = TextEditingController();
  // TextEditingController _nohpController = TextEditingController();
  // TextEditingController _platController = TextEditingController();

  bool isSigningUp = false;

  @override
  void dispose() {
    // _nikController.dispose();
    // _namaController.dispose();
    _passwordController.dispose();
    // _nohpController.dispose();
    // _platController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        backgroundColor: Colors.deepPurpleAccent.shade100,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontStyle: FontStyle.italic,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextFormField(
            //   controller: _nikController,
            //   decoration: const InputDecoration(
            //     labelText: 'NIK/No KTP',
            //   ),
            // ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   controller: _namaController,
            //   decoration: const InputDecoration(
            //     labelText: 'Nama',
            //   ),
            // ),
            // const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            // TextFormField(
            //   controller: _nohpController,
            //   decoration: const InputDecoration(
            //     labelText: 'No HP',
            //   ),
            // ),
            // const SizedBox(height: 20),
            // DropdownButtonFormField<String>(
            //   value: kendaraan,
            //   onChanged: (value) {
            //     kendaraan = value;
            //   },
            //   items: [
            //     'Sepmor - Matic',
            //     'Sepmor - Manual',
            //     'Mobil - Matic',
            //     'Mobil - Manual'
            //   ].map((String item) {
            //     return DropdownMenuItem<String>(
            //       value: item,
            //       child: Text(item),
            //     );
            //   }).toList(),
            //   decoration: const InputDecoration(
            //     labelText: 'Jenis Kendaraan',
            //   ),
            // ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   controller: _platController,
            //   decoration: const InputDecoration(
            //     labelText: 'No. Polisi Kendaraan',
            //   ),
            // ),
            // const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    // String nama = _namaController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    // String nik = _nikController.text;
    // String nomorHp = _nohpController.text;
    // String plat = _platController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isSigningUp = false;
    });

    if (user != null) {
      showToast(
          message: "User is successfully created",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
      navigateToIsiDataPage(context);
    } else {
      showToast(
          message: "Some error happend",
          backgroundColor: Colors.deepPurple,
          textColor: [Colors.deepPurpleAccent]);
    }
  }
}
