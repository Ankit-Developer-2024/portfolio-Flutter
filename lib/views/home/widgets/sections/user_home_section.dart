import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_home_about_me_dialog_box.dart';
import 'package:portfolio/views/edit/widgets/user_home_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';
import 'package:portfolio/views/home/widgets/components/heading_with_line_ui.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/views/home/widgets/components/user_what_i_do_ui.dart';

class UserHomeSection extends GetView<HomeController> {
  const UserHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Obx(
              () => Align(
                alignment: Alignment.centerRight,
                child: EditButton(
                  onTap: () {
                    controller.userModel.value != null
                        ? Get.find<EditModeController>()
                            .aboutMeDescController
                            .text = controller.userModel.value!.aboutMe ?? ""
                        : null;
                    controller.userModel.value != null
                        ? Get.find<EditModeController>().userModel.value =
                            controller.userModel.value
                        : null;
                    Get.dialog(const UserHomeAboutMeDialogBox());
                  },
                  color: Get.find<HomeController>().lightThemeMode.value
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
            ),
            HeadingWithLineUi(
              heading: "about_me",
              lineWidth:
                  Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
            ),
          ],
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Obx(() => (Get.find<HomeController>().userModel.value != null &&
                Get.find<HomeController>().userModel.value!.aboutMe != null)
            ? Text(Get.find<HomeController>().userModel.value!.aboutMe!,
                style: AppTextStyles.textMedium16mp400(
                    color: Get.find<HomeController>().lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white))
            : Text("Your summary",
                style: AppTextStyles.textMedium16mp400(
                    color: Get.find<HomeController>().lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white))),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Obx(
          () => Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: EditButton(
                  icon: Icons.add,
                  onTap: () {
                    Get.find<EditModeController>().clearAllWhatIdOFormData();
                    Get.dialog(const UserHomeDialogBox());
                  },
                  color: Get.find<HomeController>().lightThemeMode.value
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
              Text(
                Utils.getString("what_i_do"),
                style: AppTextStyles.textMedium30mpbold(
                    color: Get.find<HomeController>().lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Obx(() => Wrap(
                alignment: WrapAlignment.start,
                spacing: AppDimesions.px_4,
                runSpacing: 10,
                children: controller.userWhatIDoModelList.isNotEmpty
                    ? controller.userWhatIDoModelList.indexed.map((item) {
                        final (index, data) = item;
                        return UserWhatIDoUi(
                            maxWidth: constraints.maxWidth,
                            whatIDo: data,
                            index: index);
                      }).toList()
                    : [
                        Container(
                          width: constraints.maxWidth < AppDimesions.size_550
                              ? constraints.maxWidth - AppDimesions.size_10
                              : constraints.maxWidth / 2 - AppDimesions.size_10,
                          padding: const EdgeInsets.symmetric(
                              vertical: AppDimesions.px_8,
                              horizontal: AppDimesions.px_16),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppDimesions.radius_8),
                              color: AppColors.lightOrangish),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "</>",
                                    style: AppTextStyles.textMedium20mp600(
                                        color: AppColors.primary),
                                  ),
                                  const SizedBox(
                                    width: AppDimesions.px_10,
                                  ),
                                  Text(
                                    "Your tech stack",
                                    style: AppTextStyles.textMedium20mp600(),
                                  )
                                ],
                              ),
                              Text(
                                "Your teck stack description",
                                style: AppTextStyles.textRegular14mp400(),
                              )
                            ],
                          ),
                        )
                      ],
              ));
        })
      ],
    );
  }
}
