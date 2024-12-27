import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return Obx(
            () => Container(
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
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimesions.px_4,
                          horizontal: AppDimesions.px_8),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDimesions.radius_70),
                          gradient: const LinearGradient(colors: [
                            AppColors.primary,
                            AppColors.secondary
                          ])),
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
                  )
                ],
              ),
            ),
          );
        }),
        Container(
          width: AppDimesions.size_60,
          height: AppDimesions.size_60,
          decoration: BoxDecoration(
              border: Border.all(
                  color: AppColors.primary, width: AppDimesions.px_2),
              borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimesions.radius_6),
            child: Image.asset(
              Utils.getImages("user.jpg"),
               fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
