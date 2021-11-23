import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';

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
                          "Riwayat Absensi",
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
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.attendances.length,
                                  itemBuilder: (context, index) {
                                    return _cardListView(
                                        index,
                                        createdAt: controller
                                            .attendances[index].createdAt
                                            .toString(),
                                        status: controller
                                            .attendances[index].status);
                                  },
                                ),
                        ),
                      )
                    ]);
              })),
    );
  }

  _cardListView(index, {@required createdAt, @required status}) {
    var createdAtParsed = DateTime.parse(createdAt);
    var dateFormatter = DateFormat('dd-MM-yyyy');
    var timeFormatter = DateFormat('hh:mm');
    String formattedDate = dateFormatter.format(createdAtParsed);
    String formattedTime = timeFormatter.format(createdAtParsed);
    // print([createdAt, createdAtParsed, formattedDate, formattedTime]);
    return Container(
      margin: EdgeInsets.fromLTRB(16, index == 0 ? 16 : 0, 16, 8),
      padding: EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: CustomColorTheme.blackColor,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: CustomTextTheme.subtitle2
                          .copyWith(color: CustomColorTheme.blackColor),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.access_time,
                      size: 14,
                      color: CustomColorTheme.blackColor,
                    ),
                  ),
                  Text(
                    formattedTime,
                    style: CustomTextTheme.subtitle2
                        .copyWith(color: CustomColorTheme.blackColor),
                  )
                ],
              )
            ],
          ),
          Text(
            status.toString().toUpperCase(),
            style: CustomTextTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w600,
                color: status.toString().toUpperCase() == "CHECK IN"
                    ? Colors.green
                    : Colors.redAccent),
          )
        ],
      ),
    );
  }
}
