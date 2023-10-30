import 'package:get/get.dart';
import 'package:peanut_api/modules/trades/controller/trade_controller.dart';

class TradesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TradeController());
  }
}
