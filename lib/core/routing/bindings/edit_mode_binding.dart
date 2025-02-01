import 'package:get/get.dart';
import 'package:portfolio/viewmodels/edit_mode_controller.dart';

class EditModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditModeController>(EditModeController());
  }
}
