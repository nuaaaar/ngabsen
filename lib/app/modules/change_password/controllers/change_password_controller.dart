import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class ChangePasswordController extends GetxController {
  //TODO: Implement ChangePasswordController
  var isLoading = true;
  var userToken = '';
  bool obscureText = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() async{
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    await setNewUserToken(newUserToken);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void toggleObscureText() {
    obscureText = !obscureText;
    print(obscureText);
    update();
  }

  setNewUserToken(String newUserToken) {
    userToken = newUserToken;

    isLoading = false;
    update();
  }
}
