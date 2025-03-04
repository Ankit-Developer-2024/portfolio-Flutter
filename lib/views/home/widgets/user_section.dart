import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/home/widgets/nav_bar_button.dart';

class UserSection extends GetView<HomeController> {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: AppDimesions.px_16,
          ),
          Text(
            controller.navBarButtonHoverIndex.value.toString(),
            style: const TextStyle(fontSize: 0),
          ),
          NavBarButton(),
          const SizedBox(
            height: AppDimesions.px_10,
          ),
          Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(bottom: AppDimesions.px_4),
              padding: const EdgeInsets.symmetric(
                  vertical: AppDimesions.px_16, horizontal: AppDimesions.px_16),
              decoration: BoxDecoration(
                  color: controller.lightThemeMode.value
                      ? AppColors.white
                      : AppColors.mediumBlue,
                  borderRadius: BorderRadius.circular(AppDimesions.radius_8),
                  border: Border.all(
                    color: controller.lightThemeMode.value
                        ? AppColors.lightBlackish
                        : AppColors.primary,
                  )),
              child: controller
                  .getUserSection(controller.navBarButtonSelectedIndex.value)),
        ],
      ),
    );
  }
}
