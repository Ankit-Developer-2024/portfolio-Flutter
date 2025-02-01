import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/components/user_select_date_year.dart';
import 'package:portfolio/views/edit/widgets/components/user_text_field.dart';

class UserExperienceDialogBox extends GetView<EditModeController> {
  const UserExperienceDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      title: Text(
        Utils.getString("user_experience_data"),
        textAlign: TextAlign.center,
        style: AppTextStyles.textMedium20mp600(),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                  key: controller.formExperienceKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Utils.getString("user_tech_stack_in_comapny"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.tectStackInCompanyController,
                        hintText: "Enter your Tech Stack",
                        maxLine: 3,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Tech Stack is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_designation_in_company"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.designationInCompanyController,
                        hintText: "Enter your designation",
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Designation is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      const UserSelectDateYear(),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_company_name"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.companyNameController,
                        hintText: "Enter company name",
                        maxLine: 5,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Company name is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_company_location"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.companyLocationController,
                        hintText: "Enter company location",
                        maxLine: 5,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Company location is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_company_experience"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      Text(
                        Utils.getString("user_company_experience_point"),
                        style: AppTextStyles.textRegular14mp400(),
                      ),
                      UserTextField(
                        controller: controller.yourExperiencePoint1Controller,
                        hintText: "Enter your experience",
                        maxLine: 5,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "At least one point is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      UserTextField(
                        controller: controller.yourExperiencePoint2Controller,
                        hintText: "Enter your experience",
                        maxLine: 5,
                        validate: (val) {
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      UserTextField(
                        controller: controller.yourExperiencePoint3Controller,
                        hintText: "Enter your experience",
                        maxLine: 5,
                        validate: (val) {
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
            controller.uploadExperienceData();
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
