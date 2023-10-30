import 'package:get/get.dart';
import 'package:peanut_api/modules/splash/controller/splash_controlle.dart';

class InternetCheck {
  static void init() {
    Get.put<SplashController>(SplashController(), permanent: true);
  }
}
