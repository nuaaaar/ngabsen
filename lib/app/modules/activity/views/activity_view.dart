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
      body: Container(
        color: CustomColorTheme.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 64),
              child: Text(
                "Riwayat Absensi",
                style: CustomTextTheme.h5.copyWith(color: Colors.white),
              ),
            ),
            GetBuilder<ActivityController>(
              init: ActivityController(),
              builder: (controller) {
                return Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: 24, right: 16, left: 16, bottom: 24),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.attendances.length,
                      itemBuilder: (context, index) {
                        return _cardListView(
                            createdAt: DateTime.parse(controller.attendances[index].createdAt
                                .toString().replaceAll(".000Z", "")),
                            status: controller.attendances[index].status);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _cardListView({@required createdAt, @required status}) {
    var dateFormatter = DateFormat('dd-MM-yyyy');
    var timeFormatter = DateFormat('hh:mm');
    String formattedDate = dateFormatter.format(createdAt);
    String formattedTime = timeFormatter.format(createdAt);
    // print([createdAt, formattedDate, formattedTime]);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: status.toString().toUpperCase() == "CHECK IN"
              ? Colors.green
              : Colors.redAccent,
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
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: CustomTextTheme.subtitle2
                          .copyWith(color: Colors.white),
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
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    formattedTime,
                    style:
                        CustomTextTheme.subtitle2.copyWith(color: Colors.white),
                  )
                ],
              )
            ],
          ),
          Text(
            status.toString().toUpperCase(),
            style: CustomTextTheme.bodyText1
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
    );
  }
}
