import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';

class ShowPdfDialogBox extends StatelessWidget {
  const ShowPdfDialogBox({super.key, required this.pdf});
  final PdfController pdf;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 400,
            height: 400,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimesions.radius_4),
                child: PdfView(controller: pdf))),
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
