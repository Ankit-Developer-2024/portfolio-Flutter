import 'package:get/get.dart';
import 'package:protfolio/core/localization/localization.dart';
import 'package:protfolio/viewmodels/home_controller.dart';

class GereralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Localization(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}
