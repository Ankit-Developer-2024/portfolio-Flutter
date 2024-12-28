import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/bullet_list.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class UserExperienceDataUi extends GetView<HomeController> {
  const UserExperienceDataUi({
    super.key,
    required this.yourTechRole,
    required this.yourPostion,
    required this.date,
    required this.companyName,
    required this.companyLocation,
    required this.listOfYourWorkDoneInComapny,
  });

  final String yourTechRole;
  final String yourPostion;
  final String date;
  final String companyName;
  final String companyLocation;
  final List<String> listOfYourWorkDoneInComapny;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              text: TextSpan(
                  style: AppTextStyles.textMedium16mp600(
                    color: controller.lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white,
                  ),
                  children: [
                TextSpan(text: yourTechRole),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 10)),
                const TextSpan(text: "|"),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 10)),
                TextSpan(text: yourPostion),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 10)),
                TextSpan(
                    text: date,
                    style: AppTextStyles.textMedium16mp400(
                        color: controller.lightThemeMode.value
                            ? AppColors.black
                            : AppColors.white,
                        fontStyle: FontStyle.italic))
              ])),
          const SizedBox(
            height: AppDimesions.px_6,
          ),
          RichText(
              text: TextSpan(
                  style: AppTextStyles.textMedium16mp600(
                    color: controller.lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white,
                  ),
                  children: [
                TextSpan(text: companyName),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 10)),
                const TextSpan(text: "-"),
                const WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: SizedBox(width: 10)),
                TextSpan(
                  text: Utils.getString(companyLocation),
                )
              ])),
          const SizedBox(
            height: AppDimesions.px_6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppDimesions.px_16),
            child: BulletList(
              dataList: listOfYourWorkDoneInComapny,
              textColor: controller.lightThemeMode.value
                  ? AppColors.black
                  : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
