import 'package:get/get.dart';
import 'package:peanut_api/modules/trades/repository/trades_repo.dart';

class TradeController extends GetxController {
  @override
  void onInit() {
    getTrades();
    super.onInit();
  }

  void getTrades() async {
    var data = await TradesRepo.getTrades();
    print(">>>>>>>>>>>>>>>>>>>>> $data");
  }
}
