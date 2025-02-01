import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_experience_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';
import 'package:portfolio/views/home/widgets/components/heading_with_line_ui.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/views/home/widgets/components/user_experience_data_ui.dart';

class UserExperienceSection extends StatelessWidget {
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
        LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: EditButton(
                            onTap: () {
                              Get.dialog(const UserExperienceDialogBox());
                            },
                            color:
                                Get.find<HomeController>().lightThemeMode.value
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
                            onTap: () {},
                            color:
                                Get.find<HomeController>().lightThemeMode.value
                                    ? AppColors.black
                                    : AppColors.white,
                          )),
                    ],
                  ),
                  UserExperienceDataUi(
                    yourTechRole: Utils.getString("flutter_developer"),
                    yourPostion: Utils.getString("sde_1"),
                    date: Utils.getString("2024"),
                    companyName: Utils.getString("company_krishiacharya"),
                    companyLocation: Utils.getString("location_gurugram"),
                    listOfYourWorkDoneInComapny: [
                      Utils.getString("sde_1_point_1"),
                      Utils.getString("sde_1_point_2"),
                      Utils.getString("sde_1_point_3"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppDimesions.px_16,
              ),
              UserExperienceDataUi(
                yourTechRole: Utils.getString("flutter_developer"),
                yourPostion: Utils.getString("intern"),
                date: Utils.getString("feb_2024_july_2024"),
                companyName: Utils.getString("company_krishiacharya"),
                companyLocation: Utils.getString("location_gurugram"),
                listOfYourWorkDoneInComapny: [
                  Utils.getString("intern_1_point_1")
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}
