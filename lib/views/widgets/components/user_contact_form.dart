import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class UserContactForm extends GetView<HomeController> {
  const UserContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Utils.getString("form_heading"),
          style: AppTextStyles.textMedium16mp400(),
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
                      labelText: "Name: ",
                      labelStyle: AppTextStyles.textMedium16mp600()),
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
                      labelText: "Phone/Mail: ",
                      labelStyle: AppTextStyles.textMedium16mp600()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Phone Number / Mail.";
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
                      labelText: "Message: ",
                      labelStyle: AppTextStyles.textMedium16mp600()),
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
                        side: const BorderSide(color: AppColors.secondary)),
                    onPressed: () {
                      controller.userFormData();
                    },
                    child: Text(
                      Utils.getString("sumbit"),
                      style: AppTextStyles.textRegular14mp600(),
                    ))
              ],
            ))
      ],
    );
  }
}
