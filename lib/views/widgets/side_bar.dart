import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: AppDimesions.px_80,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimesions.px_16, vertical: AppDimesions.px_16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
            child: Padding(
              padding: const EdgeInsets.only(top: AppDimesions.px_80),
              child: Column(
                children: [
                  //user name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ankit",
                        style: AppTextStyles.textMedium16mp600(),
                      ),
                      const SizedBox(
                        width: AppDimesions.px_4,
                      ),
                      Text(
                        "Kumar",
                        style: AppTextStyles.textMedium16mp600(),
                      )
                    ],
                  ),

                  //user profile
                  Text(
                    "App and Web Developer",
                    style: AppTextStyles.textRegular14mp400(),
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
                            onPressed: () {}, icon: Icon(Icons.linked_camera)),
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
                        Container(
                          padding: const EdgeInsets.all(AppDimesions.px_10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: AppDimesions.px_1,
                                      color: AppColors.lightBlackish))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.phone_android_outlined,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(
                                width: AppDimesions.px_10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Utils.getString("phone"),
                                    style: AppTextStyles.textRegular14mp400(
                                        color: AppColors.black12),
                                  ),
                                  Text(
                                    Utils.getString("phone_no"),
                                    style: AppTextStyles.textRegular14mp600(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        //------
                        Container(
                          padding: const EdgeInsets.all(AppDimesions.px_10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: AppDimesions.px_1,
                                      color: AppColors.lightBlackish))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.mail_outline_outlined,
                                color: AppColors.primary,
                              ),
                              const SizedBox(
                                width: AppDimesions.px_10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Utils.getString("email"),
                                    style: AppTextStyles.textRegular14mp400(
                                        color: AppColors.black12),
                                  ),
                                  Text(
                                    Utils.getString("user_email"),
                                    style: AppTextStyles.textRegular14mp600(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        //------
                        Container(
                          padding: const EdgeInsets.all(AppDimesions.px_10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: AppDimesions.px_1,
                                      color: AppColors.lightBlackish))),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(
                                width: AppDimesions.px_10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Utils.getString("location"),
                                    style: AppTextStyles.textRegular14mp400(
                                        color: AppColors.black12),
                                  ),
                                  Text(
                                    Utils.getString("user_location"),
                                    style: AppTextStyles.textRegular14mp600(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: AppDimesions.px_8,
                        ),
                        Container(
                          padding: const EdgeInsets.all(AppDimesions.px_8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimesions.radius_70),
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
                                    Utils.getString("download_resume"),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.textRegular14mp400(
                                        color: AppColors.lightBlueish),
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
