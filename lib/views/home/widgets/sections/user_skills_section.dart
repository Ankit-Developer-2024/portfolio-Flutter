import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/conatiner_image_text.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_skill_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';
import 'package:portfolio/views/home/widgets/components/heading_with_line_ui.dart';

class UserSkillsSection extends GetView<HomeController> {
  const UserSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            HeadingWithLineUi(
              heading: "skills",
              lineWidth:
                  Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
            ),
            const Spacer(),
            Obx(
              () => Align(
                  alignment: Alignment.topRight,
                  child: EditButton(
                    icon: Icons.add,
                    onTap: () {
                      Get.find<EditModeController>().clearAllSkillFormData();
                      Get.dialog(const UserSkillDialogBox());
                    },
                    color: Get.find<HomeController>().lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white,
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Obx(
          () => Wrap(
              direction: Axis.horizontal,
              spacing: AppDimesions.px_16,
              runSpacing: AppDimesions.px_10,
              children: controller.userSkillModelList.isNotEmpty
                  ? controller.userSkillModelList.reversed.indexed.map((skill) {
                      final (index, data) = skill;
                      return ConatinerImageText(
                        isEditMode: Get.currentRoute == AppRoute.editMode,
                        skillModel: data,
                        defaultWidth: false,
                        imageUrl: data.skillImgUrl,
                        skillName: data.skillName,
                        color: index % 2 != 0
                            ? AppColors.lightOrangish
                            : AppColors.lightBlueish,
                        textStyle: "not need for bold" == "bold"
                            ? AppTextStyles.textMedium16mp600()
                            : AppTextStyles.textMedium16mp400(),
                      );
                    }).toList()
                  : [
                      ConatinerImageText(
                        isEditMode: false,
                        defaultWidth: false,
                        imageUrl: "Your image url",
                        skillName: "Your skill name",
                        color: AppColors.lightBlueish,
                        textStyle: "not need for bold" == "bold"
                            ? AppTextStyles.textMedium16mp600()
                            : AppTextStyles.textMedium16mp400(),
                      )
                    ]),
        )
      ],
    );
  }
}
