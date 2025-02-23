import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_project_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';
import 'package:portfolio/views/home/widgets/components/heading_with_line_ui.dart';
import 'package:portfolio/views/home/widgets/components/user_project_data_ui.dart';

class UserProjectSection extends GetView<HomeController> {
  const UserProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            HeadingWithLineUi(
              heading: "projects",
              lineWidth:
                  Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
            ),
            const Spacer(),
            Obx(
              () => Align(
                alignment: Alignment.topRight,
                child: EditButton(
                  icon: Icons.add,
                  onTap: () {
                    Get.find<EditModeController>().clearAllProjectFormData();
                    Get.dialog(const UserProjectDialogBox());
                  },
                  color: Get.find<HomeController>().lightThemeMode.value
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        LayoutBuilder(builder: (context, contraints) {
          return Obx(
            () => Wrap(
              spacing: AppDimesions.px_10,
              runSpacing: AppDimesions.px_10,
              runAlignment: WrapAlignment.start,
              alignment: WrapAlignment.start,
              children: controller.userProjectModelList.isNotEmpty
                  ? controller.userProjectModelList.reversed.indexed
                      .map((project) {
                      final (index, data) = project;
                      return UserProjectDataUi(
                          index: index,
                          isEditMode: Get.currentRoute == AppRoute.editMode,
                          color: index % 2 != 0
                              ? AppColors.lightBlueish
                              : const Color.fromARGB(225, 255, 238, 217),
                          boxWidth: contraints.maxWidth,
                          projectTechUsed: data.projectTechnologyStack,
                          projectURL: data.projectUrl,
                          projectDevelopmentIn: data.projectDevelopmentField,
                          projectName: data.projectName,
                          projectDescription: data.projectDescription,
                          listOfImagesPath: data.projectImgUrls,
                          projectModel: data);
                    }).toList()
                  : [
                      UserProjectDataUi(
                          index: -1,
                          isEditMode: false,
                          color: const Color.fromARGB(225, 255, 238, 217),
                          boxWidth: contraints.maxWidth,
                          projectTechUsed: "Project tech used",
                          projectURL: "",
                          projectDevelopmentIn:
                              "Your Project Development Field",
                          projectName: "Your project name",
                          projectDescription: const [
                            "Your project Description"
                          ],
                          listOfImagesPath: const [])
                    ],
            ),
          );
        })
      ],
    );
  }
}
