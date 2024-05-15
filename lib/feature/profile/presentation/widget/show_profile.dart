import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/material/color_material.dart';
import '../../../../core/material/material_decoration.dart';
import '../controller/profile_controller.dart';

class ShowPhotoProfile extends StatelessWidget {
  const ShowPhotoProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Material(
      color: colorBlack,
      child: Obx(
        () => Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: colorWhite,
                          )),
                      Obx(
                        () => Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.pickgallery(ImageSource.gallery);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: colorWhite,
                                )),
                            controller.changePhoto.isFalse
                                ? SizedBox()
                                : IconButton(
                                    onPressed: () {
                                      controller.resetImage();
                                    },
                                    icon: Icon(
                                      Icons.restore_outlined,
                                      color: colorWhite,
                                    )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() => Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: controller.selectedImage.value.path == ''
                              ? SvgPicture.asset(
                                  'assets/svg/profile.svg',
                                  width: 100,
                                  height: 100,
                                )
                              : Image.file(
                                  controller.selectedImage.value,
                                  fit: BoxFit.cover,
                                )),
                    )),
              ]),
            ),
            controller.changePhoto.isFalse
                ? SizedBox()
                : Positioned(
                    bottom: 0,
                    left: -10,
                    right: -10,
                    child: Container(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Ganti Sekarang'),
                        style: materialDecoration.buttonStyleWhite,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
