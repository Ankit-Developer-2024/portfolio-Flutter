import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/loader.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';

class DeleteConfirmDialogBox extends GetView<EditModeController> {
  const DeleteConfirmDialogBox(
      {super.key, required this.deleteItem, required this.onTap});
  final String deleteItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "${Utils.getString("are_you_sure_delete")} $deleteItem",
        style: AppTextStyles.textRegular14mp600(),
      ),
      titlePadding: const EdgeInsets.all(AppDimesions.px_10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      actionsPadding: const EdgeInsets.only(
          top: AppDimesions.px_1,
          bottom: AppDimesions.px_10,
          left: AppDimesions.px_10,
          right: AppDimesions.px_10),
      contentPadding: const EdgeInsets.all(AppDimesions.px_1),
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
                      onPressed: onTap,
                      child: Text(
                        "Delete",
                        style: AppTextStyles.textRegular14mp400(
                            color: AppColors.error),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
