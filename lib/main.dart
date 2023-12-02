import 'package:app_servis/main/pilihan.dart';
import 'package:app_servis/ui/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDvuCGeYG2s0ZD20fI6h-OhTvVPDZeapbk",
          authDomain: "servis-6a153.firebaseapp.com",
          projectId: "servis-6a153",
          storageBucket: "servis-6a153.appspot.com",
          messagingSenderId: "1072258321217",
          appId: "1:1072258321217:web:02fdf17a2d8a94cae66fc0"),
    );
  } else {
    await Firebase.initializeApp();
  }
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kelompok 3',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(
              child: PilihanPage(),
            ),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
