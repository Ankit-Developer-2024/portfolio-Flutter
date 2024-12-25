import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';

class UserProjectDataUi extends StatelessWidget {
  const UserProjectDataUi(
      {super.key,
      required this.projectTechUsed,
      required this.projectDevelopmentIn,
      required this.projectName,
      required this.listOfImagesPath,
      this.color,
      this.boxWidth});

  final String projectTechUsed;
  final String projectDevelopmentIn;
  final String projectName;
  final List<String> listOfImagesPath;
  final Color? color;
  final double? boxWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          CarouselSlider(
            items: listOfImagesPath.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimesions.radius_8),
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
    );
  }
}
