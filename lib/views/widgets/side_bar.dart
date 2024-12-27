import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/sideBar_user_data_ui.dart';
import 'package:protfolio/views/widgets/components/user_and_social_media_ui.dart';

class SideBar extends GetView<HomeController> {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.only(
                    top: AppDimesions.px_80,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimesions.px_14,
                      vertical: AppDimesions.px_16),
                  decoration: BoxDecoration(
                      color: controller.lightThemeMode.value
                          ? AppColors.white
                          : AppColors.mediumBlue,
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_8),
                      border: Border.all(
                        color: controller.lightThemeMode.value
                            ? AppColors.lightBlackish
                            : AppColors.primary,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: AppDimesions.px_18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //user name - user tech profile
                        const UserAndSocialMediaUi(),

                        //user location(address)
                        const SizedBox(
                          height: AppDimesions.px_10,
                        ),

                        Container(
                          padding: const EdgeInsets.only(
                            left: AppDimesions.px_8,
                            right: AppDimesions.px_8,
                            bottom: AppDimesions.px_16,
                            top: AppDimesions.px_8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightBlueish,
                            borderRadius:
                                BorderRadius.circular(AppDimesions.radius_8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.makePhoneCall();
                                },
                                child: SidebarUserDataUi(
                                    boxWidth: constraints.maxWidth - 102,
                                    icon: Icons.phone_android_outlined,
                                    titile: "phone",
                                    subTitle: "phone_no"),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.sentMail();
                                },
                                child: SidebarUserDataUi(
                                    boxWidth: constraints.maxWidth - 102,
                                    icon: Icons.mail,
                                    titile: "email",
                                    subTitle: "user_email"),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.goToSocialMedia(
                                      controller.userLocationUrl);
                                },
                                child: SidebarUserDataUi(
                                    boxWidth: constraints.maxWidth - 102,
                                    icon: Icons.location_on_outlined,
                                    titile: "location",
                                    subTitle: "user_location"),
                              ),
                              const SizedBox(
                                height: AppDimesions.px_8,
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
                                      borderRadius: BorderRadius.circular(
                                          AppDimesions.radius_70),
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
                                        size: AppDimesions.size_20,
                                      ),
                                      const SizedBox(
                                        width: AppDimesions.px_8,
                                      ),
                                      constraints.maxWidth <= 304
                                          ? const SizedBox.shrink()
                                          : Text(
                                              Utils.getString("download"),
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles
                                                  .textRegular14mp400(
                                                      color: AppColors
                                                          .lightBlueish),
                                              maxLines: 5,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          Container(
            width: AppDimesions.size_100,
            height: AppDimesions.size_100,
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.primary, width: AppDimesions.px_2),
                borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimesions.radius_6),
              child: Image.asset(
                "assets/images/user.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
