import 'package:brief_project/feature/login/presentation/widget/register_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_login.dart';

class Mainregister extends StatefulWidget {
  const Mainregister({super.key});

  @override
  State<Mainregister> createState() => _MainregisterState();
}

class _MainregisterState extends State<Mainregister> {
  final controller = Get.find<LoginController>();

  final Register register = Register();
  @override
  void initState() {
    controller.build();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: register.body(context),
    );
  }
}
