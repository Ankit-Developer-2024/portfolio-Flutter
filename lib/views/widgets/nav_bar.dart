import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: AppDimesions.appBarHeight,
        margin: const EdgeInsets.symmetric(horizontal: AppDimesions.px_16),
        padding: const EdgeInsets.symmetric(horizontal: AppDimesions.px_16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                    style: AppTextStyles.textMedium16mp600(
                        color: AppColors.secondary),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.find<HomeController>().lightThemeMode.value =
                        !Get.find<HomeController>().lightThemeMode.value;
                  },
                  icon: Get.find<HomeController>().lightThemeMode.value
                      ? const Icon(Icons.dark_mode_outlined)
                      : const Icon(Icons.light_mode_outlined))
            ],
          );
        }));
  }
}
