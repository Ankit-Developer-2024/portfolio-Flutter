import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class UserAndSocialMediaUi extends StatelessWidget {
  const UserAndSocialMediaUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SelectableText(
            "Ankit Kumar",
            style: AppTextStyles.textMedium20mp600(
                color: Get.find<HomeController>().lightThemeMode.value
                    ? AppColors.black12
                    : AppColors.white),
            maxLines: 5,
            minLines: 1,
            textAlign: TextAlign.center,
          ),

          //user profile
          SelectableText(
            "Flutter and MERN Stack Developer",
            style: AppTextStyles.textMedium16mp400(
                color: Get.find<HomeController>().lightThemeMode.value
                    ? AppColors.black12
                    : AppColors.white),
            maxLines: 5,
            minLines: 1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: AppDimesions.px_6,
          ),

          //Social media link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.find<HomeController>().goToSocialMedia(
                      Get.find<HomeController>().userLinkedInUrl);
                },
                child: Container(
                  padding: const EdgeInsets.all(AppDimesions.px_6),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_6),
                      color: AppColors.lightBlueish),
                  child: Image.asset(Utils.getIcons("linkedin.png"),
                      width: AppDimesions.size_25,
                      height: AppDimesions.size_25),
                ),
              ),
              const SizedBox(
                width: AppDimesions.px_4,
              ),
              InkWell(
                onTap: () {
                  Get.find<HomeController>().goToSocialMedia(
                      Get.find<HomeController>().userGithubUrl);
                },
                child: Container(
                  padding: const EdgeInsets.all(AppDimesions.px_6),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_6),
                      color: AppColors.lightBlueish),
                  child: Image.asset(
                    Utils.getIcons("github.png"),
                    width: AppDimesions.size_25,
                    height: AppDimesions.size_25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
