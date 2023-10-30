import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/common/loader.dart';
import 'package:peanut_api/modules/trades/controller/trade_controller.dart';
import 'package:peanut_api/modules/trades/model/trade_model.dart';

class TradesScreen extends StatelessWidget {
  TradesScreen({super.key});

  final TradeController controller = Get.put(TradeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Trades"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? const Loader()
                  : ListView.builder(
                      itemCount: controller.trades.length,
                      itemBuilder: (context, index) {
                        TradeModel trade = controller.trades[index];
                        if (controller.trades.isEmpty) {
                          return const Center(
                            child: Text("Trades are empty"),
                          );
                        }
                        if (controller.trades.isNotEmpty) {
                          return _buildTradeCard(trade);
                        }
                        return const Center(
                          child: Text("server Error"),
                        );
                      },
                    ),
            ),
          ),
          Obx(
            () => controller.trades.isEmpty
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Total Profit: ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(controller.calculateProfit().toStringAsFixed(2)),
                    ],
                  ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTradeCard(TradeModel trade) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(trade.digits.toString())),
        title: Row(
          children: [
            const Text('Current price:'),
            Text(
              trade.currentPrice.toString(),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            const Text('Ticketa; '),
            Text(trade.ticket.toString()),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Profit'),
            Text(trade.profit.toString()),
          ],
        ),
      ),
    );
  }
}
