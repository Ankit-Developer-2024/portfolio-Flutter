import 'package:get/get.dart';
import 'package:portfolio/core/localization/localization.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

class GereralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Localization(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
