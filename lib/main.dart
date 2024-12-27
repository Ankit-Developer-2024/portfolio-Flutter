import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/gereral_bindings.dart';
import 'package:protfolio/core/localization/localization.dart';
import 'package:protfolio/core/styles/app_colors.dart';
import 'package:protfolio/viewmodels/home_controller.dart';
import 'package:protfolio/views/home_view.dart';
import 'package:toastification/toastification.dart';

void main() {
  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends GetView<HomeController> {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Localization());
    return Obx(
      () => ToastificationWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio',
          translations: Get.find<Localization>(),
          locale: Localization.englishLocal,
          fallbackLocale: Localization.fallBackLocal,
          initialBinding: GereralBindings(),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: AppColors.lightBlackish,
                  onPrimary: AppColors.lightLightOrangish,
                  primaryContainer: AppColors.secondary,
                  onPrimaryContainer: AppColors.black12,
                  secondary: AppColors.lightLightOrangish,
                  onSecondary: AppColors.secondary,
                  error: AppColors.secondary,
                  onError: AppColors.secondary,
                  onSurface:
                      AppColors.white, //this is apply mainly on text , icon etc
                  surface: AppColors
                      .darkModeColor), //this is apply mainly on complete screen where we no give color [default]
              useMaterial3: true),
          themeMode: controller.themeMode.value,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              brightness: Brightness.light,
              seedColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: const HomeView(),
        ),
      ),
    );
  }
}
