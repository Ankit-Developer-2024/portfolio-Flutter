import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class HeadingWithLineUi extends StatelessWidget {
  const HeadingWithLineUi(
      {super.key, required this.heading, this.lineWidth = AppDimesions.px_225});

  final String heading;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Text(
            Utils.getString(heading),
            style: AppTextStyles.textMedium30mpbold(
                color: Get.find<HomeController>().lightThemeMode.value
                    ? AppColors.black
                    : AppColors.white),
          ),
        ),
        const SizedBox(
          width: AppDimesions.px_16,
        ),
        Container(
          height: AppDimesions.px_2,
          width: lineWidth,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
              borderRadius: BorderRadius.circular(AppDimesions.radius_4)),
        )
      ],
    );
  }
}
