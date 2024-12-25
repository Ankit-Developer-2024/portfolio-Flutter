import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';

class ConatinerImageText extends StatelessWidget {
  const ConatinerImageText(
      {super.key,
      required this.imageName,
      required this.skillName,
      this.color,
      this.textStyle});
  final String imageName;
  final String skillName;
  final TextStyle? textStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimesions.px_10),
      width: Get.width / 5,
      decoration: BoxDecoration(
        color: color ?? AppColors.primary,
        borderRadius: BorderRadius.circular(AppDimesions.radius_6),
      ),
      child: Row(
        children: [
          Image.asset(
            Utils.getIcons(imageName),
            width: AppDimesions.size_25,
            height: AppDimesions.size_25,
          ),
          const SizedBox(
            width: AppDimesions.px_6,
          ),
          Text(
            skillName,
            style: textStyle ?? AppTextStyles.textMedium16mp400(),
          ),
        ],
      ),
    );
  }
}
