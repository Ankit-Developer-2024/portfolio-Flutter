import 'package:flutter/material.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static textRegular14mp400({color = AppColors.black}) {
    return GoogleFonts.aBeeZee(
      textStyle:
          TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w400),
    );
  }

  static textRegular14mp600({color = AppColors.black}) {
    return GoogleFonts.aBeeZee(
      textStyle:
          TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w600),
    );
  }

  static textMedium16mp400(
      {color = AppColors.black, fontStyle = FontStyle.normal}) {
    return GoogleFonts.aBeeZee(
      textStyle: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.w400,
          fontStyle: fontStyle),
    );
  }

  static textMedium16mp600({color = AppColors.black}) {
    return GoogleFonts.aBeeZee(
      textStyle:
          TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w600),
    );
  }

  static textMedium20mp600({color = AppColors.black}) {
    return GoogleFonts.aBeeZee(
      textStyle:
          TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w600),
    );
  }

  static textMedium30mpbold({color = AppColors.black}) {
    return GoogleFonts.aBeeZee(
      textStyle:
          TextStyle(fontSize: 30, color: color, fontWeight: FontWeight.bold),
    );
  }
}
