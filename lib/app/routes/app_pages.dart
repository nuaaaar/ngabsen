import 'package:get/get.dart';

import 'package:ngabsen/app/modules/activity/bindings/activity_binding.dart';
import 'package:ngabsen/app/modules/activity/views/activity_view.dart';
import 'package:ngabsen/app/modules/attendance/bindings/attendance_binding.dart';
import 'package:ngabsen/app/modules/attendance/views/attendance_view.dart';
import 'package:ngabsen/app/modules/change_password/bindings/change_password_binding.dart';
import 'package:ngabsen/app/modules/change_password/views/change_password_view.dart';
import 'package:ngabsen/app/modules/check_in/bindings/check_in_binding.dart';
import 'package:ngabsen/app/modules/check_in/views/check_in_view.dart';
import 'package:ngabsen/app/modules/check_out/bindings/check_out_binding.dart';
import 'package:ngabsen/app/modules/check_out/views/check_out_view.dart';
import 'package:ngabsen/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:ngabsen/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ngabsen/app/modules/home/bindings/home_binding.dart';
import 'package:ngabsen/app/modules/home/views/home_view.dart';
import 'package:ngabsen/app/modules/login/bindings/login_binding.dart';
import 'package:ngabsen/app/modules/login/views/login_view.dart';
import 'package:ngabsen/app/modules/privacy_policy/bindings/privacy_policy_binding.dart';
import 'package:ngabsen/app/modules/privacy_policy/views/privacy_policy_view.dart';
import 'package:ngabsen/app/modules/profile/bindings/profile_binding.dart';
import 'package:ngabsen/app/modules/profile/views/profile_view.dart';
import 'package:ngabsen/app/modules/setting/bindings/setting_binding.dart';
import 'package:ngabsen/app/modules/setting/views/setting_view.dart';
import 'package:ngabsen/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:ngabsen/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:ngabsen/app/modules/terms_conditions/bindings/terms_conditions_binding.dart';
import 'package:ngabsen/app/modules/terms_conditions/views/terms_conditions_view.dart';
import 'package:ngabsen/app/modules/user_numpang/bindings/user_numpang_binding.dart';
import 'package:ngabsen/app/modules/user_numpang/views/user_numpang_view.dart';

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
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => AttendanceView(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITIONS,
      page: () => TermsConditionsView(),
      binding: TermsConditionsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_IN,
      page: () => CheckInView(),
      binding: CheckInBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT,
      page: () => CheckOutView(),
      binding: CheckOutBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.USER_NUMPANG,
      page: () => UserNumpangView(),
      binding: UserNumpangBinding(),
    ),
  ];
}
