import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/home/widgets/top_bar.dart';
import 'package:portfolio/views/home/widgets/side_bar.dart';
import 'package:portfolio/views/home/widgets/nav_bar.dart';
import 'package:portfolio/views/home/widgets/user_section.dart';

class HomeDesktopScreen extends StatelessWidget {
  const HomeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Get.find<HomeController>().lightThemeMode.value
            ? AppColors.lightBlueish
            : AppColors.darkModeColor,
        appBar: PreferredSize(
            preferredSize: Size(Get.width, 60), child: const NavBar()),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: AppDimesions.px_8,
                  left: AppDimesions.px_16,
                  right: AppDimesions.px_16),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    constraints.maxWidth <= 730
                        ? const TopBar()
                        : const SizedBox.shrink(),
                    const SizedBox(
                      width: AppDimesions.px_16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        constraints.maxWidth <= 730
                            ? const SizedBox.shrink()
                            : const Expanded(flex: 1, child: SideBar()),
                        const SizedBox(
                          width: AppDimesions.px_16,
                        ),
                        const Expanded(
                          flex: 3,
                          child: UserSection(),
                        )
                      ],
                    ),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
