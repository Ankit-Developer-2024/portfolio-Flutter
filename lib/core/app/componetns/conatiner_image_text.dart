import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/delete_confirm_dialog_box.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/data/models/user_skill_model.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/user_skill_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';

class ConatinerImageText extends StatelessWidget {
  const ConatinerImageText(
      {super.key,
      required this.imageUrl,
      required this.skillName,
      this.color,
      this.textStyle,
      this.isEditMode,
      this.skillModel,
      this.defaultWidth = true});
  final String imageUrl;
  final String skillName;
  final TextStyle? textStyle;
  final Color? color;
  final bool defaultWidth;
  final bool? isEditMode;
  final UserSkillModel? skillModel;

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
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                imageUrl == "Your image url"
                    ? Text(
                        "</>",
                        style: textStyle,
                      )
                    : imageUrl.contains("http")
                        ? Image.network(
                            imageUrl,
                            width: AppDimesions.size_25,
                            height: AppDimesions.size_25,
                          ) as Widget
                        : Image.asset(
                            Utils.getIcons(imageUrl),
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
                ),
              ],
            ),
            (isEditMode != null && isEditMode!)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: EditButton(
                            onTap: () {
                              Get.find<EditModeController>()
                                  .initializeEditSkillFormData(skillModel!);
                              Get.dialog(const UserSkillDialogBox());
                            },
                            color: AppColors.black,
                            iconSize: 25),
                      ),
                      const SizedBox(
                        width: AppDimesions.px_10,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: EditButton(
                            icon: Icons.delete_outlined,
                            onTap: () {
                              Get.dialog(DeleteConfirmDialogBox(
                                  deleteItem: skillName,
                                  onTap: () {
                                    Get.find<EditModeController>()
                                        .deleteSkillData(skillModel!);
                                  }));
                            },
                            color: AppColors.black,
                            iconSize: 25),
                      )
                    ],
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
    });
  }
}
