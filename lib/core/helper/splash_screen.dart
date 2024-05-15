import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brief_project/feature/login/presentation/page/main%20_login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/img/spalshscreen.png',
        nextScreen: MainLoginPage(),
        splashTransition: SplashTransition.rotationTransition,
      ),
    );
  }
}
