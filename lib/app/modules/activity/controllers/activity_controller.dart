import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

class ActivityController extends GetxController {
  //TODO: Implement ActivityController

  List<Map<String, List<Attendance>>> attendances = [];
  var isLoading = true;
  String userToken = '';

  @override
  void onInit() async {
    super.onInit();
    userToken = await UserProvider().getUserToken();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserToken() async {
    final GetStorage box = GetStorage();
    userToken = await box.read('user_token');
  }

}
