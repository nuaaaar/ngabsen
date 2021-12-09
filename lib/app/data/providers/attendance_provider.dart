import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';

class AttendanceProvider {
  Future<List<Map<String, List<Attendance>>>> getAttendanceLists(
      userToken) async {
    List<Map<String, List<Attendance>>> attendances = [];
    String url = baseUrl + "/api/attendance";
    var response = await Dio().get(url,
        options: Options(headers: {"Authorization": "Bearer " + userToken}));
    var responseBody = response.data;
    if (responseBody['status_code'] == 200) {
      var mapList = responseBody['attendances'];
      if (mapList.isNotEmpty) {
        mapList.forEach((date, attendanceLists) {
          Map<String, List<Attendance>> mapAttendanceLists = {
            date.toString(): (attendanceLists as List)
                .map((attendance) => Attendance.fromJson(attendance))
                .toList()
          };
          attendances.add(mapAttendanceLists);
        });
      }
    }
    return attendances;
  }

  checkIn(userToken, File image) async {
    String url = baseUrl + "/api/attendance/check-in";
    var formData =
        FormData.fromMap({"image": await MultipartFile.fromFile(image.path)});
    try {
      var response = await Dio().post(url,
          options: Options(headers: {"Authorization": "Bearer " + userToken}),
          data: formData);
      print(jsonEncode(response.data));
    } catch (e) {
      Get.snackbar(
        'Kesalahan',
        'Terjadi kesalahan internal',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(24),
      );
    }
  }

  checkOut(userToken, File image, descriptions) async {
    String url = baseUrl + "/api/attendance/check-out";
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path),
      "descriptions": descriptions
    });
    try {
      await Dio().post(url,
          options: Options(headers: {"Authorization": "Bearer " + userToken}),
          data: formData);
    } catch (e) {
      Get.snackbar(
        'Kesalahan',
        'Terjadi kesalahan internal',
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(24),
      );
    }
  }
}
