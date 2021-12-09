import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class CheckOutController extends GetxController {
  //TODO: Implement CheckOutController

  var image;
  String userToken = '';
  late TextEditingController activityController;

  @override
  void onInit() async{
    super.onInit();
    activityController = TextEditingController();
    var newUserToken = '';
    var newUserNumpangToken = await UserProvider().getUserNumpangToken();
    if (newUserNumpangToken  == '') {
      newUserToken = await UserProvider().getUserToken();    
    }else{
      newUserToken = newUserNumpangToken;    
    }
    setNewUserToken(newUserToken);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  
  setNewImage(XFile newImage) {
    image = File(newImage.path);
    update();
  }

  setNewUserToken(newUserToken) {
    userToken = newUserToken;
    
    update();
  }
}
