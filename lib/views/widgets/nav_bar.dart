import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class NavBar extends GetView<HomeController> {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          width: double.maxFinite,
          height: AppDimesions.appBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: AppDimesions.px_16),
          decoration: BoxDecoration(
              color: controller.lightThemeMode.value
                  ? AppColors.white
                  : AppColors.mediumBlue,
              borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Ankit",
                      style: AppTextStyles.textMedium16mp600(
                          color: controller.lightThemeMode.value
                              ? AppColors.black12
                              : AppColors.white),
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
                      controller.changeTheme();
                    },
                    icon: controller.lightThemeMode.value
                        ? Icon(
                            Icons.dark_mode_outlined,
                            color: controller.lightThemeMode.value
                                ? AppColors.black
                                : AppColors.white,
                          )
                        : Icon(
                            Icons.light_mode_outlined,
                            color: controller.lightThemeMode.value
                                ? AppColors.black
                                : AppColors.white,
                          ))
              ],
            );
          })),
    );
  }
}
