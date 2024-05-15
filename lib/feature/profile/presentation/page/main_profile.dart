import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/feature/profile/presentation/controller/profile_controller.dart';
import 'package:brief_project/feature/profile/presentation/widget/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/material/text_style_material.dart';

class MainProfil extends StatefulWidget {
  const MainProfil({super.key});

  @override
  State<MainProfil> createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> {
  final body = ProfileBody();
  final navigatorHelper = NavigatorHelper();
  final controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.getDatauser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List',
          style: materialTextStyle.largeTextStyleWhite,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              print('Logout button pressed');
              controller.onLogOut();
            },
          )
        ],
        backgroundColor: colorBckround,
      ),
      key: controller.scaffoldState.value,
      body: body.body(context),
    );
  }
}
