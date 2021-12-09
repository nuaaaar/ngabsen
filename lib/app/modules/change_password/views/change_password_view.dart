import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Ubah Password'),
          centerTitle: false,
          backgroundColor: CustomColorTheme.primaryColor,
        ),
        body: GetBuilder<ChangePasswordController>(
            initState: (_) {},
            builder: (controller) {
              return controller.isLoading
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ))
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              decoration: BoxDecoration(
                                color: CustomColorTheme.whiteGreyColor,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                obscureText: controller.obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: CustomTextTheme.caption,
                                  contentPadding: EdgeInsets.all(16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    color: CustomColorTheme.greyColor,
                                    splashRadius: 1,
                                    icon: Icon(!controller.obscureText
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: controller.toggleObscureText,
                                  ),
                                ),
                                controller: controller.passwordController,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColorTheme.whiteGreyColor,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                obscureText: controller.obscureText,
                                decoration: InputDecoration(
                                  hintText: 'Konfirmasi Password',
                                  hintStyle: CustomTextTheme.caption,
                                  contentPadding: EdgeInsets.all(16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                controller:
                                    controller.confirmPasswordController,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 24),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: CustomColorTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(14)),
                              child: TextButton(
                                onPressed: () async {
                                  // ignore: unnecessary_null_comparison
                                  if (controller.passwordController.text ==
                                          '' ||
                                      controller
                                              .confirmPasswordController.text ==
                                          '') {
                                    Get.snackbar(
                                      'Kesalahan',
                                      'Semua field wajib diisi',
                                      duration: Duration(seconds: 2),
                                      backgroundColor: Colors.redAccent,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(24),
                                    );
                                  } else {
                                    if (controller.passwordController.text !=
                                        controller
                                            .confirmPasswordController.text) {
                                      Get.snackbar(
                                        'Kesalahan',
                                        'Password dan konfirmasi password tidak cocok',
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(24),
                                      );
                                    } else {
                                      try {
                                        await UserProvider().updatePassword(
                                            controller.userToken,
                                            controller.passwordController.text);
                                        Get.offAllNamed("/dashboard");
                                      } catch (e, stacktrace) {
                                        Get.snackbar(
                                          'Kesalahan',
                                          'Terjadi kesalahan internal',
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.redAccent,
                                          colorText: Colors.white,
                                          snackPosition: SnackPosition.BOTTOM,
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.all(24),
                                        );
                                        print("error:" + e.toString());
                                        print("stacktrace:" +
                                            stacktrace.toString());
                                      }
                                    }
                                  }
                                },
                                child: Text(
                                  "Submit",
                                  style: CustomTextTheme.button
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            }));
  }
}
