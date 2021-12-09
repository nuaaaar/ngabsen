import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ngabsen/app/data/providers/attendance_provider.dart';
import '../controllers/check_in_controller.dart';

class CheckInView extends GetView<CheckInController> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Check In'),
        centerTitle: false,
        backgroundColor: CustomColorTheme.primaryColor,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GetBuilder<CheckInController>(
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
                    margin: EdgeInsets.only(top: 24),
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
                            'Silahkan ambil foto selfie',
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.BOTTOM,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(24),
                          );
                        } else {
                          await AttendanceProvider()
                              .checkIn(controller.userToken, controller.image);

                          Get.offAllNamed("/dashboard");
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
