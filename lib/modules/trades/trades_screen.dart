import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/modules/trades/controller/trade_controller.dart';

class TradesScreen extends StatelessWidget {
  TradesScreen({super.key});

  final TradeController tradeController = Get.put(TradeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trades"),
      ),
    );
  }
}
