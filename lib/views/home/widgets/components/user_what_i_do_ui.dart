import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/delete_confirm_dialog_box.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/data/models/user_what_i_do_model.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_home_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';

class UserWhatIDoUi extends GetView<HomeController> {
  const UserWhatIDoUi(
      {super.key,
      required this.maxWidth,
      required this.index,
      required this.whatIDo});
  final double maxWidth;
  final int index;
  final UserWhatIDoModel whatIDo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth < AppDimesions.size_550
          ? maxWidth - AppDimesions.size_10
          : maxWidth / 2 - AppDimesions.size_10,
      padding: const EdgeInsets.symmetric(
          vertical: AppDimesions.px_8, horizontal: AppDimesions.px_16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimesions.radius_8),
          color: index % 2 != 0
              ? AppColors.lightOrangish
              : AppColors.lightBlueish),
      child: Column(
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
                        Get.find<EditModeController>()
                            .initializeEditWhatIDoFormData(whatIDo);
                        Get.dialog(const UserHomeDialogBox());
                      },
                      color: Get.find<HomeController>().lightThemeMode.value
                          ? AppColors.black
                          : AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    width: AppDimesions.px_10,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: EditButton(
                      icon: Icons.delete_outlined,
                      onTap: () {
                        Get.dialog(DeleteConfirmDialogBox(
                          deleteItem: whatIDo.techStackTitle,
                          onTap: () {
                            Get.find<EditModeController>()
                                .deleteHomeWhatIdoData(whatIDo);
                          },
                        ));
                      },
                      color: Get.find<HomeController>().lightThemeMode.value
                          ? AppColors.black
                          : AppColors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  whatIDo.imgUrl != null
                      ? SizedBox(
                          width: AppDimesions.size_25,
                          height: AppDimesions.size_25,
                          child: Image.network(
                            whatIDo.imgUrl!,
                            fit: BoxFit.cover,
                          ))
                      : Text(
                          "</>",
                          style: AppTextStyles.textMedium20mp600(
                              color: index % 2 != 0
                                  ? AppColors.primary
                                  : AppColors.lightOrangish),
                        ),
                  const SizedBox(
                    width: AppDimesions.px_10,
                  ),
                  Text(
                    whatIDo.techStackTitle,
                    style: AppTextStyles.textMedium20mp600(),
                  )
                ],
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              style: AppTextStyles.textRegular14mp400(),
              children: techStackDescriptionUi(
                  desc: whatIDo.techStackDesc,
                  highlightedWord: whatIDo.descHighLightWord),
            ),
          ),
        ],
      ),
    );
  }
}

List<InlineSpan>? techStackDescriptionUi(
    {required String desc, required List<String>? highlightedWord}) {
  List<InlineSpan>? desSpans = [];
  if (highlightedWord != null) {
    List<String> descList = desc.split(" ");
    descList.map((item) {
      desSpans.add(TextSpan(
          text: item,
          style: highlightedWord.contains(item.trim())
              ? AppTextStyles.textRegular14mp600()
              : AppTextStyles.textRegular14mp400()));
      desSpans.add(
        const WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SizedBox(width: AppDimesions.px_4)),
      );
    }).toList();

    return desSpans;
  } else {
    desSpans.add(TextSpan(
        style: AppTextStyles.textRegular14mp400(),
        children: [TextSpan(text: desc)]));
    return desSpans;
  }
}
