
import 'package:flutter/material.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Flexible(child: Text("Page Not Found", textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,style: AppTextStyles.textMedium16mp600(),)),),
    );
  }
}