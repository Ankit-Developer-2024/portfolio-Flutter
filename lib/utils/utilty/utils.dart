import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:portfolio/core/enum/app_enum.dart';
import 'package:portfolio/data/repository/api_res_in_bytes_repository.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:universal_html/html.dart'
    as html; // Cross-platform file handling
import 'package:flutter/services.dart'; // For loading assets

class Utils {
  static String getString(String text) {
    return text.tr;
  }

  static String getIcons(String icon) {
    return "assets/icons/$icon";
  }


  static Future<void> downloadPdf() async {
    try {
      // Load the PDF file from assets

      ByteData data = await rootBundle.load("assets/pdf/Ankit-Resume.pdf");
      Uint8List bytes = data.buffer.asUint8List();

      if (Get.find<HomeController>().userModel.value != null) {
        final data = await ApiResInBytesRepository().getApiResInBytes(
            url: Get.find<HomeController>().userModel.value!.userResumeUrl);

        if (data.uint8list != null) {
          bytes = data.uint8list!;
        }
      }

      // Create a Blob and Object URL
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a link element and trigger the download
      // final anchor = html.AnchorElement(href: url)
      //   ..target = 'blank'
      //   ..download = 'Ankit-Resume.pdf' // Suggested filename
      //   ..click();

      html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'Ankit-Resume.pdf' // Suggested filename
        ..click();

      // Revoke the object URL after download
      html.Url.revokeObjectUrl(url);

      toast(
        title: "Resume Download Successfully",
        icon: ToastIcon.success,
        subTitle: "Contact me if you like my skill.",
        toastDir: Alignment.topLeft,
      );
    } catch (e) {
      toast(
          title: "Resume not Download",
          icon: ToastIcon.success,
          subTitle: "Some error may be occur");
    }
  }
}
