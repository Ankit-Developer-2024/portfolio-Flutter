import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class NavBarButton extends GetView<HomeController> {
  const NavBarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppDimesions.px_98,
        padding: const EdgeInsets.all(AppDimesions.px_16),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimesions.radius_8),
            border: Border.all(color: AppColors.lightBlueish)),
        child: Obx(
          () => ListView.separated(
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
                child: Container(
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
                          width: AppDimesions.size_20,
                          height: AppDimesions.size_20,
                          color:
                              controller.isHovering(i) || controller.isActive(i)
                                  ? AppColors.lightBlueish
                                  : AppColors.grey),
                      const SizedBox(
                        height: AppDimesions.px_4,
                      ),
                      Text(
                        data[0].toString(),
                        style: AppTextStyles.textRegular14mp400(
                            color: controller.isHovering(i) ||
                                    controller.isActive(i)
                                ? AppColors.white
                                : AppColors.black),
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
        ));
  }
}
