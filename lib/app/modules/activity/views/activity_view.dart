import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: Text('Activity page is working'),
          ),
      ),
    );
  }

}
