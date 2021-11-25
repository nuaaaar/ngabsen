import 'package:get/get.dart';
import 'package:ngabsen/app/modules/activity/controllers/activity_controller.dart';
import 'package:ngabsen/app/modules/attendance/controllers/attendance_controller.dart';
import 'package:ngabsen/app/modules/home/controllers/home_controller.dart';
import 'package:ngabsen/app/modules/setting/controllers/setting_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AttendanceController>(() => AttendanceController());
    Get.lazyPut<ActivityController>(() => ActivityController());
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
