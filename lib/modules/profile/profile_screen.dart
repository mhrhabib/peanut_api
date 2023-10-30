import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/common/loader.dart';
import 'package:peanut_api/modules/profile/controller/profile_controller.dart';
import 'package:peanut_api/utils/responsive.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Profile"),
      ),
      body: Obx(() => profileController.isLoading.value
          ? const Loader()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  buildRow(
                      title: "Address",
                      value: profileController.profle.value.address),
                  buildRow(
                      title: "Balance",
                      value: profileController.profle.value.balance.toString()),
                  buildRow(
                      title: "City",
                      value: profileController.profle.value.city),
                  buildRow(
                      title: "Country",
                      value: profileController.profle.value.country),
                  buildRow(
                    title: "Currency",
                    value: profileController.profle.value.currency.toString(),
                  ),
                  verticalSpace(30),
                  const Align(
                    alignment: Alignment.center,
                    child: Text("Last four numbers of Phonw Number"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      profileController.lastDigit.value,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )),
    );
  }

  Widget buildRow({String? title, String? value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!),
          Text(value!),
        ],
      ),
    );
  }
}
