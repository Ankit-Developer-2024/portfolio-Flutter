import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/user_drawer.dart';
import 'package:protfolio/views/widgets/user_section.dart';
import 'package:get/get.dart';

class HomeMobileScreen extends StatelessWidget {
  HomeMobileScreen({super.key});

  final ScaffoldState scaffoldState = ScaffoldState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Ankit",
              style: AppTextStyles.textMedium16mp600(),
            ),
            const SizedBox(
              width: AppDimesions.px_4,
            ),
            Text(
              "Kumar",
              style:
                  AppTextStyles.textMedium16mp600(color: AppColors.secondary),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.find<HomeController>().lightThemeMode.value =
                    !Get.find<HomeController>().lightThemeMode.value;
              },
              icon: Get.find<HomeController>().lightThemeMode.value
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      drawer: const UserDrawer(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
                top: AppDimesions.px_8,
                left: AppDimesions.px_16,
                right: AppDimesions.px_16),
            child: LayoutBuilder(builder: (context, constraints) {
              return const Column(
                children: [UserSection()],
              );
            })),
      ),
    );
  }
}
