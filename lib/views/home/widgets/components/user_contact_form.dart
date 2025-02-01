import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

class UserContactForm extends GetView<HomeController> {
  const UserContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Text(
            Utils.getString("form_heading"),
            style: AppTextStyles.textMedium16mp400(
              color: controller.lightThemeMode.value
                  ? AppColors.black
                  : AppColors.white,
            ),
          ),
          const SizedBox(
            height: AppDimesions.px_10,
          ),
          Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        errorStyle: AppTextStyles.textRegular14mp400(
                            color: AppColors.secondary),
                        labelText: "Name: ",
                        labelStyle: AppTextStyles.textMedium16mp600(
                          color: controller.lightThemeMode.value
                              ? AppColors.black
                              : AppColors.white,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name.";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: AppDimesions.px_10,
                  ),
                  TextFormField(
                    controller: controller.mailPhoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        errorStyle: AppTextStyles.textRegular14mp400(
                            color: AppColors.secondary),
                        labelText: "Phone/E-Mail: ",
                        labelStyle: AppTextStyles.textMedium16mp600(
                          color: controller.lightThemeMode.value
                              ? AppColors.black
                              : AppColors.white,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your Phone No./E-Mail.";
                      }
                      if (!value.contains("@") && value.length > 10) {
                        const str =
                            "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
                        if (str.contains(value[value.length - 1])) {
                          return "Please enter a valid E-mail";
                        } else {
                          return "Please enter vaild 10-digit mobile number";
                        }
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: AppDimesions.px_10,
                  ),
                  TextFormField(
                    controller: controller.messageController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        errorStyle: AppTextStyles.textRegular14mp400(
                            color: AppColors.secondary),
                        labelText: "Message: ",
                        labelStyle: AppTextStyles.textMedium16mp600(
                          color: controller.lightThemeMode.value
                              ? AppColors.black
                              : AppColors.white,
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your message.";
                      }
                      return null;
                    },
                    minLines: 1,
                    maxLines: 100,
                  ),
                  const SizedBox(
                    height: AppDimesions.px_10,
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                        color: controller.lightThemeMode.value
                            ? AppColors.secondary
                            : AppColors.primary,
                      )),
                      onPressed: () {
                        controller.userFormData();
                      },
                      child: Text(
                        Utils.getString("send_msg"),
                        style: AppTextStyles.textRegular14mp600(
                          color: controller.lightThemeMode.value
                              ? AppColors.black
                              : AppColors.white,
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
