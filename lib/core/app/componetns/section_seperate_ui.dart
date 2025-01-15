import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';

class SectionSeperateUi extends StatelessWidget {
  const SectionSeperateUi({super.key, this.sectionHeight = AppDimesions.px_10});
  final double sectionHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(
          top: AppDimesions.px_16, bottom: AppDimesions.px_16),
      height: sectionHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimesions.radius_6),
          color: AppColors.lightBlueish),
    );
  }
}
