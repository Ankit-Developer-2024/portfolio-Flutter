import 'package:flutter/material.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/views/widgets/components/heading_with_line_ui.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/views/widgets/components/user_experience_data_ui.dart';

class UserExperienceSection extends StatelessWidget {
  const UserExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeadingWithLineUi(heading: "experience"),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
