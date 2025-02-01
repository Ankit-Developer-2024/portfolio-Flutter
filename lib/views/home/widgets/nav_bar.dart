import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

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
          ),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.editMode);
                      },
                      child: Text(
                        "Ankit",
                        style: AppTextStyles.textMedium16mp600(
                            color: controller.lightThemeMode.value
                                ? AppColors.black12
                                : AppColors.white),
                      ),
                    ),
                    const SizedBox(
                      width: AppDimesions.px_4,
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        TypewriterAnimatedText("Kumar",
                            textStyle: AppTextStyles.textMedium16mp600(
                                color: AppColors.secondary),
                            speed: const Duration(seconds: 1)),
                      ],
                    ),
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
