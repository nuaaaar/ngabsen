import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';

class AttendanceProvider extends GetConnect {
  Future<List<Map<String, List<Attendance>>>> getAttendanceLists(userToken) async {
    List<Map<String, List<Attendance>>> attendances = [];
    String url = baseUrl + "/api/attendance";
    var response = await Dio().get(url,
        options: Options(headers: {"Authorization": "Bearer " + userToken}));
    var responseBody = response.data;
    if (responseBody['status_code'] == 200) {
      var mapList = responseBody['attendances'];
      mapList.forEach((date, attendanceLists) {
        Map<String, List<Attendance>> mapAttendanceLists = {
          date.toString(): (attendanceLists as List)
              .map((attendance) => Attendance.fromJson(attendance))
              .toList()
        };
        attendances.add(mapAttendanceLists);
      });
    }
    return attendances;
  }
}
