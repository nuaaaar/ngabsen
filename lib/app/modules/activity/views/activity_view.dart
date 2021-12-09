import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/data/models/activity_model.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<ActivityController>(
              init: ActivityController(),
              builder: (controller) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: CustomColorTheme.primaryColor,
                        padding: EdgeInsets.only(
                            top: 24, right: 16, left: 16, bottom: 64),
                        child: Text(
                          "Riwayat Aktivitas",
                          style:
                              CustomTextTheme.h5.copyWith(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: controller.isLoading
                              ? Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [CircularProgressIndicator()],
                                ))
                              : controller.activities.isEmpty
                                  ? Center(
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/images/check-in.png",
                                              width: 200,
                                            ),
                                            Text(
                                              "Belum ada riwayat aktivitas",
                                              style: CustomTextTheme.bodyText2
                                                  .copyWith(
                                                      color: CustomColorTheme
                                                          .greyColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.activities.length,
                                  itemBuilder: (context, index) {
                                    return _cardListView(
                                        index, controller.activities[index]);
                                  },
                                ),
                        ),
                      )
                    ]);
              })),
    );
  }

  _cardListView(index, Activity activity) {
    var dateFormatter = DateFormat('dd-MM-yyyy');
    var date =
        dateFormatter.format(DateTime.parse(activity.createdAt.toString()));
    return Container(
      margin: EdgeInsets.fromLTRB(16, index == 0 ? 16 : 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                date,
                style: CustomTextTheme.subtitle2,
              )),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktivitas',
                  style: CustomTextTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  activity.descriptions.toString(),
                  style: CustomTextTheme.bodyText1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
