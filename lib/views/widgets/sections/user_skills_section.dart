import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/conatiner_image_text.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/widgets/components/heading_with_line_ui.dart';

class UserSkillsSection extends GetView<HomeController> {
  const UserSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HeadingWithLineUi(
          heading: "skills",
          lineWidth:
              Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: AppDimesions.px_16,
          runSpacing: AppDimesions.px_10,
          children: controller.listOfSkills.indexed.map((skill) {
            final (index, data) = skill;
            return ConatinerImageText(
              defaultWidth: false,
              imageName: data["skillImagePath"],
              skillName: data["skillName"],
              color: index % 2 != 0
                  ? AppColors.lightOrangish
                  : AppColors.lightBlueish,
              textStyle: data["textWight"] == "bold"
                  ? AppTextStyles.textMedium16mp600()
                  : AppTextStyles.textMedium16mp400(),
            );
          }).toList(),
        )
      ],
    );
  }
}
