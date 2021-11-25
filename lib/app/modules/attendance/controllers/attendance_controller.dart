import 'package:get/get.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';
import 'package:ngabsen/app/data/providers/attendance_provider.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class AttendanceController extends GetxController {
  //TODO: Implement AttendanceController

  List<Map<String, List<Attendance>>> attendances = [];
  var isLoading = true;
  String userToken = '';

  @override
  void onInit() async {
    super.onInit();
    var newUserToken = await UserProvider().getUserToken();
    setNewUserToken(newUserToken);
    var newAttendances = await AttendanceProvider().getAttendanceLists(newUserToken);
    setNewAttendances(newAttendances);
    print("Init halaman attendances");
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
}
