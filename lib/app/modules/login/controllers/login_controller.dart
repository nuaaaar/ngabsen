import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/user_model.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  bool obscureText = true;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
  }

  void toggleObscureText() {
    obscureText = !obscureText;
    print(obscureText);
    update();
  }

  void login({@required username, @required password}) async {
    String url = baseUrl + "/api/auth/login";
    print([url, username, password]);
    try {
      var response = await Dio().post(url, data:{
        "username": username,
        "password": password
      });
      var responseBody = response.data;

      if(responseBody['status_code'] == 200)
      {
        GetStorage box = GetStorage();
        box.write('user', User.fromJson(responseBody['user']));
        box.write('user_token', responseBody['user_token']);
        Get.toNamed('/dashboard');
      }else{
        Get.snackbar(
            'Kesalahan',
            responseBody['message'],
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(24),
        );
      }
    } catch (e) {
      Get.snackbar(
            'Kesalahan',
            'Terjadi kesalahan internal',
            duration: Duration(seconds: 2),
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(24),
        );
      print("catch error");
      print(e);
    }
  }
}
