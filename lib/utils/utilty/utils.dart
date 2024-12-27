import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:protfolio/core/enum/app_enum.dart';
import 'package:universal_html/html.dart'
    as html; // Cross-platform file handling
import 'package:flutter/services.dart'; // For loading assets

class Utils {
  static String getString(String text) {
    return text.tr;
  }

  static String getIcons(String icon) {
    return "/icons/$icon";
  }

  static String getImages(String image) {
    return "/images/$image";
  }

  static String getImagesApi(String image) {
    return "/images/api/$image";
  }

  static String getImagesEcom(String image) {
    return "/images/ecom/$image";
  }

  static String getImagesPortfolio(String image) {
    return "/images/portfolio_img/$image";
  }

  static Future<void> downloadPdf() async {
    try {
      // Load the PDF file from assets

      ByteData data = await rootBundle.load("assets/pdf/Ankit-Resume.pdf");
      Uint8List bytes = data.buffer.asUint8List();

      // Create a Blob and Object URL
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a link element and trigger the download
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'Ankit-Resume.pdf' // Suggested filename
        ..click();

      // Revoke the object URL after download
      html.Url.revokeObjectUrl(url);

      toast(
          title: "Resume Download Successfully",
          icon: ToastIcon.success,
          subTitle: "Contact me if you like my skill.",
          toastDir: Alignment.topLeft);
    } catch (e) {
      toast(
          title: "Resume not Download",
          icon: ToastIcon.success,
          subTitle: "Some error may be occur");
    }
  }
}
