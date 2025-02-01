import 'package:get/get.dart';
import 'package:portfolio/core/routing/app_route.dart';
import 'package:portfolio/core/routing/bindings/edit_mode_binding.dart';
import 'package:portfolio/core/routing/bindings/home_binding.dart';
import 'package:portfolio/core/routing/middlewares/edit_view_middleware.dart';
import 'package:portfolio/views/edit/edit_view.dart';
import 'package:portfolio/views/home/home_view.dart';

class AppPages {
  static List<GetPage> route = [
    GetPage(
      name: AppRoute.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoute.editMode,
        page: () => const EditView(),
        binding: EditModeBinding(),
        middlewares: [EditViewMiddleware()]),
  ];
}
