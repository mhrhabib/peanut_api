import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/common/loader.dart';
import 'package:peanut_api/modules/trades/controller/trade_controller.dart';
import 'package:peanut_api/modules/trades/model/trade_model.dart';
import 'package:peanut_api/routes/app_routes.dart';
import 'package:peanut_api/utils/responsive.dart';

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
      body: controller.obx(
        (state) => ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: state!.length,
              itemBuilder: (context, index) {
                TradeModel trade = state[index];

                if (state.isNotEmpty) {
                  return _buildTradeCard(trade);
                }
                return const Center(
                  child: Text("server Error"),
                );
              },
            ),
            verticalSpace(20),
            state.isEmpty
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
                  )
          ],
        ),
        onEmpty: const Center(
          child: Text("Trades are empty"),
        ),
        onLoading: const Loader(),
        onError: (error) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Token expired login again"),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.loginScreen);
                },
                child: const Text("Go to login screen"),
              ),
            ],
          );
        },
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
              trade.currentPrice!.toStringAsFixed(3),
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
            Text(trade.profit!.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }
}
