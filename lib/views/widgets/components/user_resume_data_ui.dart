import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';

class UserResumeDataUi extends StatelessWidget {
  const UserResumeDataUi(
      {super.key,
      required this.date,
      required this.role,
      required this.institute,
      this.userClass = "",
      this.color});
  final String date;
  final String role;
  final String userClass;
  final String institute;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimesions.px_14),
      decoration: BoxDecoration(
          color: color ?? AppColors.lightOrangish,
          borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            date,
            maxLines: 5,
            style: AppTextStyles.textRegular14mp400(color: AppColors.black12),overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${userClass.length > 1 ? "$userClass | " : ""}$role",
            maxLines: 5,
            style: AppTextStyles.textMedium16mp600(),overflow: TextOverflow.ellipsis,
          ),
          Text(
            institute,
            maxLines: 5,
            style: AppTextStyles.textMedium16mp400(),overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
