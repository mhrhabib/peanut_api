import 'package:get/get.dart';
import 'package:peanut_api/modules/trades/model/trade_model.dart';
import 'package:peanut_api/modules/trades/repository/trades_repo.dart';

class TradeController extends GetxController {
  var trades = <TradeModel>[].obs;
  var isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    getTrades();
    super.onInit();
  }

  void getTrades() async {
    isLoading.value = true;
    var data = await TradesRepo.getTrades();
    print(">>>>>>>>>>>>>>>>>>>>> $data");
    trades.addAll(data);
    isLoading.value = false;
  }

  double calculateProfit() {
    double totalProfit = 0.0;

    List<double?> profit = trades.map((element) => element.profit).toList();

    for (var i in profit) {
      totalProfit = totalProfit + i!;
    }
    return totalProfit;
  }
}
