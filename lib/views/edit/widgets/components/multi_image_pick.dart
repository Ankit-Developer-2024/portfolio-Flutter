import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';

class MultiImagePick extends StatelessWidget {
  const MultiImagePick(
      {super.key,
      required this.onTap,
      required this.images,
      required this.deleteImage,
      this.borderColor});
  final VoidCallback onTap;
  final Function(int) deleteImage;
  final RxList<Uint8List?> images;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(AppDimesions.px_2),
            // height: AppDimesions.size_100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimesions.radius_4),
                border: Border.all(
                    width: AppDimesions.px_1,
                    color: borderColor ?? AppColors.black12)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.image),
                const SizedBox(
                  height: AppDimesions.px_4,
                ),
                Text(
                  Utils.getString("pick_images"),
                  style: AppTextStyles.textRegular14mp600(),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        images.isNotEmpty
            ? Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimesions.radius_4),
                    border: Border.all(
                        width: AppDimesions.px_1,
                        color: borderColor ?? AppColors.black12)),
                child: SizedBox(
                  //   width: 300,
                  height: 100,
                  child: Obx(
                    () => ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    AppDimesions.radius_4),
                                child: Image.memory(
                                  images[index] as Uint8List,
                                  width: AppDimesions.size_100,
                                  height: AppDimesions.size_100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              InkWell(
                                onTap: () => deleteImage(index),
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: const Icon(
                                      Icons.delete_outlined,
                                      color: AppColors.black,
                                    )),
                              )
                            ],
                          );
                        }),
                  ),
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
