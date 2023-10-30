import 'package:get/get.dart';
import 'package:peanut_api/modules/login/login_screen.dart';
import 'package:peanut_api/modules/main/bindings/mainbindings.dart';
import 'package:peanut_api/modules/main/main_screen.dart';
import 'package:peanut_api/modules/profile/profile_screen.dart';
import 'package:peanut_api/modules/trades/bindings/trade_bindings.dart';
import 'package:peanut_api/modules/trades/trades_screen.dart';
import 'package:peanut_api/routes/app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => MainScreen(),
      binding: MainBindigns(),
    ),
    GetPage(
      name: AppRoutes.tradesScreen,
      page: () => TradesScreen(),
      binding: TradesBindings(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
    ),
  ];
}
