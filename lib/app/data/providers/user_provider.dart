import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/user_model.dart';

class UserProvider extends GetConnect {
  
  Future<User> getUserFromApi(userToken) async {
    String url = baseUrl + "/api/auth/me";
    User user = User();
    
    var response = await Dio().post(url,
        options: Options(headers: {"Authorization": "Bearer " + userToken}));
    var responseBody = response.data;
    if (responseBody['status_code'] == 200) {
      GetStorage box = GetStorage();
      user = User.fromJson(responseBody['user']);
      await box.write('user', user);
    }

    return user;
  }

  Future<String> getUserToken() async {
    final GetStorage box = GetStorage();
    var userToken = await box.read('user_token');

    return userToken;
  }

  Future<User> getUserFromStorage() async {
    final GetStorage box = GetStorage();
    User user = await box.read('user');

    return user;
  }
}
