import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:brief_project/core/helper/session.dart';
import 'package:brief_project/feature/profile/domain/usecase/remoyte_usecase.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/material/color_material.dart';
import '../../../../core/material/resolution_size.dart';
import '../../../../core/material/text_style_material.dart';
import '../../domain/entity/reponse_profile_entity.dart';

class ProfileController extends GetxController {
  final NavigatorHelper navigatorHelper = NavigatorHelper();
  final RemoteUsecase remoteUsecase = RemoteUsecase();
  final ImagePicker _picker = ImagePicker();
  Rx<File?> selectedImage = File('').obs;
  Rx<bool> changePhoto = false.obs;
  RxBool getListDone = false.obs;
  RxString username = ''.obs;
  List<TextEditingController> textControllers = [];

  RxList<ResponseListEntity> listResponseEntity = <ResponseListEntity>[].obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldState = GlobalKey<ScaffoldState>().obs;
  Rx<ResponseListEntity> selectedindexlist =
      ResponseListEntity.fromJson({}).obs;
  Rx<double> lat = 0.0.obs;
  Rx<double> long = 0.0.obs;
  Rx<String> street = ''.obs;
  Rx<int> count = 0.obs;
  Rx<File> photoValueLetter = File('').obs;
  var controllerAuth = Get.put(AuthController());

  getDatauser() {
    getIdList();
    getLocation();
    listResponseEntity.listen((_) {
      textControllers = List.generate(
          listResponseEntity.length, (index) => TextEditingController());
      log(listResponseEntity.length.toString());
    });
    log(listResponseEntity.length.toString());
  }

  onLogOut() async {
    controllerAuth.logout();
    Get.offAllNamed(navigatorHelper.root);
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        submitData(selectedImage.value!.path);
      } else {
        print('No imgage');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> pickgallery(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        submitData(selectedImage.value!.path);
      } else {
        print('No imgage');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> submitData(String filePath) async {
    var uri = Uri.parse('http://192.168.3.105/kendaraan/update.php');
    var request = http.MultipartRequest('POST', uri);

    request.files
        .add(await http.MultipartFile.fromPath('fileToUpload', filePath));
    request.fields['nomerRegistrasi'] =
        selectedindexlist.value.NomerRegistrasi.toString();

    try {
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print('Data sent successfully');
        getIdList();
      } else {
        print('Failed to send data');
      }
      print("Response: $responseBody");
    } catch (e) {
      print('Error uploading file: $e');
    }
  }

  Future<void> submitBodyTemperature(int index) async {
    var uri = Uri.parse('http://192.168.3.105/kendaraan/updateTemeperatur.php');

    try {
      var response = await http.post(
        uri,
        body: {
          'nomerRegistrasi': selectedindexlist.value.NomerRegistrasi.toString(),
          'body_temperature': textControllers[index].text,
        },
      );

      if (response.statusCode == 200) {
        print('Data sent successfully');
        getIdList();
      } else {
        print('Failed to send data');
      }
      print("Response: ${response.body}");
    } catch (e) {
      print('Error sending data: $e');
    }
  }

  showValidatedOpenCamOrGallery() {
    scaffoldState.value.currentState!
        .showBottomSheet(backgroundColor: colorTransparant, (context) {
      return Container(
        padding: EdgeInsets.all(20),
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: colorWhite,
          boxShadow: [
            BoxShadow(
              color: colorGray,
              offset: Offset(3, 3),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () => pickgallery(ImageSource.gallery),
              child: Row(
                children: [
                  Icon(
                    Icons.photo,
                    color: colorPrimary,
                  ),
                  resolutionSize.mediumResolutionSpaceWidth,
                  Text(
                    'Buka galeri',
                    style: materialTextStyle.normalTextStyle,
                  ),
                ],
              ),
            ),
            resolutionSize.largeResolutionSpaceHeight,
            InkWell(
              onTap: () => pickImage(ImageSource.camera),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: colorPrimary,
                  ),
                  resolutionSize.mediumResolutionSpaceWidth,
                  Text(
                    'Buka Camera',
                    style: materialTextStyle.normalTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> location =
        await placemarkFromCoordinates(position.latitude, position.longitude)
            .catchError((e, _) {
      throw e;
    }).onError<SocketException>((error, stackTrace) {
      throw error;
    });
    if (location.isNotEmpty) {
      Placemark placemark = location[0];
      lat.value = position.latitude;
      long.value = position.longitude;
      street.value =
          "${placemark.street},${placemark.locality}, ${placemark.subLocality}, ${placemark.administrativeArea}, ${placemark.postalCode}";
    }
    log("latlong ${lat.value}${long.value}");
  }

  getIdList() async {
    try {
      getListDone.value = false;
      listResponseEntity.clear();
      final response = await getList();
      final responseDecode = jsonDecode(response.body);
      log("profile ${responseDecode}");
      if (responseDecode['status'] == '00') {
        for (var i = 0; i < responseDecode['data'].length; i++) {
          final element = responseDecode['data'][i];
          log("ELEMEN ${element}");
          listResponseEntity.add(ResponseListEntity.fromJson(element));
          log("LIST ${listResponseEntity.length}");
        }
        getListDone.value = true;
      } else {
        print("tidak berjalan");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> getList() {
    return remoteUsecase.getList();
  }
}
