import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/data/models/user_model.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController
  User user = User();
  bool isLoading = true;
  @override
  void onInit() {
    super.onInit();
    getUserFromStorage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getUserFromStorage() async {
    isLoading = true;
    final GetStorage box = GetStorage();
    user = await box.read('user');
    isLoading = false;

    update();
  }

  void logout(BuildContext context) async {
    if (await confirm(
      context,
      title: Text('Logout'),
      content: Text('Keluar dari aplikasi?'),
      textOK: Text(
        'Ya, keluar',
        style: TextStyle(color: CustomColorTheme.primaryColor),
      ),
      textCancel: Text(
        'Belum',
        style: TextStyle(color: CustomColorTheme.greyColor),
      ),
    )) {
      final GetStorage box = GetStorage();
      await box.remove('user');
      await box.remove('user_token');
      var userNumpangToken = box.read('user_numpang_token');
      if (userNumpangToken != null) {
        await box.remove('user_numpang');
        await box.remove('user_numpang_token');
      }
      Get.offAllNamed('/login');
    }
  }

  void forceLogout() async {
    final GetStorage box = GetStorage();
    await box.remove('user');
    await box.remove('user_token');
    var userNumpangToken = box.read('user_numpang_token');
    if (userNumpangToken != null) {
      await box.remove('user_numpang');
      await box.remove('user_numpang_token');
    }
    Get.offAllNamed('/login');
  }
}
