import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/styles/app_colors.dart';

class EditButton extends StatelessWidget {
  const EditButton(
      {super.key, required this.onTap, this.color, this.icon, this.iconSize});
  final Color? color;
  final VoidCallback onTap;
  final IconData? icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Get.currentRoute == AppRoute.editMode
        ? InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Icon(
                icon ?? Icons.mode_edit_outlined,
                color: color ?? AppColors.white,
                size: iconSize ?? 22,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
