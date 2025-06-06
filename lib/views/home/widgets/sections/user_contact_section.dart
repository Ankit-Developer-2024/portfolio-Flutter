import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/conatiner_image_text.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/home/widgets/components/heading_with_line_ui.dart';
import 'package:portfolio/views/home/widgets/components/user_contact_form.dart';

class UserContactSection extends GetView<HomeController> {
  const UserContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingWithLineUi(
          heading: "contanct",
          lineWidth:
              Get.width <= 470 ? AppDimesions.px_70 : AppDimesions.px_225,
        ),
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
              InkWell(
                onTap: () {
                  controller.userModel.value != null
                      ? controller.makePhoneCall(
                          controller.userModel.value!.phoneNumber)
                      : null;
                },
                child: Container(
                  width: constraints.maxWidth < AppDimesions.size_550
                      ? constraints.maxWidth
                      : constraints.maxWidth / 2 - AppDimesions.px_10,
                  padding: const EdgeInsets.all(AppDimesions.px_8),
                  decoration: BoxDecoration(
                      color: AppColors.lightLightOrangish,
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConatinerImageText(
                          imageUrl: "phone_call.png",
                          color: AppColors.transparent,
                          skillName: Utils.getString("phone_:")),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: AppDimesions.px_16),
                        child: SelectableText(
                          controller.userModel.value != null
                              ? controller.userModel.value!.phoneNumber
                              : "Your phone number",
                          style: AppTextStyles.textMedium16mp400(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.userModel.value != null
                      ? controller.sentMail(controller.userModel.value!.email)
                      : null;
                },
                child: Container(
                  width: constraints.maxWidth < AppDimesions.size_550
                      ? constraints.maxWidth
                      : constraints.maxWidth / 2 - AppDimesions.px_10,
                  padding: const EdgeInsets.all(AppDimesions.px_8),
                  decoration: BoxDecoration(
                      color: AppColors.lightBlueish,
                      borderRadius:
                          BorderRadius.circular(AppDimesions.radius_8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConatinerImageText(
                          imageUrl: "mail.png",
                          color: AppColors.transparent,
                          skillName: Utils.getString("mail_:")),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: AppDimesions.px_16),
                        child: SelectableText(
                          controller.userModel.value != null
                              ? controller.userModel.value!.email
                              : "Your email",
                          style: AppTextStyles.textMedium16mp400(),
                        ),
                      )
                    ],
                  ),
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
