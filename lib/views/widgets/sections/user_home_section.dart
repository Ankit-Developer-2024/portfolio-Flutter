import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/heading_with_line_ui.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';

class UserHomeSection extends StatelessWidget {
  const UserHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingWithLineUi(
          heading: "about_me",
          lineWidth:
              Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Obx(
          () => Text(Utils.getString("user_about_me"),
              style: AppTextStyles.textMedium16mp400(
                  color: Get.find<HomeController>().lightThemeMode.value
                      ? AppColors.black
                      : AppColors.white)),
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Obx(
          () => Text(
            Utils.getString("what_i_do"),
            style: AppTextStyles.textMedium30mpbold(
                color: Get.find<HomeController>().lightThemeMode.value
                    ? AppColors.black
                    : AppColors.white),
          ),
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Wrap(
            alignment: WrapAlignment.start,
            spacing: AppDimesions.px_4,
            runSpacing: 10,
            children: [
              Container(
                width: constraints.maxWidth < AppDimesions.size_550
                    ? constraints.maxWidth - AppDimesions.size_10
                    : constraints.maxWidth / 2 - AppDimesions.size_10,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimesions.px_8,
                    horizontal: AppDimesions.px_16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimesions.radius_8),
                    color: AppColors.lightOrangish),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Utils.getIcons("app_development.png"),
                          width: AppDimesions.size_25,
                          height: AppDimesions.size_25,
                        ),
                        Text(
                          Utils.getString("app_development"),
                          style: AppTextStyles.textMedium20mp600(),
                        )
                      ],
                    ),
                    RichText(
                        text: TextSpan(
                            style: AppTextStyles.textRegular14mp400(),
                            children: [
                          TextSpan(
                              text: Utils.getString(
                                  "user_app_development_part1")),
                          TextSpan(
                              text:
                                  Utils.getString("user_app_development_part2"),
                              style: AppTextStyles.textRegular14mp600()),
                          TextSpan(
                              text: Utils.getString(
                                  "user_app_development_part3")),
                        ])),
                  ],
                ),
              ),
              const SizedBox(
                width: AppDimesions.px_10,
              ),
              Container(
                width: constraints.maxWidth < AppDimesions.size_550
                    ? constraints.maxWidth - AppDimesions.size_10
                    : constraints.maxWidth / 2 - AppDimesions.size_10,
                padding: const EdgeInsets.symmetric(
                    vertical: AppDimesions.px_8,
                    horizontal: AppDimesions.px_16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimesions.radius_8),
                    color: AppColors.lightBlueish),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "</>",
                          style: AppTextStyles.textMedium20mp600(
                              color: AppColors.primary),
                        ),
                        const SizedBox(
                          width: AppDimesions.px_4,
                        ),
                        Text(
                          Utils.getString("web_development"),
                          style: AppTextStyles.textMedium20mp600(),
                        )
                      ],
                    ),
                    RichText(
                        text: TextSpan(
                            style: AppTextStyles.textRegular14mp400(),
                            children: [
                          TextSpan(
                              text: Utils.getString(
                                  "user_web_development_part1")),
                          TextSpan(
                              text:
                                  Utils.getString("user_web_development_part2"),
                              style: AppTextStyles.textRegular14mp600()),
                          TextSpan(
                              text: Utils.getString(
                                  "user_web_development_part3")),
                        ])),
                  ],
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
