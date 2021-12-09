import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabsen/app/core/values/strings.dart';

import '../models/activity_model.dart';

class ActivityProvider extends GetConnect {
  Future<List<Activity>> getActivities(userToken) async {
    String url = baseUrl + "/api/activity";
    List<Activity> activities = [];
    try {
      var response = await Dio().get(url,
          options: Options(headers: {"Authorization": "Bearer " + userToken}));
      var responseBody = response.data;
      if (responseBody['status_code'] == 200) {
        activities = (responseBody['activities'] as List).map((activity) => Activity.fromJson(activity)).toList();
        print(jsonEncode(activities));
      }
    } catch (e, stacktrace) {
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

    return activities;
  }
}
