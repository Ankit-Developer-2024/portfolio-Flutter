import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/screens/home_desktop_screen.dart';
import 'package:protfolio/views/screens/home_mobile_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return ScreenTypeLayout.builder(
      desktop: (_) => const HomeDesktopScreen(),
      tablet: (_) => const HomeDesktopScreen(),
      mobile: (_) =>  HomeMobileScreen(),
    );
  }
}
