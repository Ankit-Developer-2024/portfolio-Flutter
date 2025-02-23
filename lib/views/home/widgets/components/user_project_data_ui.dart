import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/bullet_list.dart';
import 'package:portfolio/core/app/componetns/delete_confirm_dialog_box.dart';
import 'package:portfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:portfolio/core/enum/app_enum.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/data/models/user_project_model.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:portfolio/views/edit/widgets/user_project_dialog_box.dart';
import 'package:portfolio/views/home/widgets/components/edit_button.dart';

class UserProjectDataUi extends GetView<HomeController> {
  const UserProjectDataUi(
      {super.key,
      required this.index,
      required this.projectTechUsed,
      required this.projectDevelopmentIn,
      required this.projectName,
      required this.listOfImagesPath,
      required this.projectDescription,
      this.projectModel,
      this.projectURL,
      this.color,
      this.isEditMode,
      this.boxWidth});

  final int index;
  final String projectTechUsed;
  final String projectDevelopmentIn;
  final String projectName;
  final String? projectURL;
  final List<String> listOfImagesPath;
  final List<String> projectDescription;
  final Color? color;
  final double? boxWidth;
  final bool? isEditMode;
  final UserProjectModel? projectModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth != null
          ? boxWidth! < AppDimesions.size_550
              ? boxWidth! - AppDimesions.size_10
              : boxWidth! / 2 - AppDimesions.size_10
          : 200,
      //  padding: const EdgeInsets.only(top: AppDimesions.px_8),
      decoration: BoxDecoration(
          color: color ?? AppColors.lightBlueish,
          borderRadius: BorderRadius.circular(AppDimesions.radius_8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              InkWell(
                onTap: () {
                  (projectURL != null && projectURL!.isNotEmpty)
                      ? Get.find<HomeController>().goToSocialMedia(projectURL)
                      : toast(
                          title: "This project is not hosted yet",
                          icon: ToastIcon.info);
                },
                child: CarouselSlider(
                  items: listOfImagesPath.isEmpty
                      ? [
                          const Icon(
                            Icons.image,
                            size: AppDimesions.size_100,
                          )
                        ]
                      : listOfImagesPath.map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    AppDimesions.radius_8),
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Durations.extralong4,
                    autoPlayAnimationDuration: Durations.long4,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 1,
                  ),
                ),
              ),
              (isEditMode != null && isEditMode!)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: EditButton(
                            onTap: () async {
                              projectModel != null
                                  ? await Get.find<EditModeController>()
                                      .initializeEditProjectFormData(
                                          projectModel!)
                                  : null;
                              projectModel != null
                                  ? Get.dialog(const UserProjectDialogBox())
                                  : null;
                            },
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(
                          width: AppDimesions.px_10,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: EditButton(
                            icon: Icons.delete_outline,
                            onTap: () {
                              Get.dialog(DeleteConfirmDialogBox(
                                  deleteItem: projectName,
                                  onTap: () {
                                    projectModel != null
                                        ? Get.find<EditModeController>()
                                            .deleteProjectData(projectModel!)
                                        : null;
                                  }));
                            },
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              index != -1
                  ? AnimatedPositioned(
                      duration: const Duration(seconds: 2),
                      top: controller.userProjectModelList[index]
                              .isOpenProjectDescription
                          ? 0
                          : -350,
                      child: Container(
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            color: color?.withOpacity(0.9) ??
                                AppColors.lightBlueish,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppDimesions.radius_8),
                                topRight:
                                    Radius.circular(AppDimesions.radius_8))),
                        width: boxWidth != null
                            ? boxWidth! < AppDimesions.size_550
                                ? boxWidth! - AppDimesions.size_10
                                : boxWidth! / 2 - AppDimesions.size_10
                            : 200,
                        height: 350,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimesions.px_8),
                            child: BulletList(dataList: projectDescription),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(
            height: AppDimesions.px_6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppDimesions.px_24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  endIndent: AppDimesions.px_24,
                  color: AppColors.primary,
                ),
                Text(
                  "$projectDevelopmentIn | $projectTechUsed",
                  style: AppTextStyles.textMedium16mp400(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                Text(
                  projectName,
                  style: AppTextStyles.textMedium16mp600(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              index != -1
                  ? controller.toggleIsOpenProjectDescription(index)
                  : null;
            },
            onHover: (val) {
              index != -1
                  ? controller.toggleIsProjectItemHovering(index)
                  : null;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: AppDimesions.px_6),
              decoration: BoxDecoration(
                  color: (index != -1 &&
                          controller.userProjectModelList[index]
                              .isProjectItemHovering)
                      ? index % 2 != 0
                          ? const Color.fromARGB(255, 48, 149, 251)
                              .withOpacity(0.6)
                          : AppColors.primary.withOpacity(0.6)
                      : AppColors.transparent,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(AppDimesions.radius_8),
                      bottomLeft: Radius.circular(AppDimesions.radius_8))),
              child: Padding(
                padding: const EdgeInsets.only(left: AppDimesions.px_24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Project Description",
                      style: AppTextStyles.textRegular14mp600(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                    const Icon(Icons.arrow_drop_up)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
