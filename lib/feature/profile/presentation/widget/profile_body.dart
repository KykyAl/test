import 'dart:developer';

import 'package:brief_project/core/material/resolution_size.dart';
import 'package:brief_project/feature/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/material/color_material.dart';
import '../../../../core/material/material_decoration.dart';
import '../../../../core/material/text_style_material.dart';

class ProfileBody {
  final controller = Get.find<ProfileController>();
  final NavigatorHelper _navigatorHelper = NavigatorHelper();

  Widget body(BuildContext context) {
    return Obx(
      () => Center(child: validateList(context)),
    );
  }

  getListLoaded() {
    return ListView.builder(
      itemCount: controller.listResponseEntity.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildCard(
            "Surat Jalan : ${controller.listResponseEntity[index].NamaSuratJalan}",
            "Supir : ${controller.listResponseEntity[index].NamaSupir}",
            "Regis : ${controller.listResponseEntity[index].NomerRegistrasi}",
            "Nomer Polisi : ${controller.listResponseEntity[index].NomerPolisi}",
            "${controller.listResponseEntity[index].photoPath}",
            index,
            context);
      },
    );
  }

  validateList(context) {
    if (controller.getListDone.isFalse) {
      return getListLoading(context);
    } else if (controller.listResponseEntity.isEmpty &&
        controller.getListDone.isTrue) {
      return getListEmpty();
    } else {
      return getListLoaded();
    }
  }

  getListLoading(context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        width: 200,
        child: LinearProgressIndicator(),
      ),
    );
  }

  getListEmpty() {
    return Center(
      child: Text(
        'List  tidak tersedia',
        style: materialTextStyle.mediumTextStylePrimaryOpacity6,
      ),
    );
  }

  Widget _buildCard(
    String suratJalan,
    String supir,
    String regis,
    String polisi,
    String img,
    int index,
    BuildContext context,
  ) {
    return Obx(
      () => Column(
        children: [
          resolutionSize.largeResolutionSpaceHeight,
          InkWell(
            onTap: () {
              controller.selectedindexlist.value =
                  controller.listResponseEntity[index];
              log(controller.selectedindexlist.value.photoPath.toString());

              Get.toNamed(_navigatorHelper.openProfilePhoto);
            },
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
                    image:
                        controller.listResponseEntity[index].photoPath == null
                            ? null
                            : DecorationImage(
                                image: NetworkImage(img),
                                fit: BoxFit.fill,
                              ),
                  ),
                  child: controller.listResponseEntity[index].photoPath == null
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
                      controller.selectedindexlist.value =
                          controller.listResponseEntity[index];

                      controller.showValidatedOpenCamOrGallery();
                      log("message => ${controller.selectedindexlist.value.NomerRegistrasi}");
                    },
                    child: Text('Edit Profil'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(supir, style: materialTextStyle.formTitleTextStyle),
          Obx(() => Text(
                'Suhu : ${controller.listResponseEntity[index].bodyTemperature ?? '-'} ∘celcius',
                style: materialTextStyle.normalTextStylePrimary,
              )),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Lokasi Kordinat : ",
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
            ],
          ),
          resolutionSize.largeResolutionSpaceHeight,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: controller.textControllers[index],
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Update suhu...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (value) {
                        log("onChanged ${controller.listResponseEntity[index].NomerRegistrasi}");
                      },
                    ),
                  ),
                  resolutionSize.normalResolutionSpaceWidth,
                  ElevatedButton(
                    onPressed: () {
                      controller.selectedindexlist.value =
                          controller.listResponseEntity[index];
                      controller.submitBodyTemperature(index);
                    },
                    style: materialDecoration.buttonStylePrimary,
                    child: Text('Submit'),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          Divider(
            thickness: 2,
            color: colorPrimary,
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
