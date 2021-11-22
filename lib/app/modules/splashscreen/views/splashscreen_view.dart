import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ngabsen/app/modules/login/views/login_view.dart';
import 'package:page_transition/page_transition.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ngabsen',
        home: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/images/logo-text.png',
          nextScreen: LoginView(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.white
        )
    );
  }
}
