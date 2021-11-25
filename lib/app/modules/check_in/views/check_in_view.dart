import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:image_picker/image_picker.dart';
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
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
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
                  width: double.infinity,
                  padding: EdgeInsets.only(bottom: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/selfie.png',
                        height: 256,
                      ),
                      Text('Silahkan ambil gambar')
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: CustomColorTheme.primaryColor),
                    borderRadius: BorderRadius.circular(14)),
                child: TextButton(
                  onPressed: () async{
                    var file = await _picker.pickImage(source: ImageSource.camera);
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
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: CustomTextTheme.button.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
