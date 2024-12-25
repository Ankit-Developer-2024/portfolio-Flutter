import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/heading_with_line_ui.dart';
import 'package:protfolio/views/widgets/components/user_project_data_ui.dart';

class UserProjectSection extends GetView<HomeController> {
  const UserProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeadingWithLineUi(heading: "Projects"),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        LayoutBuilder(builder: (context, contraints) {
          return Wrap(
            spacing: AppDimesions.px_10,
            runSpacing: AppDimesions.px_10,
            runAlignment: WrapAlignment.start,
            alignment: WrapAlignment.start,
            children: controller.prorfolioProject.indexed.map((project) {
              final (index, data) = project;
              return UserProjectDataUi(
                  color: index % 2 != 0
                      ? AppColors.lightBlueish
                      : AppColors.lightLightOrangish,
                  boxWidth: contraints.maxWidth,
                  projectTechUsed: data["projectTechUsed"],
                  projectDevelopmentIn: data["projectDevelopmentIn"],
                  projectName: data["projectName"],
                  listOfImagesPath: data["listOfImagesPath"]);
            }).toList(),
          );
        })
      ],
    );
  }
}
