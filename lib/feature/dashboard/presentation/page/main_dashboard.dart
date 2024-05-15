import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/material/color_material.dart';
import 'package:brief_project/feature/dashboard/presentation/controller/dashboard._controller.dart';
import 'package:brief_project/feature/dashboard/presentation/widget/dashboard_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/material/text_style_material.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  final navigatorHelper = NavigatorHelper();
  final controller = Get.find<DashboardConttoller>();
  final DashboardBody body = DashboardBody();

  @override
  void initState() {
    controller.build();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Brief Project',
          style: materialTextStyle.largeTextStyleWhite,
        ),
        backgroundColor: colorBckround,
      ),
      body: body.body(context),
    );
  }
}
