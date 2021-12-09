import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';
import 'package:ngabsen/app/data/models/attendance_setting_model.dart';
import 'package:ngabsen/app/data/providers/attendance_provider.dart';
import 'package:ngabsen/app/data/providers/attendance_setting_provider.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class AttendanceController extends GetxController {
  //TODO: Implement AttendanceController

  List<Map<String, List<Attendance>>> attendances = [];
  var isLoading = true;
  String userToken = '';

  String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateFormat timeFormatter = DateFormat('HH:mm');
  DateTime checkInEndTime = DateTime.now();

  @override
  void onInit() async {
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    var newAttendances = await AttendanceProvider().getAttendanceLists(newUserToken);
    setNewUserToken(newUserToken);
    setNewAttendances(newAttendances);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setNewUserToken(newUserToken) {
    userToken = newUserToken;
    
    update();
  }

  setNewAttendances(List<Map<String, List<Attendance>>> newAttendances)
  {
    attendances = newAttendances;

    update();
    isLoading = false;
  }

  setNewAttendanceSetting(AttendanceSetting newAttendanceSetting) {
    checkInEndTime = DateTime.parse(
        todayDate + ' ' + newAttendanceSetting.checkInEnd.toString());

    isLoading = false;
    update();
  }
}
