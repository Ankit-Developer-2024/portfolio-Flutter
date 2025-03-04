import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';

class SidebarUserDataUi extends StatelessWidget {
  const SidebarUserDataUi(
      {super.key,
      required this.titile,
      required this.subTitle,
      required this.icon,
      required this.boxWidth});

  final String titile;
  final String subTitle;
  final double boxWidth;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimesions.px_10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: AppDimesions.px_1, color: AppColors.lightBlackish))),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.secondary,
          ),
          const SizedBox(
            width: AppDimesions.px_10,
          ),
          SizedBox(
            width: boxWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Utils.getString(titile),
                  style: AppTextStyles.textRegular14mp400(
                    color: AppColors.black12,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                SelectableText(
                  Utils.getString(subTitle),
                  style: AppTextStyles.textRegular14mp600(),
                  maxLines: 5,
                  minLines: 1,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
