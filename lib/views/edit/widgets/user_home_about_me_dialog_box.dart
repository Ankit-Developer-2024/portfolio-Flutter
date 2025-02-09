import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/components/user_text_field.dart';

class UserHomeAboutMeDialogBox extends GetView<EditModeController> {
  const UserHomeAboutMeDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      title: Text(
        Utils.getString("user_about_me_data"),
        textAlign: TextAlign.center,
        style: AppTextStyles.textMedium20mp600(),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: AppDimesions.size_400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                  key: controller.formHomeAnoutMeKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Utils.getString("user_about_me_desc"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.aboutMeDescController,
                        hintText: "Enter 3-4 line about you",
                        maxLine: 3,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Field is required";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ],
          ),
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
            controller.uploadHomeAboutMeData();
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
