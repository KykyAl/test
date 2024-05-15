import 'package:brief_project/core/material/resolution_size.dart';
import 'package:brief_project/feature/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/material/color_material.dart';
import '../../../../core/material/material_decoration.dart';

class ProfileBody {
  final controller = Get.find<ProfileController>();
  final NavigatorHelper _navigatorHelper = NavigatorHelper();

  Widget body(BuildContext context) {
    return Obx(
      () => Center(
        child: ListView.builder(
          itemCount: controller.listResponseEntity.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _buildCard(
                "suratJalan : ${controller.listResponseEntity[index].NamaSuratJalan}",
                "supir: ${controller.listResponseEntity[index].NamaSupir}",
                "regis : ${controller.listResponseEntity[index].NomerRegistrasi}",
                "polisi ${controller.listResponseEntity[index].NomerPolisi}",
                index,
                context);
          },
        ),
      ),
    );
  }

  Widget _buildCard(
    String suratJalan,
    String supir,
    String regis,
    String polisi,
    int index,
    BuildContext context,
  ) {
    return Obx(
      () => Column(
        children: [
          resolutionSize.largeResolutionSpaceHeight,
          InkWell(
            onTap: () => Get.toNamed(_navigatorHelper.openProfilePhoto),
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: colorGray,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                      ),
                    ],
                    image: controller.selectedImage.value.path == ''
                        ? null
                        : DecorationImage(
                            image: FileImage(controller.selectedImage.value),
                            fit: BoxFit.fill,
                          ),
                  ),
                  child: controller.selectedImage.value.path == ''
                      ? Icon(
                          Icons.camera_alt,
                          color: colorGray,
                          size: 50,
                        )
                      : null,
                ),
                resolutionSize.normalResolutionSpaceHeight,
                SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    style: materialDecoration.buttonStylePrimary,
                    onPressed: () {
                      controller.showValidatedOpenCamOrGallery();
                    },
                    child: Text('Edit Profil'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            supir,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            suratJalan,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            regis.toString(),
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            polisi,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            "Lokasi Kordinat",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            "${controller.lat.value}, ${controller.long.value}",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          resolutionSize.largeResolutionSpaceHeight,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.count.value = int.parse(value);
                        } else {
                          controller.count.value = 0;
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "derajat",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: colorPrimary,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
