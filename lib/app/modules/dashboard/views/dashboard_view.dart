import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/core/theme/color_theme.dart';
import 'package:ngabsen/app/modules/activity/controllers/activity_controller.dart';
import 'package:ngabsen/app/modules/activity/views/activity_view.dart';
import 'package:ngabsen/app/modules/home/views/home_view.dart';
import 'package:ngabsen/app/modules/setting/views/setting_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [HomeView(), ActivityView(), SettingView()],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: CustomColorTheme.greyColor,
            selectedItemColor: CustomColorTheme.primaryColor,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: [
              _bottomNavigationBarItem(icon: Icons.home, label: 'Beranda'),
              _bottomNavigationBarItem(
                  icon: Icons.assignment_rounded, label: 'Riwayat Absensi'),
              _bottomNavigationBarItem(icon: Icons.settings, label: 'Pengaturan'),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
