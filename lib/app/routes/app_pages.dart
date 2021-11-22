import 'package:get/get.dart';

import 'package:ngabsen/app/modules/activity/bindings/activity_binding.dart';
import 'package:ngabsen/app/modules/activity/views/activity_view.dart';
import 'package:ngabsen/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:ngabsen/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ngabsen/app/modules/home/bindings/home_binding.dart';
import 'package:ngabsen/app/modules/home/views/home_view.dart';
import 'package:ngabsen/app/modules/login/bindings/login_binding.dart';
import 'package:ngabsen/app/modules/login/views/login_view.dart';
import 'package:ngabsen/app/modules/setting/bindings/setting_binding.dart';
import 'package:ngabsen/app/modules/setting/views/setting_view.dart';
import 'package:ngabsen/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:ngabsen/app/modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
