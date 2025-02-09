import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_dimesions.dart';

class Loader extends StatelessWidget {
  const Loader({super.key,this.radius});
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: radius ??  AppDimesions.size_25,
        height: radius ??  AppDimesions.size_25,
        child: const CircularProgressIndicator());
  }
}
