import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/universal_toast_ui.dart';
import 'package:portfolio/core/enum/app_enum.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/styles/app_test_styles.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

class EditViewMiddleware extends GetMiddleware {
  TextEditingController passwordController = TextEditingController();

  @override
  GetPage? onPageCalled(GetPage? page) {
    Get.find<HomeController>().replaceFormKey();
    Future.delayed(Duration.zero, () {
      Get.dialog(
        AlertDialog(
          title: Text(
            'Edit Mode',
            style: AppTextStyles.textMedium20mp600(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: passwordController,
                autofocus: true,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    hintText: "Enter edit mode password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder()),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter edit mode password!";
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.find<HomeController>().replaceFormKey();
                Get.offNamed(AppRoute.home); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (passwordController.text == "edit-mode") {
                  Get.back();
                } else {
                  toast(title: "Wrong Password!", icon: ToastIcon.error);
                }
              },
              child: const Text('Sumbit'),
            ),
          ],
        ),
        barrierDismissible: false,
        useSafeArea: true
      );
    });

    return super.onPageCalled(page);
  }
}
