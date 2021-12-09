import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/data/models/attendance_setting_model.dart';
import 'package:ngabsen/app/data/models/user_model.dart';
import 'package:ngabsen/app/data/providers/attendance_setting_provider.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  bool isLoading = true;
  User user = User();
  String userToken = '';
  var userNumpang;
  String userNumpangToken = '';
  String checkInUser = '--:--';
  String checkOutUser = '--:--';

  AttendanceSetting attendanceSetting = AttendanceSetting();
  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateTime checkInStartTime = DateTime.now();
  DateTime checkInEndTime = DateTime.now();
  DateTime checkOutStartTime = DateTime.now();

  DateFormat timeFormatter = DateFormat('HH:mm');
  String checkInState = 'waiting';
  String checkInText = '--:--';
  String checkOutState = 'waiting';
  String checkOutText = '--:--';

  @override
  void onInit() async {
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    var newUser = await UserProvider().getUserFromApi(newUserToken);
    var newUserNumpangToken = await UserProvider().getUserNumpangToken();
    print("usernumpang token: " + newUserNumpangToken.toString());
    if (newUserNumpangToken != '') {
      var newUserNumpang = await UserProvider().getUserFromApi(newUserNumpangToken);
      await setNewUserNumpang(newUserNumpang);
    }
    var newAttendanceSetting =
        await AttendanceSettingProvider().getAttendanceSettingFromApi();
    await setNewUser(newUser);
    await setNewUserToken(newUserToken);
    await setNewAttendanceSetting(newAttendanceSetting);
    setAttendanceStates();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setNewUser(User newUser) {
    user = newUser;

    isLoading = false;
    update();
    setAttendanceUserText();
    setAttendanceStates();
  }

  setNewUserToken(String newUserToken) {
    userToken = newUserToken;

    isLoading = false;
    update();
  }

  setNewUserNumpang(User newUser) {
    userNumpang = newUser;

    isLoading = false;
    setAttendanceStates();
    update();
  }

  setNewUserNumpangToken(String newUserToken) {
    userNumpangToken = newUserToken;

    isLoading = false;
    update();
  }

  setNewAttendanceSetting(AttendanceSetting newAttendanceSetting) {
    checkInStartTime = DateTime.parse(
        todayDate + ' ' + newAttendanceSetting.checkInStart.toString());
    checkInEndTime = DateTime.parse(
        todayDate + ' ' + newAttendanceSetting.checkInEnd.toString());
    checkInText = timeFormatter.format(checkInStartTime) +
        ' - ' +
        timeFormatter.format(checkInEndTime);

    checkOutStartTime = DateTime.parse(
        todayDate + ' ' + newAttendanceSetting.checkOutStart.toString());
    checkOutText = timeFormatter.format(checkOutStartTime) + ' - selesai';

    isLoading = false;
    setAttendanceStates();
    update();
  }

  setAttendanceUserText() {
    var timeFormatter = DateFormat('HH:mm');
    if (user.todayCheckIn != null) {
      checkInUser = timeFormatter
          .format(DateTime.parse(user.todayCheckIn!.createdAt.toString()));
    } else {
      checkInUser = '--:--';
    }

    if (user.todayCheckOut != null) {
      checkOutUser = timeFormatter
          .format(DateTime.parse(user.todayCheckOut!.createdAt.toString()));
    } else {
      checkOutUser = '--:--';
    }

    isLoading = false;
    update();
  }

  setAttendanceStates() {
    if (userNumpang == null) {
      if (user.todayCheckIn != null) {
        checkInState = 'done';
      } else {
        if (DateTime.now().compareTo(checkInStartTime) >= 0) {
          if (DateTime.now().compareTo(checkInEndTime) > 0) {
            checkInState = 'late';
          } else {
            checkInState = 'ready';
          }
        } else {
          checkInState = 'waiting';
        }
      }

      if (user.todayCheckOut != null) {
        checkOutState = 'done';
      } else {
        if (DateTime.now().compareTo(checkOutStartTime) >= 0) {
          checkOutState = 'ready';
        } else {
          checkOutState = 'waiting';
        }
      }
    } else {
      if (userNumpang.todayCheckIn != null) {
        checkInState = 'done';
      } else {
        if (DateTime.now().compareTo(checkInStartTime) >= 0) {
          if (DateTime.now().compareTo(checkInEndTime) > 0) {
            checkInState = 'late';
          } else {
            checkInState = 'ready';
          }
        } else {
          checkInState = 'waiting';
        }
      }

      if (userNumpang.todayCheckOut != null) {
        checkOutState = 'done';
      } else {
        if (DateTime.now().compareTo(checkOutStartTime) >= 0) {
          checkOutState = 'ready';
        } else {
          checkOutState = 'waiting';
        }
      }
    }

    isLoading = false;
    update();
  }

  void numpangLogout(BuildContext context) async {
    if (await confirm(
      context,
      title: Text('Logout'),
      content: Text('Keluar dari akun numpang?'),
      textOK: Text(
        'Ya, keluar',
        style: TextStyle(color: CustomColorTheme.primaryColor),
      ),
      textCancel: Text(
        'Belum',
        style: TextStyle(color: CustomColorTheme.greyColor),
      ),
    )) {
      final GetStorage box = GetStorage();
      userNumpangToken = '';
      userNumpang = null;
      await box.remove("user_numpang");
      await box.remove("user_numpang_token");
      update();
      Get.offAllNamed("/dashboard");
    }
  }
}
