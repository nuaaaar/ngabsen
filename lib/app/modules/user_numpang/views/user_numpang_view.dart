import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/core/theme/text_theme.dart';
import 'package:ngabsen/app/core/values/strings.dart';
import 'package:ngabsen/app/data/models/user_model.dart';

import '../controllers/user_numpang_controller.dart';

class UserNumpangView extends GetView<UserNumpangController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColorTheme.primaryColor,
        title: Text('Numpang Absen'),
        centerTitle: false,
      ),
      body: SafeArea(
          child: GetBuilder<UserNumpangController>(
              init: UserNumpangController(),
              builder: (controller) {
                return controller.isLoading
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Expanded(
                              child: Container(
                                child: controller.users.isEmpty
                                    ? Center(
                                        child: Container(
                                          padding: EdgeInsets.all(16),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                "assets/images/empty.png",
                                                width: 200,
                                              ),
                                              Text(
                                                "Data karyawan tidak tersedia",
                                                style: CustomTextTheme.bodyText2
                                                    .copyWith(
                                                        color: CustomColorTheme
                                                            .greyColor),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : GetBuilder<UserNumpangController>(
                                        init: UserNumpangController(),
                                        builder: (controller) {
                                          return ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: controller.users.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                  onTap: () => controller
                                                      .loginAlternative(
                                                          controller
                                                              .users[index].id),
                                                  child: _cardListView(
                                                      index,
                                                      controller.users[index],
                                                      controller.users.length));
                                            },
                                          );
                                        },
                                      ),
                              ),
                            )
                          ]);
              })),
    );
  }

  _cardListView(index, User user, length) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.fromLTRB(
            16, index == 0 ? 16 : 0, 16, index == length ? 16 : 10),
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
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      NetworkImage(baseUrl + user.fotoDiri.toString()),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.nama.toString(),
                        style: CustomTextTheme.bodyText1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        user.username.toString(),
                        style: CustomTextTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Icon(
                    Icons.login,
                    color: CustomColorTheme.greyColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
