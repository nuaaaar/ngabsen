import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/data/models/attendance_model.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<AttendanceController>(
              init: AttendanceController(),
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
                                        index, controller.attendances[index]);
                                  },
                                ),
                        ),
                      )
                    ]);
              })),
    );
  }

  _cardListView(index, Map mapAttendanceLists) {
    var dateFormatter = DateFormat('dd-MM-yyyy');
    var timeFormatter = DateFormat('HH:mm');
    var timeCheckIn = '--:--';
    var timeCheckOut = '--:--';
    mapAttendanceLists.forEach((date, attendanceLists) {
      List<Attendance> formattedAttendanceLists = attendanceLists.toList();
      for (var attendance in formattedAttendanceLists) {
        if (attendance.status == 'check in') {
          timeCheckIn = timeFormatter.format(DateTime.parse(attendance.createdAt.toString()));
        }else{
          timeCheckOut = timeFormatter.format(DateTime.parse(attendance.createdAt.toString()));
        }
      }
    });
    var date =
        dateFormatter.format(DateTime.parse(mapAttendanceLists.keys.elementAt(0)));
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
            padding: EdgeInsets.all(12),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/check-in.png",
                      width: 64,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check In",
                            style: CustomTextTheme.bodyText1
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Presensi mulai jam kerja",
                            style: CustomTextTheme.caption
                                .copyWith(color: CustomColorTheme.greyColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Text(timeCheckIn),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
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
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/check-out.png",
                      width: 64,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Check Out",
                            style: CustomTextTheme.bodyText1
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Presensi selesai jam kerja",
                            style: CustomTextTheme.caption
                                .copyWith(color: CustomColorTheme.greyColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Text(timeCheckOut),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
