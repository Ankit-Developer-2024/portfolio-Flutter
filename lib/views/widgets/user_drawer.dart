import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/sidebar_user_data_ui.dart';

class UserDrawer extends GetView<HomeController> {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(
          top: AppDimesions.px_10, bottom: AppDimesions.px_10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              child: Obx(
                () => Container(
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
                      Text(
                        "Ankit Kumar",
                        style: AppTextStyles.textMedium16mp600(),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),

                      //user profile
                      Text(
                        "App and Web Developer",
                        style: AppTextStyles.textRegular14mp400(),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: AppDimesions.px_6,
                      ),

                      //Social media link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(AppDimesions.px_6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimesions.radius_6),
                                color: AppColors.lightBlueish),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(Utils.getIcons("linkedin.png"),
                                  width: AppDimesions.size_25,
                                  height: AppDimesions.size_25),
                            ),
                          ),
                          const SizedBox(
                            width: AppDimesions.px_4,
                          ),
                          Container(
                            padding: const EdgeInsets.all(AppDimesions.px_6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimesions.radius_6),
                                color: AppColors.lightBlueish),
                            child: InkWell(
                              onTap: () {},
                              child: Image.asset(
                                Utils.getIcons("github.png"),
                                width: AppDimesions.size_25,
                                height: AppDimesions.size_25,
                              ),
                            ),
                          ),
                        ],
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
                          borderRadius:
                              BorderRadius.circular(AppDimesions.radius_8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SidebarUserDataUi(
                                boxWidth: constraints.maxWidth - 135,
                                icon: Icons.phone_android_outlined,
                                titile: "phone",
                                subTitle: "phone_no"),
                            SidebarUserDataUi(
                                boxWidth: constraints.maxWidth - 135,
                                icon: Icons.mail,
                                titile: "email",
                                subTitle: "user_email"),
                            SidebarUserDataUi(
                                boxWidth: constraints.maxWidth - 135,
                                icon: Icons.location_on_outlined,
                                titile: "location",
                                subTitle: "user_location"),
                            const SizedBox(
                              height: AppDimesions.px_8,
                            ),
                            Container(
                              padding: const EdgeInsets.all(AppDimesions.px_1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppDimesions.radius_70),
                                  gradient: const LinearGradient(colors: [
                                    AppColors.primary,
                                    AppColors.secondary
                                  ])),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.download,
                                        color: AppColors.lightBlueish,
                                      ),
                                      const SizedBox(
                                        width: AppDimesions.px_8,
                                      ),
                                      Text(
                                        Utils.getString("download"),
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.textRegular14mp400(
                                            color: AppColors.lightBlueish),
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
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
          //img--------
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
                Utils.getImages("user.jpeg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
