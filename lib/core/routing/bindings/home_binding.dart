import 'package:get/get.dart';
import 'package:portfolio/viewmodels/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
