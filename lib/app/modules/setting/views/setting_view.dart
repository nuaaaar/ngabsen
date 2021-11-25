import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColorTheme.whiteGreyColor,
      body: SafeArea(
          child: GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: CustomColorTheme.primaryColor,
                padding:
                    EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 64),
                child: Text(
                  "Pengaturan",
                  style: CustomTextTheme.h5.copyWith(color: Colors.white),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                                child: Text(
                                  "Informasi Umum",
                                  style: CustomTextTheme.subtitle2.copyWith(
                                      color: CustomColorTheme.greyColor),
                                )),
                            GestureDetector(
                              onTap: () => Get.toNamed("/privacy-policy"),
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                          color:
                                              CustomColorTheme.whiteGreyColor,
                                          width: 1,
                                        )),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Kebijakan Privasi",
                                            style: CustomTextTheme.bodyText1,
                                          ),
                                          Icon(Icons.chevron_right_rounded)
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Get.toNamed('/terms-conditions'),
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Syarat & Ketentuan",
                                              style: CustomTextTheme.bodyText1,
                                            ),
                                            Icon(Icons.chevron_right_rounded)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                                child: Text(
                                  "Pengaturan Akun",
                                  style: CustomTextTheme.subtitle2.copyWith(
                                      color: CustomColorTheme.greyColor),
                                )),
                            Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                        color: CustomColorTheme.whiteGreyColor,
                                        width: 1,
                                      )),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Ubah Profil",
                                          style: CustomTextTheme.bodyText1,
                                        ),
                                        Icon(Icons.chevron_right_rounded)
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Ubah Password",
                                          style: CustomTextTheme.bodyText1,
                                        ),
                                        Icon(Icons.chevron_right_rounded)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(14)),
                        child: TextButton(
                            onPressed: () {
                              controller.logout();
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
