import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/views/widgets/components/sideBar_user_data_ui.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth - 50,
            margin: const EdgeInsets.only(
              left: AppDimesions.px_50,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimesions.px_16, vertical: AppDimesions.px_16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //user name
                const SizedBox(
                  width: AppDimesions.px_50,
                ),
                Column(
                  children: [
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
                          padding: const EdgeInsets.all(AppDimesions.px_1),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimesions.radius_6),
                              color: AppColors.lightBlueish),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.linked_camera),
                            iconSize: AppDimesions.size_25,
                          ),
                        ),
                        const SizedBox(
                          width: AppDimesions.px_4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(AppDimesions.px_1),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimesions.radius_6),
                              color: AppColors.lightBlueish),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.facebook_outlined,
                            ),
                            iconSize: AppDimesions.size_25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //user location(address)

                Container(
                  padding: const EdgeInsets.all(AppDimesions.px_1),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_6),
                      color: AppColors.lightBlueish),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.phone_android_outlined),
                    iconSize: AppDimesions.size_25,
                    color: AppColors.secondary,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(AppDimesions.px_1),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_6),
                      color: AppColors.lightBlueish),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mail),
                    iconSize: AppDimesions.size_25,
                    color: AppColors.secondary,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppDimesions.px_1),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_6),
                      color: AppColors.lightBlueish),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.location_on_outlined),
                    iconSize: AppDimesions.size_25,
                    color: AppColors.secondary,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_70),
                      gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.secondary])),
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
                          constraints.maxWidth <= 650
                              ? const SizedBox.shrink()
                              : Text(
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
          );
        }),
        const CircleAvatar(
          maxRadius: AppDimesions.radius_50,
          minRadius: 4,
          child: Text('AK'),
        )
      ],
    );
  }
}
