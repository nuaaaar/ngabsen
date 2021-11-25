import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/data/models/attendance_setting_model.dart';
import 'package:ngabsen/app/data/models/user_model.dart';
import 'package:ngabsen/app/data/providers/attendance_provider.dart';
import 'package:ngabsen/app/data/providers/attendance_setting_provider.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  bool isLoading = true;
  User user = User();
  String userToken = '';
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
  Icon checkInStateIcon = Icon(
    Icons.error_outline,
    color: CustomColorTheme.greyColor,
  );
  String checkOutState = 'waiting';
  String checkOutText = '--:--';
  Icon checkOutStateIcon = Icon(
    Icons.error_outline,
    color: CustomColorTheme.greyColor,
  );

  @override
  void onInit() async {
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    var newUser = await UserProvider().getUserFromApi(newUserToken);
    var newAttendanceSetting = await AttendanceSettingProvider().getAttendanceSettingFromApi();
    await setNewUser(newUser);
    setNewAttendanceSetting(newAttendanceSetting);
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

  setNewAttendanceSetting(AttendanceSetting newAttendanceSetting) {
    checkInStartTime = DateTime.parse(
        todayDate + ' ' + newAttendanceSetting.checkInStart.toString());
    checkInEndTime = DateTime.parse(
        todayDate + ' ' + newAttendanceSetting.checkInEnd.toString());
    checkInText = timeFormatter.format(checkInStartTime) + ' - ' + timeFormatter.format(checkInEndTime);

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
    }

    if (user.todayCheckOut != null) {
      checkOutUser = timeFormatter
          .format(DateTime.parse(user.todayCheckOut!.createdAt.toString()));
    }

    isLoading = false;
    update();
  }

  setAttendanceStates() {
    print('user: ' + jsonEncode(user));
    print('now: ' +  DateTime.now().toString());
    print('start: ' +  checkInStartTime.toString());
    print('end: ' +  checkInEndTime.toString());
    print('compare: ' + DateTime.now().compareTo(checkInStartTime).toString());
    if (user.todayCheckIn != null) {
      print('sudah check in');
      checkInState = 'done';
      checkInStateIcon = Icon(
        Icons.check_circle,
        color: Colors.green,
      );
    } else {
      if (DateTime.now().compareTo(checkInStartTime) >= 0 &&
          DateTime.now().compareTo(checkInEndTime) <= 0) {
        checkInState = 'ready';
        checkInStateIcon = Icon(
          Icons.access_time,
          color: CustomColorTheme.primaryColor,
        );
      } else {
        if (DateTime.now().compareTo(checkInEndTime) > 0) {
          checkInState = 'closed';
          checkInStateIcon = Icon(
            Icons.highlight_off,
            color: Colors.red,
          );
        } else {
          checkInState = 'waiting';
          checkInStateIcon = Icon(
            Icons.error_outline,
            color: CustomColorTheme.greyColor,
          );
        }
      }
    }
    if (user.todayCheckOut != null) {
      checkOutStateIcon = Icon(
        Icons.check_circle,
        color: Colors.green,
      );
    } else {
      if (DateTime.now().compareTo(checkOutStartTime) >= 0) {
        checkOutState = 'ready';
        checkOutStateIcon = Icon(
          Icons.access_time,
          color: CustomColorTheme.primaryColor,
        );
      } else {
        checkOutState = 'waiting';
        checkOutStateIcon = Icon(
          Icons.error_outline,
          color: CustomColorTheme.greyColor,
        );
      }
    }

    isLoading = false;
    update();
  }
}
