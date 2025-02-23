import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/data/models/user_model.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

class UserAndSocialMediaUi extends StatelessWidget {
  const UserAndSocialMediaUi({super.key, this.userModel});
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SelectableText(
            userModel!=null ? userModel!.userName : "Your name",
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
            userModel!=null ? userModel!.techStack : "Your tech stack",
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
                 userModel!=null ? Get.find<HomeController>().goToSocialMedia(
                        userModel!.linkedUrl) : null;
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
                  userModel!=null ? Get.find<HomeController>().goToSocialMedia(
                        userModel!.githubUrl) : null;
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
