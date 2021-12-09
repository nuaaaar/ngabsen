import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabsen/app/data/models/user_model.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  User user = User();
  var isLoading = true;
  var userToken = '';
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    var newUser = await UserProvider().getUserFromApi(newUserToken);
    await setNewUser(newUser);
    await setNewUserToken(newUserToken);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setNewUser(User newUser) {
    user = newUser;
    namaController.text = newUser.nama.toString();
    alamatController.text = newUser.alamat.toString();
    isLoading = false;
    update();
  }

  setNewUserToken(String newUserToken) {
    userToken = newUserToken;

    isLoading = false;
    update();
  }
}
