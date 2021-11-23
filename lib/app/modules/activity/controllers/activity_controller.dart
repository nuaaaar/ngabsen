import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';
import 'package:ngabsen/app/data/models/user_model.dart';

class ActivityController extends GetxController {
  //TODO: Implement ActivityController
  
  List<Attendance> attendances = []; 
  var isLoading = true;
  String userToken = '';

  @override
  void onInit() async{
    super.onInit();
    await getUserToken();
    getAttendances();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserToken() async{
    final GetStorage box = GetStorage();
    userToken = await box.read('user_token');
  }

  void getAttendances() async {
    isLoading = true;
    String url = baseUrl + "/api/attendance";
    try {
      var response = await Dio().get(url, options: Options(
        headers: {
          "Authorization": "Bearer " + userToken
        }
      ));
      var responseBody = response.data;
      if (responseBody['status_code'] == 200) {
        attendances = (responseBody['attendances'] as List).map((attendance) => Attendance.fromJson(attendance)).toList();      
      }
      isLoading = false;
      update();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
