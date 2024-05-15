import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/helper/splash_screen.dart';
import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/feature/dashboard/presentation/controller/dashboard._controller.dart';
import 'package:brief_project/feature/dashboard/presentation/page/main_dashboard.dart';
import 'package:brief_project/feature/login/presentation/controller/controller_login.dart';
import 'package:brief_project/feature/profile/presentation/controller/profile_controller.dart';
import 'package:brief_project/feature/profile/presentation/page/main_profile.dart';
import 'package:brief_project/feature/profile/presentation/widget/show_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/login/presentation/page/main _login_page.dart';
import 'feature/login/presentation/page/main_register.dart';

void main() {
  runApp(const MyApp());
}

class Dependency implements Bindings {
  @override
  void dependencies() {
    Get.put<DashboardConttoller>(DashboardConttoller());
    Get.put<ProfileController>(ProfileController());
    Get.put<LoginController>(LoginController());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorHelper = NavigatorHelper();
    return GetMaterialApp(
        color: colorWhite,
        initialBinding: Dependency(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
                devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
            child: child!),
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            bottomAppBarTheme: BottomAppBarTheme(
                elevation: 0.0,
                padding: EdgeInsets.only(
                  top: 10,
                ))),
        getPages: [
          GetPage(
            name: navigatorHelper.login,
            page: () => MainLoginPage(),
          ),
          GetPage(
            name: navigatorHelper.dashboard,
            page: () => MainDashBoard(),
          ),
          GetPage(
            name: navigatorHelper.profile,
            page: () => MainProfil(),
          ),
          GetPage(
            name: navigatorHelper.openProfilePhoto,
            page: () => ShowPhotoProfile(),
          ),
          GetPage(
            name: navigatorHelper.register,
            page: () => Mainregister(),
          )
        ],
        home: SplashScreen());
  }
}
