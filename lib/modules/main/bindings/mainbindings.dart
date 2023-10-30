import 'package:get/get.dart';
import 'package:peanut_api/modules/main/controller/nav_controller.dart';

class MainBindigns extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
  }
}
