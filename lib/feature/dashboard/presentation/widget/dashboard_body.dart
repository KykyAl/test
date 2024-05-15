import 'package:brief_project/core/material/resolution_size.dart';
import 'package:brief_project/feature/dashboard/presentation/controller/dashboard._controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/material/color_material.dart';
import '../../../../core/material/text_style_material.dart';

class DashboardBody {
  final controller = Get.find<DashboardConttoller>();
  Widget body(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: colorPrimary,
              thickness: 2,
            ),
            Expanded(child: validatedList(context)),
          ],
        ),
      ),
    );
  }

  validatedList(context) {
    if (controller.getListDone.isFalse) {
      return getListLoading(context);
    } else if (controller.listEntity.isEmpty && controller.getListDone.isTrue) {
      return getListEmty();
    } else {
      return getListLoaded();
    }
  }

  getListLoading(context) {
    return Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        child: SizedBox(width: 200, child: LinearProgressIndicator()));
  }

  getListEmty() {
    return Center(
      child: Text('List Brief Project tidak tersedia.',
          style: materialTextStyle.mediumTextStylePrimaryOpacity6),
    );
  }

  getListLoaded() {
    return ListView.builder(
        itemCount: controller.listEntity.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => _buildCard(
              "${controller.listEntity[index].thumbnailUrl}",
              "Title: ${controller.listEntity[index].title}",
              "Url: ${controller.listEntity[index].url} ",
              "Album ID :${controller.listEntity[index].id}",
            ));
  }

  Widget _buildCard(String image, String title, String album, String id) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(right: 152), height: 15, child: Text(id)),
        ListTile(
          leading: Image.network(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(title),
          subtitle: Text(
            album,
            style: materialTextStyle.formTitleTextStylePrimary,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Divider(
            color: colorPrimary,
            thickness: 2,
          ),
        ),
        resolutionSize.largeResolutionSpaceHeight,
      ],
    );
  }
}
