import 'dart:convert';

import 'package:brief_project/feature/login/domain/useCase/remote_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/helper/navigator_helper.dart';
import '../../../../core/material/color_material.dart';
import '../../data/model/response_login_model.dart';
import '../../data/model/response_regis_model.dart';

class LoginController extends GetxController {
  Rx<int> distence = 0.obs;
  final navigatorHelper = NavigatorHelper();
  final RemoteUsecase remoteUseCase = RemoteUsecase();
  Rx<TextEditingController> username = TextEditingController(text: '').obs;
  Rx<TextEditingController> password = TextEditingController(text: '').obs;
  Rx<TextEditingController> name = TextEditingController(text: '').obs;
  Rx<double> lat = 0.0.obs;
  Rx<double> long = 0.0.obs;
  Rx<String> street = ''.obs;
  RxMap<String, String> dataUser =
      {"username": "test1", "password": '123456'}.obs;

  build() {
    name.value = TextEditingController(text: '');
    username.value = TextEditingController(text: '');
    password.value = TextEditingController(text: '');
    requestLocationPermission();
  }

  onLogin(context) {
    // if (username.value.text == dataUser['username'] &&
    //     password.value.text == dataUser['password']) {
    //   SessionHelper.setUsername(dataUser['username']);
    //   Get.offAllNamed(navigatorHelper.dashboard);
    // } else {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return Dialog(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10)),
    //           child: Container(
    //             height: 150,
    //             padding: EdgeInsets.all(20),
    //             child: Center(
    //                 child: Text('Username dan Password tidak diketahui')),
    //           ),
    //         );
    //       });
    // }
  }

  Future<void> requestLocationPermission() async {
    if (await Permission.location.isGranted) {
      print("Gps aktif");
    } else {
      var status = await Permission.location.request();
      if (status.isGranted) {
        print("2");
      } else {
        print("3");
      }
    }
  }

  void inLogin() async {
    final body = ResponseLogin(
        username: username.value.text, password: password.value.text);
    final response = await login(body: body);
    final responseDecode = jsonDecode(response.body);
    if (responseDecode['message'] == 'Login berhasil') {
      Get.offAllNamed(navigatorHelper.profile);
      Get.snackbar('Selamat Datang', 'Haii',
          backgroundColor: colorPrimary, colorText: colorWhite);
    } else {
      print('tidak berhasil');
      Get.snackbar('Password salah', 'Cek Kembali',
          backgroundColor: Colors.redAccent, colorText: colorWhite);
    }
  }

  void inRegis() async {
    final body = ResponseRegis(
        nama: name.value.text,
        username: username.value.text,
        password: password.value.text);
    final response = await regis(body: body);
    final responseDecode = jsonDecode(response.body);
    if (responseDecode['message'] == 'Registrasi berhasil') {
    } else if (name.value.text.isEmpty ||
        username.value.text.isEmpty ||
        password.value.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi',
          backgroundColor: Colors.red, colorText: colorWhite);
    } else {
      Get.snackbar('Success', 'Pendaftaran berhasil',
          backgroundColor: colorPrimary, colorText: colorWhite);
      Get.offAllNamed(navigatorHelper.login);
    }
  }

  Future<http.Response> login({ResponseLogin? body}) {
    return remoteUseCase.login(body: body);
  }

  Future<http.Response> regis({ResponseRegis? body}) {
    return remoteUseCase.regis(body: body);
  }
}
