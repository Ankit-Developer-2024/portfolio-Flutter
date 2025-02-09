import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:portfolio/core/app/componetns/loader.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/components/show_image_dialog_box.dart';
import 'package:portfolio/views/edit/widgets/components/show_pdf_dialog_box.dart';
import 'package:portfolio/views/edit/widgets/components/user_text_field.dart';

class UserInfoDialogBox extends GetView<EditModeController> {
  const UserInfoDialogBox({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      title: Text(
        Utils.getString("user_data"),
        textAlign: TextAlign.center,
        style: AppTextStyles.textMedium20mp600(),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: AppDimesions.px_10,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.getImage();
                      },
                      child: Obx(
                        () => controller.userImage.value != null
                            ? Container(
                                width: AppDimesions.size_200,
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      AppDimesions.radius_4),
                                  child: InkWell(
                                    onTap: () {
                                      Get.dialog(ShowImageDialogBox(
                                          image: controller.userImage.value
                                              as Uint8List));
                                    },
                                    child: Image.memory(
                                      controller.userImage.value as Uint8List,
                                      width: AppDimesions.size_100,
                                      height: AppDimesions.size_100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: AppDimesions.size_200,
                                padding:
                                    const EdgeInsets.all(AppDimesions.px_2),
                                height: AppDimesions.size_100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimesions.radius_4),
                                    border: Border.all(
                                        width: AppDimesions.px_1,
                                        color: AppColors.black12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.image),
                                    const SizedBox(
                                      height: AppDimesions.px_10,
                                    ),
                                    Text(
                                      Utils.getString("pick_image"),
                                      style: AppTextStyles.textRegular14mp600(),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Obx(
                      () => controller.isUserImageRequired.value
                          ? Text(
                              Utils.getString("user_image_required"),
                              style: AppTextStyles.textRegular14mp400(
                                  color: AppColors.error),
                              maxLines: 5,
                            )
                          : const SizedBox.shrink(),
                    )
                  ],
                ),
                const SizedBox(
                  width: AppDimesions.px_10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.getResume();
                      },
                      child: Obx(
                        () => (controller.pdfController.value != null &&
                                controller.userResume.value != null)
                            ? Container(
                                width: AppDimesions.size_200,
                                height: AppDimesions.size_100,
                                alignment: Alignment.center,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppDimesions.radius_4),
                                    child: InkWell(
                                      onTap: () {
                                        Get.dialog(ShowPdfDialogBox(
                                            pdf: controller
                                                .pdfController.value!));
                                      },
                                      child: SizedBox(
                                        width: AppDimesions.size_100,
                                        child: PdfView(
                                            controller: controller
                                                .pdfController.value!),
                                      ),
                                    )))
                            : Container(
                                width: AppDimesions.size_200,
                                padding:
                                    const EdgeInsets.all(AppDimesions.px_2),
                                height: AppDimesions.size_100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        AppDimesions.radius_4),
                                    border: Border.all(
                                        width: AppDimesions.px_1,
                                        color: AppColors.black12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.file_present_outlined),
                                    const SizedBox(
                                      height: AppDimesions.px_10,
                                    ),
                                    Text(
                                      Utils.getString("pick_resume"),
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.textRegular14mp600(),
                                    )
                                  ],
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Obx(
                      () => controller.isUserResumeRequired.value
                          ? Text(
                              Utils.getString("user_resume_required"),
                              style: AppTextStyles.textRegular14mp400(
                                  color: AppColors.error),
                              maxLines: 5,
                            )
                          : const SizedBox.shrink(),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: AppDimesions.px_10,
            ),
            Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Utils.getString("user_name"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userNameController,
                      hintText: "Enter your name",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User name is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_tech_stack"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userTechStackController,
                      hintText: "Enter your Tech Stack",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User Tech Stack is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_linkedIn_url"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userLinkInUrlController,
                      hintText: "Enter your LinkedIn Url",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User LinkedIn Url is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_github_url"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userGithubUrlController,
                      hintText: "Enter your Github Url",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User Github Url is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_phone_number"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userPhoneNumberController,
                      hintText: "Enter your Phone Number",
                      keyboard: TextInputType.phone,
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User Phone Number is required";
                        }
                        if (val.length > 10 || val.length < 10) {
                          return 'Enter Valid 10 digit Phone Number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_email_title"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userEmailController,
                      hintText: "Enter your Email",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User Email is required";
                        }

                        if (!GetUtils.isEmail(val)) {
                          return "Enter Valid Email Address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_location_title"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userLocationController,
                      hintText: "Enter your Location",
                      validate: (val) {
                        if (val!.isEmpty) {
                          return "User Location is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    Text(
                      Utils.getString("user_location_url_title"),
                      style: AppTextStyles.textRegular14mp600(),
                    ),
                    UserTextField(
                      controller: controller.userLocationUrlController,
                      hintText: "Enter your Location Url",
                      validate: (val) {
                        return null;
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
      actions: [
        Obx(
          () => controller.isApiLoderShow.value
              ? const Loader()
              : Row(
                  mainAxisSize: MainAxisSize.min,
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
                        controller.uploadUserData();
                      },
                      child: Obx(
                        () => controller.userModel.value != null
                            ? Text(
                                'Update',
                                style: AppTextStyles.textRegular14mp400(),
                              )
                            : Text(
                                'Sumbit',
                                style: AppTextStyles.textRegular14mp400(),
                              ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
