import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';

class UserSelectDateYear extends GetView<EditModeController> {
  const UserSelectDateYear({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                  activeColor: AppColors.success,
                  checkColor: AppColors.white,
                  focusColor: AppColors.black,
                  side: const BorderSide(
                      color: AppColors.black, width: AppDimesions.px_2),
                  value: controller.currWorking.value,
                  onChanged: (val) {
                    if (val != null) {
                      controller.currWorking.value = val;
                    }
                  }),
              Flexible(
                child: Text(
                  Utils.getString("user_in_curr_role_or_not"),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textRegular14mp400(),
                ),
              )
            ],
          ),
          Text(
            Utils.getString("start_date"),
            style: AppTextStyles.textRegular14mp400(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: AppDimesions.px_2),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_4)),
                  child: DropdownButton(
                      icon: const SizedBox.shrink(),
                      isDense: true,
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_4),
                      value: controller.startSelectMonth.value,
                      items: controller.month.map((month) {
                        return DropdownMenuItem(
                            value: month,
                            child: Text(
                              month,
                              style: AppTextStyles.textRegular14mp400(),
                            ));
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          controller.startSelectMonth.value = val;
                        }
                      }),
                ),
              ),
              const SizedBox(
                width: AppDimesions.px_4,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: AppDimesions.px_2),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.black),
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_4)),
                  child: DropdownButton(
                      icon: const SizedBox.shrink(),
                      isDense: true,
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_4),
                      value: controller.startSelectYear.value,
                      items: controller.year.map((year) {
                        return DropdownMenuItem(
                            value: year,
                            child: Text(
                              year,
                              style: AppTextStyles.textRegular14mp400(),
                            ));
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          controller.startSelectYear.value = val;
                        }
                      }),
                ),
              ),
            ],
          ),
          controller.startDateRequired.value
              ? Text(
                  Utils.getString("start_date_required"),
                  style:
                      AppTextStyles.textRegular14mp400(color: AppColors.error),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: AppDimesions.px_10,
          ),
          Text(
            Utils.getString("end_date"),
            style: AppTextStyles.textRegular14mp400(),
          ),
          IgnorePointer(
            ignoring: controller.currWorking.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimesions.radius_4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ColorFiltered(
                      colorFilter: controller.currWorking.value
                          ? const ColorFilter.mode(
                              AppColors.lightBlackish, BlendMode.dstOver)
                          : const ColorFilter.mode(
                              AppColors.transparent, BlendMode.dstOver),
                      child: Container(
                        padding: const EdgeInsets.only(left: AppDimesions.px_2),
                        decoration: BoxDecoration(
                            border: controller.currWorking.value
                                ? Border.all(color: AppColors.transparent)
                                : Border.all(color: AppColors.black),
                            borderRadius:
                                BorderRadius.circular(AppDimesions.radius_4)),
                        child: DropdownButton(
                            icon: const SizedBox.shrink(),
                            isDense: true,
                            borderRadius:
                                BorderRadius.circular(AppDimesions.radius_4),
                            value: controller.endSelectMonth.value,
                            items: controller.month.map((month) {
                              return DropdownMenuItem(
                                  value: month,
                                  child: Text(
                                    month,
                                    style: AppTextStyles.textRegular14mp400(),
                                  ));
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) {
                                controller.endSelectMonth.value = val;
                              }
                            }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: AppDimesions.px_4,
                  ),
                  Expanded(
                    child: ColorFiltered(
                      colorFilter: controller.currWorking.value
                          ? const ColorFilter.mode(
                              AppColors.lightBlackish, BlendMode.dstOver)
                          : const ColorFilter.mode(
                              AppColors.transparent, BlendMode.dstOver),
                      child: Container(
                        padding: const EdgeInsets.only(left: AppDimesions.px_2),
                        decoration: BoxDecoration(
                            border: controller.currWorking.value
                                ? Border.all(color: AppColors.transparent)
                                : Border.all(color: AppColors.black),
                            borderRadius:
                                BorderRadius.circular(AppDimesions.radius_4)),
                        child: DropdownButton(
                            icon: const SizedBox.shrink(),
                            isDense: true,
                            borderRadius:
                                BorderRadius.circular(AppDimesions.radius_4),
                            value: controller.endSelectYear.value,
                            items: controller.year.map((year) {
                              return DropdownMenuItem(
                                  value: year,
                                  child: Text(
                                    year,
                                    style: AppTextStyles.textRegular14mp400(),
                                  ));
                            }).toList(),
                            onChanged: (val) {
                              if (val != null) {
                                controller.endSelectYear.value = val;
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          controller.bothDatesRequired.value
              ? Text(
                  Utils.getString("both_date_required"),
                  style:
                      AppTextStyles.textRegular14mp400(color: AppColors.error),
                )
              : const SizedBox.shrink(),
          controller.isEndDateNotPickCorrect.value
              ? Text(
                  Utils.getString("end_date_not_pick_correct"),
                  style:
                      AppTextStyles.textRegular14mp400(color: AppColors.error),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
