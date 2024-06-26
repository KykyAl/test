import 'dart:developer';

import 'package:brief_project/core/helper/navigator_helper.dart';
import 'package:brief_project/core/helper/session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller_login.dart';

class LoginBody extends StatelessWidget {
  LoginBody({
    Key? key,
  }) : super(key: key);
  final navigatorHelper = NavigatorHelper();

  @override
  Widget build(context) {
    var controller = Get.find<LoginController>();
    var session = Get.find<AuthController>();
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Testing Project',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: controller.username.value,
            decoration: InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            obscureText: true,
            controller: controller.password.value,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (controller.username.value.text.isEmpty ||
                  controller.password.value.text.isEmpty) {
                Get.snackbar("Hii", "Tolong berikan data yang lengkap ges");
              } else {
                String token = 'token';
                log("token ${token}");
                session.authenticate(token);
                return controller.inLogin();
              }
            },
            child: Text('Login'),
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              Get.toNamed(navigatorHelper.register);
            },
            child: Text('Belum punya akun? Daftar di sini'),
          ),
        ],
      ),
    );
  }
}
