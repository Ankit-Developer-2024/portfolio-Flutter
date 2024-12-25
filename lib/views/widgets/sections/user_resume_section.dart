import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/conatiner_image_text.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/widgets/components/heading_with_line_ui.dart';
import 'package:protfolio/views/widgets/components/user_resume_data_ui.dart';

class UserResumeSection extends GetView<HomeController> {
  const UserResumeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         HeadingWithLineUi(heading: "resume_", lineWidth: Get.width <= 470 ? 100 : AppDimesions.px_225,),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Wrap(
            runAlignment: WrapAlignment.start,
            runSpacing: AppDimesions.px_10,
            spacing: AppDimesions.px_10,
            alignment: WrapAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth < AppDimesions.size_550
                    ? constraints.maxWidth
                    : constraints.maxWidth / 2 - AppDimesions.px_10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConatinerImageText(
                      imageName: "education.png",
                      skillName: Utils.getString("education"),
                      textStyle: AppTextStyles.textMedium20mp600(),
                      color: AppColors.transparent,
                    ),
                    UserResumeDataUi(
                        date: "2020-2024",
                        userClass: Utils.getString("b_tech"),
                        role: Utils.getString("cse"),
                        institute: Utils.getString("gju")),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    UserResumeDataUi(
                      date: "2019-2020",
                      userClass: Utils.getString("secondary_school"),
                      role: Utils.getString("non_medical"),
                      institute: Utils.getString("aps"),
                      color: AppColors.lightLightOrangish,
                    ),
                  ],
                ),
              ),

              //------------
              SizedBox(
                width: constraints.maxWidth < AppDimesions.size_550
                    ? constraints.maxWidth
                    : constraints.maxWidth / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConatinerImageText(
                      imageName: "experience.png",
                      skillName: Utils.getString("experience"),
                      textStyle: AppTextStyles.textMedium20mp600(),
                      color: AppColors.transparent,
                    ),
                    UserResumeDataUi(
                      date: "2024",
                      userClass: Utils.getString("flutter_developer"),
                      role: Utils.getString("sde_1"),
                      institute: Utils.getString(
                          "company_krishiacharya_with_location"),
                      color: AppColors.lightLightOrangish,
                    ),
                    const SizedBox(
                      height: AppDimesions.px_10,
                    ),
                    UserResumeDataUi(
                      date: "Feb 2024-July 2024",
                      userClass: Utils.getString("flutter_developer"),
                      role: Utils.getString("intern"),
                      institute: Utils.getString(
                          "company_krishiacharya_with_location"),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Text(
          Utils.getString("work_skills"),
          style: AppTextStyles.textMedium20mp600(),
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        Wrap(
          spacing: AppDimesions.px_10,
          runSpacing: AppDimesions.px_10,
          children: controller.listOfSkillName.map((skill) {
            return Container(
              padding: const EdgeInsets.all(AppDimesions.px_8),
              decoration: BoxDecoration(
                  color: AppColors.lightBlueish,
                  borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
              child: Text(
                skill,
                style: AppTextStyles.textRegular14mp600(),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
