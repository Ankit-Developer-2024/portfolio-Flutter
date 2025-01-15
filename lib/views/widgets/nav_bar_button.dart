import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

class NavBarButton extends GetView<HomeController> {
  NavBarButton({super.key});

  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: AppDimesions.size_105,
        padding: const EdgeInsets.all(AppDimesions.px_16),
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
        child: Scrollbar(
          controller: _controller,
          thumbVisibility: true,
          child: ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: controller.navBarButtonData.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              final data = controller.navBarButtonData[i];
              return InkWell(
                onTap: () {
                  controller.menuOnTop(i);
                },
                onHover: (value) {
                  value == true
                      ? controller.changeHoveringItem(i)
                      : controller.changeHoveringItem(100);
                },
                hoverColor: AppColors.darkModeColor,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimesions.px_16,
                      vertical: AppDimesions.px_8),
                  decoration: BoxDecoration(
                      gradient: controller.isHovering(i) ||
                              controller.isActive(i)
                          ? const LinearGradient(
                              colors: [AppColors.primary, AppColors.secondary])
                          : const LinearGradient(colors: [
                              AppColors.lightBlueish,
                              AppColors.lightBlueish
                            ]),
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_8)),
                  child: Column(
                    children: [
                      Image.asset(data[1],
                          width:
                              controller.isHovering(i) || controller.isActive(i)
                                  ? AppDimesions.size_25
                                  : AppDimesions.size_20,
                          height:
                              controller.isHovering(i) || controller.isActive(i)
                                  ? AppDimesions.size_25
                                  : AppDimesions.size_20,
                          color:
                              controller.isHovering(i) || controller.isActive(i)
                                  ? AppColors.lightBlueish
                                  : AppColors.grey),
                      const SizedBox(
                        height: AppDimesions.px_4,
                      ),
                      Text(
                        data[0].toString(),
                        style:
                            controller.isHovering(i) || controller.isActive(i)
                                ? AppTextStyles.textMedium16mp400(
                                    color: AppColors.white)
                                : AppTextStyles.textRegular14mp400(
                                    color: AppColors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, i) {
              return const SizedBox(
                width: AppDimesions.px_16,
              );
            },
          ),
        ),
      ),
    );
  }
}
