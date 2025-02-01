import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/utils/utilty/utils.dart';

class ImageOrIconPick extends StatelessWidget {
  const ImageOrIconPick({super.key, required this.onTap, required this.image,this.borderColor});
  final VoidCallback onTap;
  final Uint8List? image;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: image != null
          ? Container(
              width: 400,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimesions.radius_4),
                child: Image.memory(
                  image as Uint8List,
                  width: AppDimesions.size_50,
                  height: AppDimesions.size_50,
                  fit: BoxFit.contain,
                ),
              ),
            )
          : Container(
              width: 400,
              padding: const EdgeInsets.all(AppDimesions.px_2),
              // height: AppDimesions.size_100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimesions.radius_4),
                  border: Border.all(
                      width: AppDimesions.px_1, color: borderColor ?? AppColors.black12)),
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
                    Utils.getString("pick_image"),
                    style: AppTextStyles.textRegular14mp600(),
                  )
                ],
              ),
            ),
    );
  }
}
