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
import 'package:portfolio/views/home/widgets/components/user_and_social_media_ui.dart';

class TopBar extends GetView<HomeController> {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.centerLeft,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  width: constraints.maxWidth - AppDimesions.size_25,
                  margin: const EdgeInsets.only(
                    left: AppDimesions.px_24,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimesions.px_16,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //user name
                      const SizedBox(width: AppDimesions.px_18),

                       Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 0),
                        child: UserAndSocialMediaUi(userModel: controller.userModel.value,),
                      ),

                      //user location(address)
                      InkWell(
                        onTap: () {
                          controller.userModel.value != null
                                          ? controller.makePhoneCall(controller
                                              .userModel.value!.phoneNumber)
                                          : null;
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
                           controller.userModel.value != null
                                          ? controller.sentMail(controller
                                              .userModel.value!.email)
                                          : null;
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
                          controller.userModel.value!.locationUrl !=null ?  controller.goToSocialMedia(
                                          controller.userModel.value!.locationUrl):null;
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
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, top: 10),
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
                ),
              ],
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
                child:  controller.userModel.value != null
                      ? Image.network(controller.userModel.value!.userImageUrl,fit: BoxFit.cover,)
                      : const Icon(
                          Icons.person,
                          size: 100,
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
