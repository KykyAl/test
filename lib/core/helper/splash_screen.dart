import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:brief_project/core/helper/session.dart';
import 'package:brief_project/feature/login/presentation/page/main%20_login_page.dart';
import 'package:brief_project/feature/profile/presentation/page/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controllerAuth = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/img/spalshscreen.png',
        nextScreen: FutureBuilder(
          future: controllerAuth.tryLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return _validateScreen();
            }
          },
        ),
        splashTransition: SplashTransition.rotationTransition,
      ),
    );
  }

  Widget _validateScreen() {
    if (controllerAuth.isAuth) {
      print("tidak sama dengan null");
      return MainProfil();
    } else {
      print("sama dengan null");
      return MainLoginPage();
    }
  }
}
