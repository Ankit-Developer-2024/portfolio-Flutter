import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/section_seperate_ui.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/nav_bar_button.dart';
import 'package:protfolio/views/widgets/sections/user_contact_section.dart';
import 'package:protfolio/views/widgets/sections/user_experience_section.dart';
import 'package:protfolio/views/widgets/sections/user_home_section.dart';
import 'package:protfolio/views/widgets/sections/user_project_section.dart';
import 'package:protfolio/views/widgets/sections/user_resume_section.dart';
import 'package:protfolio/views/widgets/sections/user_skills_section.dart';

class UserSection extends GetView<HomeController> {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: AppDimesions.px_16,
          ),
          Text(
            controller.navBarButtonHoverIndex.toString(),
            style: TextStyle(fontSize: 0),
          ),
          Text(
            controller.navBarButtonSelectedIndex.toString(),
            style: TextStyle(fontSize: 0),
          ),
          NavBarButton(),
          const SizedBox(
            height: AppDimesions.px_10,
          ),
          Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                  vertical: AppDimesions.px_16, horizontal: AppDimesions.px_16),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
              child: controller
                  .getUserSection(controller.navBarButtonSelectedIndex.value)),
        ],
      ),
    );
  }
}
