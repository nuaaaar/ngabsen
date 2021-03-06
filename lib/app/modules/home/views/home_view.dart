
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/core/values/strings.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return controller.isLoading
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ))
                : SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(192, 16),
                                  bottomRight: Radius.elliptical(192, 16)),
                              color: CustomColorTheme.primaryColor,
                            ),
                            padding: EdgeInsets.fromLTRB(16, 24, 16, 60),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Selamat datang kembali",
                                      style: CustomTextTheme.subtitle1
                                          .copyWith(color: Colors.white),
                                    ),
                                    Text(
                                      controller.user.nama.toString(),
                                      style: CustomTextTheme.h6.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(baseUrl +
                                      controller.user.fotoDiri.toString()),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            transform: Matrix4.translationValues(0, -40, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Check In",
                                            style: CustomTextTheme.subtitle2
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text(
                                            controller.checkInUser,
                                            style: CustomTextTheme.subtitle2
                                                .copyWith(
                                                    color: CustomColorTheme
                                                        .greyColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Check Out",
                                            style: CustomTextTheme.subtitle2
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                          Text(
                                            controller.checkOutUser,
                                            style: CustomTextTheme.subtitle2
                                                .copyWith(
                                                    color: CustomColorTheme
                                                        .greyColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            transform: Matrix4.translationValues(0, -40, 0),
                            margin: EdgeInsets.only(top: 32),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Menu",
                                  style: CustomTextTheme.subtitle2,
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.checkInState == 'ready' ||
                                        controller.checkInState == 'late') {
                                      Get.toNamed("/check-in");
                                    } else if (controller.checkInState ==
                                        'done') {
                                      Get.snackbar(
                                        'Kesalahan',
                                        'Check in hanya bisa sekali dalam satu hari',
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(24),
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Kesalahan',
                                        'Tidak dapat melakukan check in saat ini',
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(24),
                                      );
                                    }
                                    print(controller.checkInState);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/check-in.png",
                                              width: 64,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Check In",
                                                    style: CustomTextTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  Text(
                                                    controller.checkInText,
                                                    style: CustomTextTheme
                                                        .subtitle2
                                                        .copyWith(
                                                            color:
                                                                CustomColorTheme
                                                                    .greyColor),
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
                                              _checkInStateIcon(
                                                  controller.checkInState),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () {
                                    if (controller.checkOutState == 'ready') {
                                      Get.toNamed("/check-out");
                                    } else if (controller.checkOutState ==
                                        'done') {
                                      Get.snackbar(
                                        'Kesalahan',
                                        'Check out hanya bisa sekali dalam satu hari',
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(24),
                                      );
                                    } else {
                                      Get.snackbar(
                                        'Kesalahan',
                                        'Tidak dapat melakukan check out saat ini',
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.redAccent,
                                        colorText: Colors.white,
                                        snackPosition: SnackPosition.BOTTOM,
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(24),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                          ),
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/check-out.png",
                                              width: 64,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Check Out",
                                                    style: CustomTextTheme
                                                        .bodyText1
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  Text(
                                                    controller.checkOutText,
                                                    style: CustomTextTheme
                                                        .subtitle2
                                                        .copyWith(
                                                            color:
                                                                CustomColorTheme
                                                                    .greyColor),
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
                                              _checkOutStateIcon(
                                                  controller.checkOutState),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                controller.userNumpang == null
                                    ? GestureDetector(
                                        onTap: () =>
                                            Get.toNamed("/user-numpang"),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                ),
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/numpang.png",
                                                    width: 64,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Numpang Absen",
                                                          style: CustomTextTheme
                                                              .bodyText1
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                        ),
                                                        Text(
                                                          "Hanya untuk keadaan darurat",
                                                          style: CustomTextTheme
                                                              .subtitle2
                                                              .copyWith(
                                                                  color: CustomColorTheme
                                                                      .greyColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 12),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color: CustomColorTheme
                                                          .greyColor,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          controller.numpangLogout(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                ),
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 32,
                                                    child: Image.network(
                                                      baseUrl +
                                                          controller.userNumpang
                                                              .fotoDiri
                                                              .toString(),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          controller
                                                              .userNumpang.nama
                                                              .toString(),
                                                          style: CustomTextTheme
                                                              .bodyText1
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          "Ketuk untuk logout",
                                                          style: CustomTextTheme
                                                              .subtitle2
                                                              .copyWith(
                                                                  color: CustomColorTheme
                                                                      .greyColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 12),
                                                child: Column(
                                                  children: [
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color: CustomColorTheme
                                                          .greyColor,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Icon _checkInStateIcon(checkInState) {
    Icon icon = Icon(
      Icons.error_outline_rounded,
      color: CustomColorTheme.greyColor,
    );

    if (checkInState == 'ready' || checkInState == 'late') {
      icon = Icon(
        Icons.access_time_outlined,
        color: checkInState == 'ready'
            ? CustomColorTheme.primaryColor
            : Colors.red,
      );
    } else if (checkInState == 'waiting') {
      icon = Icon(
        Icons.error_outline_rounded,
        color: CustomColorTheme.greyColor,
      );
    } else {
      icon = Icon(Icons.check_circle_outline_outlined, color: Colors.green);
    }

    return icon;
  }

  Icon _checkOutStateIcon(checkOutState) {
    Icon icon = Icon(
      Icons.error_outline_rounded,
      color: CustomColorTheme.greyColor,
    );

    if (checkOutState == 'ready') {
      icon = Icon(
        Icons.access_time_outlined,
        color: CustomColorTheme.primaryColor,
      );
    } else if (checkOutState == 'waiting') {
      icon = Icon(
        Icons.error_outline_rounded,
        color: CustomColorTheme.greyColor,
      );
    } else {
      icon = Icon(Icons.check_circle_outline_outlined, color: Colors.green);
    }

    return icon;
  }
}
