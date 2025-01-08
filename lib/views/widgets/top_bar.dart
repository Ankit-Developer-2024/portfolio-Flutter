import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/my_button_animation.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/user_and_social_media_ui.dart';

class TopBar extends GetView<HomeController> {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.centerLeft,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth - AppDimesions.size_25,
              margin: const EdgeInsets.only(
                left: AppDimesions.px_24,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimesions.px_16, vertical: AppDimesions.px_16),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //user name
                  const SizedBox(width: AppDimesions.px_18),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    child: UserAndSocialMediaUi(),
                  ),

                  //user location(address)
                  InkWell(
                    onTap: () {
                      controller.makePhoneCall();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppDimesions.px_1),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimesions.radius_6),
                          color: AppColors.lightBlueish),
                      child: const Icon(
                        Icons.phone_android_outlined,
                        color: AppColors.secondary,
                        size: AppDimesions.size_25,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      controller.sentMail();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppDimesions.px_1),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimesions.radius_6),
                          color: AppColors.lightBlueish),
                      child: const Icon(
                        Icons.mail,
                        color: AppColors.secondary,
                        size: AppDimesions.size_25,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToSocialMedia(controller.userLocationUrl);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppDimesions.px_1),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimesions.radius_6),
                          color: AppColors.lightBlueish),
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.secondary,
                        size: AppDimesions.size_25,
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Utils.downloadPdf();
                    },
                    child: MyButtonAnimation(
                      color: controller.lightThemeMode.value
                          ? AppColors.lightOrangish
                          : AppColors.darkModeColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimesions.px_4,
                          horizontal: AppDimesions.px_8),
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.download,
                            color: AppColors.lightBlueish,
                            size: AppDimesions.px_16,
                          ),
                          Text(
                            Utils.getString("resume"),
                            textAlign: TextAlign.center,
                            style: AppTextStyles.textRegular14mp400(
                                color: AppColors.lightBlueish),
                            maxLines: 5,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          InkWell(
            onTap: () {},
            onHover: (value) {
              controller.isUserImgHover.value = value;
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: controller.isUserImgHover.value
                  ? AppDimesions.size_80
                  : AppDimesions.size_60,
              height: controller.isUserImgHover.value
                  ? AppDimesions.size_80
                  : AppDimesions.size_60,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: controller.lightThemeMode.value
                          ? AppColors.lightBlackish
                          : AppColors.primary,
                      width: AppDimesions.px_1),
                  borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimesions.radius_6),
                child: Image.asset(
                  Utils.getImages("user.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
