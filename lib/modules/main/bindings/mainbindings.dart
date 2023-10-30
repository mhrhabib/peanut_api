import 'package:get/get.dart';
import 'package:peanut_api/modules/main/controller/nav_controller.dart';
import 'package:peanut_api/modules/trades/controller/trade_controller.dart';

class MainBindigns extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
    Get.lazyPut(() => TradeController());
  }
}
