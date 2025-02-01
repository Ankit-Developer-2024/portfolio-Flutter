import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/components/image_or_icon_pick.dart';
import 'package:portfolio/views/edit/widgets/components/user_text_field.dart';

class UserSkillDialogBox extends GetView<EditModeController> {
  const UserSkillDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      title: Text(
        Utils.getString("user_skill_data"),
        textAlign: TextAlign.center,
        style: AppTextStyles.textMedium20mp600(),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
                key: controller.formSkillKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Utils.getString("image_or_icon"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageOrIconPick(
                            onTap: () {
                              controller.skillPickImage();
                            },
                            image: controller.skillImage.value,
                            borderColor: controller.isSkillImageRequired.value
                                ? AppColors.error
                                : null,
                          ),
                          controller.isSkillImageRequired.value
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: AppDimesions.px_10),
                                  child: Text(
                                    Utils.getString("user_skill_image_req"),
                                    style: AppTextStyles.textRegular14mp400(
                                        color: AppColors.error),
                                  ),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_skill_name"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.skillNameController,
                      hintText: "Enter your skill name",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "Skill name is required";
                        }
                        return null;
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            // Close the dialog
          },
          child: Text(
            'Cancel',
            style: AppTextStyles.textRegular14mp400(),
          ),
        ),
        TextButton(
          onPressed: () {
            controller.uploadSkillData();
          },
          child: Text(
            'Sumbit',
            style: AppTextStyles.textRegular14mp400(),
          ),
        ),
      ],
    );
  
  }
}
