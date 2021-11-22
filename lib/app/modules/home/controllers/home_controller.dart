import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/data/models/user_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
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
    final GetStorage box = GetStorage();
    user = await box.read('user');
    isLoading = false;

    update();
  }
}
