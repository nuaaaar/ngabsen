import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  void getUserFromStorage() async{
    isLoading = true;
    final GetStorage box = GetStorage();
    user = await box.read('user');
    isLoading = false;

    update();
  }

  void logout() async {
    final GetStorage box = GetStorage();
    await box.remove('user');
    await box.remove('user_token');

    Get.offAllNamed('/login');
  }
}
