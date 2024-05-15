import 'package:brief_project/feature/login/presentation/controller/controller_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/material/color_material.dart';
import '../widget/login_body.dart';

class MainLoginPage extends StatefulWidget {
  MainLoginPage({super.key});

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  final controller = Get.find<LoginController>();
  final LoginBody loginBody = LoginBody();
  @override
  void initState() {
    controller.build();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorWhite,
      body: loginBody.build(context),
    );
  }
}
