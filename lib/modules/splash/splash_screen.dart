import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/common/loader.dart';
import 'package:peanut_api/modules/splash/controller/splash_controlle.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    splashController.navigateTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/peanut.jpg"),
            const Loader(),
          ],
        ),
      ),
    );
  }
}
