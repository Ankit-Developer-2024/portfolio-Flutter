import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/delete_confirm_dialog_box.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_experience_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';
import 'package:portfolio/views/home/widgets/components/heading_with_line_ui.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/views/home/widgets/components/user_experience_data_ui.dart';

class UserExperienceSection extends GetView<HomeController> {
  const UserExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Obx(
              () => Align(
                  alignment: Alignment.topRight,
                  child: EditButton(
                    icon: Icons.add,
                    onTap: () {
                      Get.find<EditModeController>()
                          .clearAllExperienceFormData();
                      Get.dialog(const UserExperienceDialogBox());
                    },
                    color: Get.find<HomeController>().lightThemeMode.value
                        ? AppColors.black
                        : AppColors.white,
                  )),
            ),
            HeadingWithLineUi(
              heading: "experience",
              lineWidth:
                  Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
            ),
          ],
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Obx(() => controller.userExperienceModelList.isNotEmpty
            ? ListView.separated(
                shrinkWrap: true,
                reverse: true,
                itemCount: controller.userExperienceModelList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: EditButton(
                                onTap: () {
                                  Get.find<EditModeController>()
                                      .initializeEditExperienceFormData(
                                          controller
                                              .userExperienceModelList[index]);
                                  Get.dialog(const UserExperienceDialogBox());
                                },
                                color: Get.find<HomeController>()
                                        .lightThemeMode
                                        .value
                                    ? AppColors.black
                                    : AppColors.white,
                              )),
                          const SizedBox(
                            width: AppDimesions.px_10,
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: EditButton(
                                icon: Icons.delete_outlined,
                                onTap: () {
                                  Get.dialog(DeleteConfirmDialogBox(
                                    deleteItem: controller
                                        .userExperienceModelList[index]
                                        .designation,
                                    onTap: () {
                                      Get.find<EditModeController>()
                                          .deleteExperienceData(controller
                                              .userExperienceModelList[index]);
                                    },
                                  ));
                                },
                                color: Get.find<HomeController>()
                                        .lightThemeMode
                                        .value
                                    ? AppColors.black
                                    : AppColors.white,
                              )),
                        ],
                      ),
                      UserExperienceDataUi(
                        yourTechRole:
                            controller.userExperienceModelList[index].techStack,
                        yourPostion: controller
                            .userExperienceModelList[index].designation,
                        startDate:
                            controller.userExperienceModelList[index].startDate,
                        endDate:
                            controller.userExperienceModelList[index].endDate,
                        companyName: controller
                            .userExperienceModelList[index].companyName,
                        companyLocation: controller
                            .userExperienceModelList[index].companyLocation,
                        listOfYourWorkDoneInComapny: controller
                            .userExperienceModelList[index].experienceIncompany,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: AppDimesions.px_10,
                ),
              )
            : const UserExperienceDataUi(
                yourTechRole: "Your tech stack",
                yourPostion: "Your designation",
                startDate: ["Start", "Date "],
                endDate: ["End", "Date"],
                companyName: "Company name",
                companyLocation: "Company loaction",
                listOfYourWorkDoneInComapny: [
                  "Your experience/work in company",
                  "Your experience/work in company",
                  "Your experience/work in company",
                ],
              ))
      ],
    );
  }
}
