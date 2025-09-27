import 'package:get/get.dart';
import 'package:project_17_6/controller/splash_controller.dart';
import 'package:project_17_6/controller/auth_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<SplashController>(SplashController());
  }
}