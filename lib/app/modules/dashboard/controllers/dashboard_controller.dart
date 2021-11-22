import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var tabIndex = 0;
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  changeTabIndex(int index)
  {
    tabIndex = index;
    update();
  }
}
