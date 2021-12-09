import 'package:get/get.dart';
import 'package:ngabsen/app/data/providers/activity_provider.dart';
import 'package:ngabsen/app/data/providers/attendance_provider.dart';
import 'package:ngabsen/app/data/providers/attendance_setting_provider.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';
import 'package:ngabsen/app/modules/activity/controllers/activity_controller.dart';
import 'package:ngabsen/app/modules/attendance/controllers/attendance_controller.dart';
import 'package:ngabsen/app/modules/home/controllers/home_controller.dart';
import 'package:ngabsen/app/modules/setting/controllers/setting_controller.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  var tabIndex = 0;
  var homeController = Get.find<HomeController>();
  var attendanceController = Get.find<AttendanceController>();
  var activityController = Get.find<ActivityController>();
  var settingController = Get.find<SettingController>();
  var userToken = '';

  @override
  void onInit() async {
    super.onInit();
    userToken = await UserProvider().getUserToken();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  changeTabIndex(int index) {
    tabIndex = index;
    if (userToken != "") {
      if (index == 0) {
        UserProvider()
            .getUserFromApi(userToken)
            .then((user) => homeController.setNewUser(user));
        AttendanceSettingProvider()
            .getAttendanceSettingFromApi()
            .then((setting) => homeController.setNewAttendanceSetting(setting));
        UserProvider().getUserNumpangToken().then((newUserNumpangToken) {
          homeController.userNumpangToken = newUserNumpangToken;
          if (newUserNumpangToken != '') {
            UserProvider()
                .getUserFromApi(newUserNumpangToken)
                .then((newUserNumpang) {
                  homeController.setNewUserNumpang(newUserNumpang);
            });
          }
        });
      } else if (index == 1) {
        attendanceController.isLoading = true;
        AttendanceProvider().getAttendanceLists(userToken).then((attendances) =>
            attendanceController.setNewAttendances(attendances));
      } else if (index == 2) {
        ActivityProvider().getActivities(userToken).then((newActivities) =>
            activityController.setNewActivities(newActivities));
      }
    } else {
      settingController.forceLogout();
    }
    update();
  }
}
