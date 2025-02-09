import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validate,
    this.maxLine,
    this.keyboard,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validate;
  final int? maxLine;
  final TextInputType? keyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.black,
      minLines: 1,
      maxLines: maxLine ?? 2,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboard ?? TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: AppTextStyles.textRegular14mp400(),
        errorStyle: AppTextStyles.textRegular14mp400(color: AppColors.error),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.error)),
      ),
      validator: validate,
    );
  }
}
