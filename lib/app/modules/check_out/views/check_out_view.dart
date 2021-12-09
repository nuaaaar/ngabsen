import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/data/providers/attendance_provider.dart';

import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Check Out'),
        centerTitle: false,
        backgroundColor: CustomColorTheme.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GetBuilder<CheckOutController>(
          init: CheckOutController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Foto Selfie',
                      style: CustomTextTheme.subtitle2,
                    ),
                  ),
                  DottedBorder(
                    color: CustomColorTheme.primaryColor,
                    child: Container(
                      height: 256,
                      width: double.infinity,
                      child: controller.image == null
                          ? Image.asset(
                              'assets/images/selfie.png',
                              fit: BoxFit.cover,
                            )
                          : Image.file(controller.image),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: CustomColorTheme.primaryColor),
                        borderRadius: BorderRadius.circular(14)),
                    child: TextButton(
                      onPressed: () async {
                        var img =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (img != null) {
                          controller.setNewImage(img);
                        }
                      },
                      child: Text(
                        "Ambil Gambar",
                        style: CustomTextTheme.button
                            .copyWith(color: CustomColorTheme.primaryColor),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Aktivitas Hari Ini',
                      style: CustomTextTheme.subtitle2,
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: CustomColorTheme.whiteGreyColor,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Tuliskan aktivitas kamu hari ini',
                        hintStyle: CustomTextTheme.caption,
                        contentPadding: EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: null,
                      controller: controller.activityController,
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
                        if (controller.image == null) {
                          Get.snackbar(
                            'Kesalahan',
                            'Foto selfie wajib diisi',
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(24),
                          );
                        } else {
                          if (controller.activityController.text == null) {
                            Get.snackbar(
                              'Kesalahan',
                              'Aktivitas wajib diisi',
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(24),
                            );
                          } else {
                            await AttendanceProvider().checkOut(
                                controller.userToken,
                                controller.image,
                                controller.activityController.text);

                            Get.offAllNamed("/dashboard");
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
            );
          },
        ),
      ),
    );
  }
}
