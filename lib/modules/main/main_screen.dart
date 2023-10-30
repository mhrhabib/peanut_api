import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/modules/main/controller/nav_controller.dart';

class MainScreen extends GetView<NavController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.screens.elementAt(controller.index.value),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: (value) {
            controller.changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.amberAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: 'Profile',
              backgroundColor: Colors.amberAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Logout',
              backgroundColor: Colors.amberAccent,
            ),
          ],
        ),
      ),
    );
  }
}
