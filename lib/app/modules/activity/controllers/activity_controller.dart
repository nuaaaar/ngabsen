import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';

class ActivityController extends GetxController {
  //TODO: Implement ActivityController
  
  List<Attendance> attendances = []; 

  @override
  void onInit() {
    super.onInit();
    getAttendances();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getAttendances() async {
    String url = baseUrl + "/api/attendance";
    try {
      var response = await Dio().get(url);
      var responseBody = response.data;
      if (responseBody['status_code'] == 200) {
        attendances = (responseBody['attendances'] as List).map((attendance) => Attendance.fromJson(attendance)).toList();      
      }
      print(attendances);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
