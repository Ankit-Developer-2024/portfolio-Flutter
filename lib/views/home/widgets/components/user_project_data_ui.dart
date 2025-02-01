import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';

class UserProjectDataUi extends StatelessWidget {
  const UserProjectDataUi(
      {super.key,
      required this.projectTechUsed,
      required this.projectDevelopmentIn,
      required this.projectName,
      required this.listOfImagesPath,
      this.projectURL,
      this.color,
      this.boxWidth});

  final String projectTechUsed;
  final String projectDevelopmentIn;
  final String projectName;
  final String? projectURL;
  final List<String> listOfImagesPath;
  final Color? color;
  final double? boxWidth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<HomeController>().goToSocialMedia(projectURL);
      },
      child: Container(
        width: boxWidth != null
            ? boxWidth! < AppDimesions.size_550
                ? boxWidth! - AppDimesions.size_10
                : boxWidth! / 2 - AppDimesions.size_10
            : 200,
        padding: const EdgeInsets.symmetric(vertical: AppDimesions.px_8),
        decoration: BoxDecoration(
            color: color ?? AppColors.lightBlueish,
            borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CarouselSlider(
                  items: listOfImagesPath.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppDimesions.radius_8),
                          child: Image.asset(
                            Utils.getImages(image),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Durations.extralong4,
                    autoPlayAnimationDuration: Durations.long4,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: EditButton(
                        onTap: () {
                          print("object");
                        },
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      width: AppDimesions.px_10,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: EditButton(
                        icon: Icons.delete_outline,
                        onTap: () {
                          print("object");
                        },
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppDimesions.px_6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: AppDimesions.px_24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(
                    endIndent: AppDimesions.px_24,
                    color: AppColors.primary,
                  ),
                  Text(
                    "$projectDevelopmentIn | $projectTechUsed",
                    style: AppTextStyles.textMedium16mp400(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  Text(
                    projectName,
                    style: AppTextStyles.textMedium16mp600(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
