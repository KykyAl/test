import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: colorWhite,
                        )),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
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
                            controller.listResponseEntity[0].photoPath == null
                                ? null
                                : DecorationImage(
                                    image: NetworkImage(controller
                                        .selectedindexlist.value.photoPath
                                        .toString()),
                                  ),
                      ),
                      child: controller.listResponseEntity[0].photoPath == null
                          ? SvgPicture.asset(
                              'assets/svg/profile.svg',
                              width: 100,
                              height: 100,
                            )
                          : null))
            ]),
          ),
          Positioned(
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
    );
  }
}
