import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peanut_api/utils/internet_checkt.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage().initStorage;
  InternetCheck.init();
  runApp(const MyApp());
}
