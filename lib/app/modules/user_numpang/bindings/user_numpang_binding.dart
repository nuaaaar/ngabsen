import 'package:get/get.dart';

import '../controllers/user_numpang_controller.dart';

class UserNumpangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNumpangController>(
      () => UserNumpangController(),
    );
  }
}
