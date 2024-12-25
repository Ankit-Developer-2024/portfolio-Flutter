import 'package:flutter/material.dart';
import 'package:protfolio/core/app/componetns/conatiner_image_text.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/core/styles/app_dimesions.dart';
import 'package:protfolio/core/styles/app_test_styles.dart';
import 'package:protfolio/utils/utilty/utils.dart';
import 'package:protfolio/views/widgets/components/heading_with_line_ui.dart';
import 'package:protfolio/views/widgets/components/user_contact_form.dart';

class UserContactSection extends StatelessWidget {
  const UserContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadingWithLineUi(heading: "Contact"),
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
              Container(
                width: constraints.maxWidth < AppDimesions.size_550
                    ? constraints.maxWidth
                    : constraints.maxWidth / 2 - AppDimesions.px_10,
                padding: const EdgeInsets.all(AppDimesions.px_8),
                decoration: BoxDecoration(
                    color: AppColors.lightLightOrangish,
                    borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConatinerImageText(
                        imageName: "phone_call.png",
                        color: AppColors.transparent,
                        skillName: Utils.getString("phone_:")),
                    Padding(
                      padding: const EdgeInsets.only(left: AppDimesions.px_16),
                      child: Text(
                        Utils.getString("phone_no"),
                        style: AppTextStyles.textMedium16mp400(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: constraints.maxWidth < AppDimesions.size_550
                    ? constraints.maxWidth
                    : constraints.maxWidth / 2 - AppDimesions.px_10,
                padding: const EdgeInsets.all(AppDimesions.px_8),
                decoration: BoxDecoration(
                    color: AppColors.lightBlueish,
                    borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConatinerImageText(
                        imageName: "mail.png",
                        color: AppColors.transparent,
                        skillName: Utils.getString("mail_:")),
                    Padding(
                      padding: const EdgeInsets.only(left: AppDimesions.px_16),
                      child: Text(
                        Utils.getString("user_email"),
                        style: AppTextStyles.textMedium16mp400(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
        const SizedBox(
          height: AppDimesions.px_16,
        ),
        const UserContactForm()
      ],
    );
  }
}
