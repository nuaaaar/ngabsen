import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/providers/user_provider.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Ubah Profil'),
          centerTitle: false,
          backgroundColor: CustomColorTheme.primaryColor,
        ),
        body: GetBuilder<ProfileController>(
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
                              child: CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(baseUrl +
                                    controller.user.fotoDiri.toString()),
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColorTheme.whiteGreyColor,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Nama',
                                  hintStyle: CustomTextTheme.caption,
                                  contentPadding: EdgeInsets.all(16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                controller: controller.namaController,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              height: 128,
                              decoration: BoxDecoration(
                                color: CustomColorTheme.whiteGreyColor,
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Alamat',
                                  hintStyle: CustomTextTheme.caption,
                                  contentPadding: EdgeInsets.all(16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                maxLines: null,
                                controller: controller.alamatController,
                                keyboardType: TextInputType.multiline,
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
                                  try {
                                    var response = await UserProvider().updateProfile(
                                        controller.userToken,
                                        controller.namaController.text,
                                        controller.alamatController.text);
                                        if (response['status_code'] == 200) {
                                          Get.offAllNamed("/dashboard");
                                        } else {
                                          Get.snackbar(
                                            'Kesalahan',
                                            response['message'],
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.redAccent,
                                            colorText: Colors.white,
                                            snackPosition: SnackPosition.BOTTOM,
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.all(24),
                                          );
                                        }
                                    print(jsonEncode(response));
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
                                    print("stacktrace:" + stacktrace.toString());
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
