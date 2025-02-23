import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/loader.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/components/multi_image_pick.dart';
import 'package:portfolio/views/edit/widgets/components/user_text_field.dart';

class UserProjectDialogBox extends GetView<EditModeController> {
  const UserProjectDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      title: Text(
        Utils.getString("user_project_data"),
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
                  key: controller.formProjectKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Utils.getString("user_project_name"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.projectNameController,
                        hintText: "Enter project name",
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Project name is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_development_fields"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.developmentFieldsController,
                        hintText:
                            "Development fields like: Web Dev, Mobile Dev, Ios Dev",
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Development fields is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_technology_stack"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.projectTechStackController,
                        hintText: "Technology stack like: Flutter , React.js",
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Technology stack is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_project_url"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.projectUrlController,
                        hintText: "Enter your project url",
                        validate: (val) {
                          if (val != null && !GetUtils.isURL(val)) {
                            return 'Enter Valid URL';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
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
                            MultiImagePick(
                              onTap: () {
                                controller.projectPickImages();
                              },
                              deleteImage: (index) {
                                controller.projectImagesList.removeAt(index);
                                controller.projectImageRequiredValidation();
                              },
                              images: controller.projectImagesList,
                              borderColor: controller
                                          .projectMinImagRequired.value ||
                                      controller.projectMaxImagRequired.value
                                  ? AppColors.error
                                  : null,
                            ),
                            controller.projectMinImagRequired.value
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppDimesions.px_10),
                                    child: Text(
                                      Utils.getString(
                                          "user_peoject_image_min_req"),
                                      style: AppTextStyles.textRegular14mp400(
                                          color: AppColors.error),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            controller.projectMaxImagRequired.value
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: AppDimesions.px_10),
                                    child: Text(
                                      Utils.getString(
                                          "user_peoject_image_max_req"),
                                      style: AppTextStyles.textRegular14mp400(
                                          color: AppColors.error),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: AppDimesions.px_10,
                            ),
                            Text(
                              Utils.getString("project_description"),
                              style: AppTextStyles.textRegular14mp600(),
                            ),
                            Text(
                              Utils.getString("at_least_one_point_req"),
                              style: AppTextStyles.textRegular14mp400(),
                            ),
                            UserTextField(
                              controller:
                                  controller.projectDescriptionPoint1Controller,
                              hintText: "Enter your Project Description",
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
                              controller:
                                  controller.projectDescriptionPoint2Controller,
                              hintText: "Enter your Project Description",
                              maxLine: 5,
                              validate: (val) {
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: AppDimesions.px_10,
                            ),
                            UserTextField(
                              controller:
                                  controller.projectDescriptionPoint3Controller,
                              hintText: "Enter your Project Description",
                              maxLine: 5,
                              validate: (val) {
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      actions: [
        Obx(
          () => controller.isApiLoderShow.value
              ? const Loader()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                        controller.userProjectModel.value != null
                            ? controller.updateProjectData()
                            : controller.uploadProjectData();
                      },
                      child: Text(
                        controller.userProjectModel.value != null
                            ? "Update"
                            : 'Sumbit',
                        style: AppTextStyles.textRegular14mp400(),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
