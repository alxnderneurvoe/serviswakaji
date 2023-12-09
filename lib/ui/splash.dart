import '../pilihan.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 15), () {
      Navigator.pop(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/splashscreen.json'),
      splashIconSize: 400,
      backgroundColor: Colors.white,
      duration: 10000,
      animationDuration: Duration(seconds: 2),
      nextScreen: PilihanPage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
