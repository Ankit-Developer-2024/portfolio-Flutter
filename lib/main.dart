import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/app/componetns/not_found_404.dart';
import 'package:portfolio/core/localization/localization.dart';
import 'package:portfolio/core/routing/app_pages.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/styles/app_colors.dart';
import 'package:portfolio/viewmodels/home_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  // await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['ANON_PUBLIC_KEY']!);
  Get.put<Localization>(Localization(), permanent: true);
  Get.put<HomeController>(HomeController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends GetView<HomeController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ToastificationWrapper(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio',
          translations: Get.find<Localization>(),
          locale: Localization.englishLocal,
          fallbackLocale: Localization.fallBackLocal,
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorScheme: const ColorScheme.dark().copyWith(
                  brightness: Brightness.dark,
                  onSurface:
                      AppColors.black, //this is apply mainly on text , icon etc
                  surface: AppColors
                      .white), //this is apply mainly on complete screen where we no give color [default]
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
          initialRoute: AppRoute.home,
          getPages: AppPages.route,
          unknownRoute:
              GetPage(name: '/not-found', page: () => const NotFound()),
        ),
      ),
    );
  }
}
