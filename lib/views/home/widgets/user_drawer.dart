import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/my_button_animation.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_info_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';
import 'package:portfolio/views/home/widgets/components/sidebar_user_data_ui.dart';
import 'package:portfolio/views/home/widgets/components/user_and_social_media_ui.dart';

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
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: EditButton(
                              onTap: () {
                                 controller.userModel.value != null
                                ? Get.find<EditModeController>()
                                    .initializeEditUserFormData(
                                        controller.userModel.value!)
                                : null;
                                Get.dialog(const UserInfoDialogBox());
                              },
                              color: controller.lightThemeMode.value
                                  ? AppColors.black
                                  : AppColors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              //user name
                              UserAndSocialMediaUi(
                                userModel: controller.userModel.value,
                              ),

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
                                  borderRadius: BorderRadius.circular(
                                      AppDimesions.radius_8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.userModel.value != null
                                            ? controller.makePhoneCall(
                                                controller.userModel.value!
                                                    .phoneNumber)
                                            : null;
                                      },
                                      child: SidebarUserDataUi(
                                          boxWidth: constraints.maxWidth - 140,
                                          icon: Icons.phone_android_outlined,
                                          titile: "phone",
                                          subTitle: "phone_no"),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.userModel.value != null
                                            ? controller.sentMail(controller
                                                .userModel.value!.email)
                                            : null;
                                      },
                                      child: SidebarUserDataUi(
                                          boxWidth: constraints.maxWidth - 140,
                                          icon: Icons.mail,
                                          titile: "email",
                                          subTitle: "user_email"),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.userModel.value!
                                                    .locationUrl !=
                                                null
                                            ? controller.goToSocialMedia(
                                                controller.userModel.value!
                                                    .locationUrl)
                                            : null;
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
                                              style: AppTextStyles
                                                  .textRegular14mp400(
                                                      color: AppColors
                                                          .lightBlueish),
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
                      child:  controller.userModel.value != null
                      ?  Image.network(controller.userModel.value!.userImageUrl,fit: BoxFit.cover,)
                      : const Icon(
                          Icons.person,
                          size: 100,
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
