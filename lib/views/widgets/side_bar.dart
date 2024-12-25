import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/views/widgets/components/sideBar_user_data_ui.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              margin: const EdgeInsets.only(
                top: AppDimesions.px_80,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimesions.px_16, vertical: AppDimesions.px_16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
              child: Padding(
                padding: const EdgeInsets.only(top: AppDimesions.px_60),
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
                              borderRadius:
                                  BorderRadius.circular(AppDimesions.radius_6),
                              color: AppColors.lightBlueish),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.linked_camera)),
                        ),
                        const SizedBox(
                          width: AppDimesions.px_4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(AppDimesions.px_6),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimesions.radius_6),
                              color: AppColors.lightBlueish),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook_outlined)),
                        ),
                      ],
                    ),

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
                          SidebarUserDataUi(
                              boxWidth: constraints.maxWidth - 102,
                              icon: Icons.phone_android_outlined,
                              titile: "phone",
                              subTitle: "phone_no"),
                          SidebarUserDataUi(
                              boxWidth: constraints.maxWidth - 102,
                              icon: Icons.mail,
                              titile: "email",
                              subTitle: "user_email"),
                          SidebarUserDataUi(
                              boxWidth: constraints.maxWidth - 102,
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
                                    constraints.maxWidth <= 304
                                        ? const SizedBox.shrink()
                                        : Text(
                                            Utils.getString("download"),
                                            textAlign: TextAlign.center,
                                            style: AppTextStyles
                                                .textRegular14mp400(
                                                    color:
                                                        AppColors.lightBlueish),
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
            );
          }),
          const CircleAvatar(
            maxRadius: AppDimesions.radius_70,
            minRadius: 4,
            child: Text('AK'),
          )
        ],
      ),
    );
  }
}
