import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/loader.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/views/edit/widgets/components/image_or_icon_pick.dart';
import 'package:portfolio/views/edit/widgets/components/user_text_field.dart';

class UserHomeDialogBox extends GetView<EditModeController> {
  const UserHomeDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6)),
      title: Text(
        Utils.getString("user_what_i_do_data"),
        textAlign: TextAlign.center,
        style: AppTextStyles.textMedium20mp600(),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: AppDimesions.size_400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                  key: controller.formHomeKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Utils.getString("user_what_i_do"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("image_or_icon"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      Obx(
                        () => Align(
                          alignment: Alignment.center,
                          child: ImageOrIconPick(
                            onTap: () {
                              controller.whatIDoTitlePickImage();
                            },
                            image: controller.whatIDoTitleImage.value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_what_i_do_title"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.whatIDoTitleController,
                        hintText: "Enter title",
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Title is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_what_i_do_desc"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller: controller.whatIDoTitleDescController,
                        hintText: "Enter your tech stack desc. that you have.",
                        maxLine: 10,
                        minLine: 4,
                        validate: (val) {
                          if (val!.isEmpty) {
                            return "Desc. is required";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: AppDimesions.px_10,
                      ),
                      Text(
                        Utils.getString("user_what_i_do_desc_highlight_words"),
                        style: AppTextStyles.textRegular14mp600(),
                      ),
                      UserTextField(
                        controller:
                            controller.whatIDoTitleDescHighLightWordsController,
                        hintText:
                            "Enter those word that you want to highlight words\nEx: I have strong knwolage of coding and DSA->Des. text\nIn this field you write coding , DSA or coding and DSA\nMore word must be seperate by comma(,) ",
                        maxLine: 5,
                        minLine: 4,
                        validate: (val) {
                          return null;
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      actions: [
        Obx(
          () => controller.isApiLoderShow.value
              ? const Loader()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                        // Close the dialog
                      },
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.textRegular14mp400(),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.userWhatIDoModel.value != null
                            ? controller.updateHomeWhatIdoData()
                            : controller.uploadHomeWhatIdoData();
                      },
                      child: Text(
                        controller.userWhatIDoModel.value != null
                            ? "Update"
                            : 'Sumbit',
                        style: AppTextStyles.textRegular14mp400(),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
