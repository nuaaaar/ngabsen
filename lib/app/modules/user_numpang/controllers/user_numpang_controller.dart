import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/user_model.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class UserNumpangController extends GetxController {
  //TODO: Implement UserNumpangController

  var isLoading = true;
  String userToken = '';
  List<User> users = [];

  @override
  void onInit() async {
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    await setNewUserToken(newUserToken);
    var newUsers = await UserProvider().getAllUsers(userToken);
    setNewUsers(newUsers);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setNewUsers(List<User> newUsers) {
    users = newUsers;
    isLoading = false;

    update();
  }

  setNewUserToken(String newUserToken) {
    userToken = newUserToken;

    isLoading = false;
    update();
  }

  void loginAlternative(id) async {
    String url = baseUrl + "/api/auth/login-alternative";
    try {
      var response = await Dio()
          .post(url, data: {"id": id});
      var responseBody = response.data;

      if (responseBody['status_code'] == 200) {
        GetStorage box = GetStorage();
        await box.write('user_numpang', User.fromJson(responseBody['user']));
        await box.write('user_numpang_token', responseBody['user_token']);
        Get.offAllNamed('/dashboard');
      } else {
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
    }
  }
}
