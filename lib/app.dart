import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/common/storage.dart';
import 'package:peanut_api/modules/main/bindings/mainbindings.dart';
import 'package:peanut_api/routes/app_pages.dart';
import 'package:peanut_api/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBindigns(),
      title: 'Peanut api',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.routes,
    );
  }
}
