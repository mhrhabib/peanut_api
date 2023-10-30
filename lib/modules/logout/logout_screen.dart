import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/common/storage.dart';
import 'package:peanut_api/routes/app_routes.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.purple),
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () {
            storage.write(StoreKeys.apiToken, null);
            Get.toNamed(AppRoutes.loginScreen);
          },
        ),
      ),
    );
  }
}
