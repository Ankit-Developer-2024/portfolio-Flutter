import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';

class ShowImageDialogBox extends StatelessWidget {
  const ShowImageDialogBox({super.key, required this.image});
  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(AppDimesions.radius_4),
          child: InteractiveViewer(
            maxScale: 3,
            child: Image.memory(
              image,
              width: 400,
              height: 400,
            ),
          ),
        )),
        const SizedBox(
          height: AppDimesions.px_10,
        ),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.remove_circle,
              color: AppColors.white,
            ))
      ],
    );
  }
}
