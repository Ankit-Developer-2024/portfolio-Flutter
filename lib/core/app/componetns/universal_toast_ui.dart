import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/enum/app_enum.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:toastification/toastification.dart';

ToastificationItem toast({
  required String title,
  String? subTitle,
  int? tostCloaseDurationInSec,
  required ToastIcon icon,
  Alignment? toastDir,
}) {
  return toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(
      title,
      style: AppTextStyles.textMedium16mp600(
          color: Get.find<HomeController>().lightThemeMode.value
              ? AppColors.black
              : AppColors.white),
    ),
    // you can also use RichText widget for title and description parameters
    description: subTitle == null
        ? const SizedBox.shrink()
        : Text(
            subTitle,
            style: AppTextStyles.textMedium16mp400(
                color: Get.find<HomeController>().lightThemeMode.value
                    ? AppColors.black
                    : AppColors.white),
          ),
    alignment: toastDir ?? Alignment.topRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    icon: getIcon(icon),
    showIcon: true, // show or hide the icon
    primaryColor: AppColors.black,
    backgroundColor: Get.find<HomeController>().lightThemeMode.value
        ? AppColors.white
        : AppColors.mediumBlue,
    foregroundColor: Get.find<HomeController>().lightThemeMode.value
        ? AppColors.black
        : AppColors.white,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(AppDimesions.radius_4),
    borderSide: BorderSide(
        color: Get.find<HomeController>().lightThemeMode.value
            ? AppColors.lightBlackish
            : const Color.fromARGB(88, 255, 156, 26)),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
    // callbacks: ToastificationCallbacks(
    //   onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    //   onCloseButtonTap: (toastItem) =>
    //       print('Toast ${toastItem.id} close button tapped'),
    //   onAutoCompleteCompleted: (toastItem) =>
    //       print('Toast ${toastItem.id} auto complete completed'),
    //   onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
    // ),
  );
}

Icon getIcon(ToastIcon icon) {
  switch (icon) {
    case ToastIcon.success:
      return const Icon(
        Icons.check_circle_outline_rounded,
        size: AppDimesions.size_25,
        color: AppColors.success,
      );
    case ToastIcon.error:
      return const Icon(
        Icons.error_outline_rounded,
        size: AppDimesions.size_25,
        color: AppColors.error,
      );
    case ToastIcon.warning:
      return const Icon(
        Icons.warning_rounded,
        size: AppDimesions.size_25,
        color: AppColors.warning,
      );
    case ToastIcon.info:
      return const Icon(
        Icons.info_outline_rounded,
        size: AppDimesions.size_25,
        color: AppColors.info,
      );
    default:
      return const Icon(
        Icons.warning_rounded,
        size: AppDimesions.size_25,
        color: AppColors.warning,
      );
  }
}
