import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 0, 24.2, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/logo-text.png',
                          width: 256,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Divider()),
                            ),
                            Text(
                              "Masuk untuk melanjutkan",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: CustomColorTheme.blackColor),
                            ),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Divider()),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColorTheme.whiteGreyColor,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller) {
                              return TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    hintStyle: CustomTextTheme.caption,
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  controller: controller.usernameController);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: CustomColorTheme.whiteGreyColor,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller) {
                              return TextFormField(
                                  obscureText: controller.obscureText,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: CustomTextTheme.caption,
                                    contentPadding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    suffixIcon: IconButton(
                                      color: CustomColorTheme.greyColor,
                                      splashRadius: 1,
                                      icon: Icon(!controller.obscureText
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                      onPressed: controller.toggleObscureText,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  controller: controller.passwordController);
                            },
                          ),
                        ),
                        SizedBox(height: 48),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: CustomColorTheme.primaryColor,
                              borderRadius: BorderRadius.circular(14)),
                          child: GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (controller) {
                              return TextButton(
                                onPressed: () {
                                  controller.login(
                                      username:
                                          controller.usernameController.text,
                                      password:
                                          controller.passwordController.text);
                                },
                                child: Text(
                                  "Masuk",
                                  style: CustomTextTheme.button
                                      .copyWith(color: Colors.white),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
