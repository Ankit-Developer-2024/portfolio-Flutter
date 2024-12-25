import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protfolio/core/app/gereral_bindings.dart';
import 'package:protfolio/core/localization/localization.dart';
import 'package:protfolio/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Localization());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      translations: Get.find<Localization>(),
      locale: Localization.englishLocal,
      fallbackLocale: Localization.fallBackLocal,
      initialBinding: GereralBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          onSurface: Colors.black,
          onPrimary: Colors.black,
          primary: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}
