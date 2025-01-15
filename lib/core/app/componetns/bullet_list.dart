import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';

class BulletList extends StatelessWidget {
  const BulletList(
      {super.key,
      this.bulletPoint = "\u2022",
      required this.dataList,
      this.textColor});

  final String bulletPoint;
  final List<String> dataList;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrainets) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dataList.length,
          itemBuilder: (context, i) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bulletPoint,
                  style: AppTextStyles.textRegular14mp400(
                      color: textColor ?? AppColors.black),
                ),
                const SizedBox(
                  width: AppDimesions.px_6,
                ),
                SizedBox(
                  width: constrainets.maxWidth - AppDimesions.px_14,
                  child: Text(dataList[i],
                      maxLines: 100,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textRegular14mp400(
                        color: textColor ?? AppColors.black,
                      )),
                )
              ],
            );
          });
    });
  }
}
