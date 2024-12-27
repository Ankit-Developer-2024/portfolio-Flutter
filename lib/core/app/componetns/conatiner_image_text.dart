import 'package:flutter/material.dart';
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
      this.textStyle,
      this.defaultWidth = true});
  final String imageName;
  final String skillName;
  final TextStyle? textStyle;
  final Color? color;
  final bool defaultWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: const EdgeInsets.all(AppDimesions.px_10),
        width: defaultWidth
            ? constraints.maxWidth
            : constraints.maxWidth < AppDimesions.size_550
                ? constraints.maxWidth - 10
                : constraints.maxWidth / 3 - 11,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(AppDimesions.radius_6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Utils.getIcons(imageName),
              width: AppDimesions.size_25,
              height: AppDimesions.size_25,
            ),
            const SizedBox(
              width: AppDimesions.px_6,
            ),
            Flexible(
              child: Text(
                skillName,
                style: textStyle ?? AppTextStyles.textMedium16mp400(),
                maxLines: 5,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      );
    });
  }
}
