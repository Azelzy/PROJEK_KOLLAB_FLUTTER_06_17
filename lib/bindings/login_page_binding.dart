import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}