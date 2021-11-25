import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/attendance_setting_model.dart';

class AttendanceSettingProvider extends GetConnect {
  
  Future<AttendanceSetting> getAttendanceSettingFromApi() async{
    AttendanceSetting setting = AttendanceSetting();
    String url = baseUrl + "/api/setting";
    var response = await Dio().get(url);
    var responseBody = response.data;
    if (responseBody['status_code'] == 200) {
      setting = AttendanceSetting.fromJson(responseBody['setting']);
    }
    return setting;
  }
}
