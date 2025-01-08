import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/my_button_animation.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/sidebar_user_data_ui.dart';
import 'package:protfolio/views/widgets/components/user_and_social_media_ui.dart';

class UserDrawer extends GetView<HomeController> {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Drawer(
          backgroundColor: controller.lightThemeMode.value
              ? AppColors.lightBlueish
              : AppColors.darkModeColor,
          child: Padding(
            padding: const EdgeInsets.only(
                top: AppDimesions.px_10, bottom: AppDimesions.px_10),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: AppDimesions.px_30,
                          left: AppDimesions.px_16,
                          right: AppDimesions.px_16,
                          bottom: AppDimesions.px_16),
                      margin: const EdgeInsets.only(
                          top: 80,
                          left: AppDimesions.px_16,
                          right: AppDimesions.px_16),
                      decoration: BoxDecoration(
                          color: controller.lightThemeMode.value
                              ? AppColors.white
                              : AppColors.mediumBlue,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(AppDimesions.radius_8),
                            topRight: Radius.circular(AppDimesions.radius_8),
                            bottomLeft: Radius.circular(AppDimesions.radius_1),
                            bottomRight: Radius.circular(20),
                          ),
                          border: Border.all(
                            color: controller.lightThemeMode.value
                                ? AppColors.lightBlackish
                                : AppColors.primary,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //user name
                          const UserAndSocialMediaUi(),

                          //user location(address)
                          const SizedBox(
                            height: AppDimesions.px_10,
                          ),

                          Container(
                            width: constraints.maxWidth,
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
                                      boxWidth: constraints.maxWidth - 140,
                                      icon: Icons.phone_android_outlined,
                                      titile: "phone",
                                      subTitle: "phone_no"),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.sentMail();
                                  },
                                  child: SidebarUserDataUi(
                                      boxWidth: constraints.maxWidth - 140,
                                      icon: Icons.mail,
                                      titile: "email",
                                      subTitle: "user_email"),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.goToSocialMedia(
                                        controller.userLocationUrl);
                                  },
                                  hoverColor: AppColors.darkModeColor,
                                  child: SidebarUserDataUi(
                                      boxWidth: constraints.maxWidth - 140,
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
                                  child: MyButtonAnimation(
                                    color: controller.lightThemeMode.value
                                        ? AppColors.lightOrangish
                                        : AppColors.darkModeColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: AppDimesions.px_4,
                                        horizontal: AppDimesions.px_8),
                                    borderRadius: BorderRadius.circular(
                                        AppDimesions.radius_70),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.download,
                                          color: AppColors.lightBlueish,
                                          size: AppDimesions.size_20,
                                        ),
                                        const SizedBox(
                                          width: AppDimesions.px_8,
                                        ),
                                        Text(
                                          Utils.getString("download"),
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyles.textRegular14mp400(
                                                  color:
                                                      AppColors.lightBlueish),
                                          maxLines: 5,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          Utils.getString("resume"),
                                          textAlign: TextAlign.center,
                                          style:
                                              AppTextStyles.textRegular14mp400(
                                                  color:
                                                      AppColors.lightBlueish),
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
                  );
                }),
                //img--------
                InkWell(
                  onTap: () {},
                  onHover: (value) {
                    controller.isUserImgHover.value = value;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: controller.isUserImgHover.value
                        ? AppDimesions.size_120
                        : AppDimesions.size_100,
                    height: controller.isUserImgHover.value
                        ? AppDimesions.size_120
                        : AppDimesions.size_100,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: controller.lightThemeMode.value
                                ? AppColors.lightBlackish
                                : AppColors.primary,
                            width: AppDimesions.px_1),
                        borderRadius:
                            BorderRadius.circular(AppDimesions.radius_8)),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_6),
                      child: Image.asset(
                        Utils.getImages("user.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
