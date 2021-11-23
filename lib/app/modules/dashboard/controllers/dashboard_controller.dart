import 'package:get/get.dart';
import 'package:ngabsen/app/modules/activity/controllers/activity_controller.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var tabIndex = 0;
  var activityController = Get.find<ActivityController>();
  
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
    if (index == 1) {
      activityController.getAttendances();
    }
    update();
  }
}
