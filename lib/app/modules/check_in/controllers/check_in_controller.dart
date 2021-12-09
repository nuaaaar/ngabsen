import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class CheckInController extends GetxController {
  //TODO: Implement CheckInController

  var image;
  String userToken = '';

  @override
  void onInit() async{
    super.onInit();    
    var newUserToken = '';
    var newUserNumpangToken = await UserProvider().getUserNumpangToken();
    if (newUserNumpangToken  == '') {
      newUserToken = await UserProvider().getUserToken();    
    }else{
      newUserToken = newUserNumpangToken;    
    }
    setNewUserToken(newUserToken);
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
