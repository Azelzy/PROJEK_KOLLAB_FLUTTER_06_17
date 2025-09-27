import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/controller/auth_controller.dart';

class SplashController extends GetxController {
  var statusText = "Initializing App...".obs;

  @override
  void onInit() {
    super.onInit();
    _startSplashSequence();
  }

  Future<void> _startSplashSequence() async {
    // Step 1: Initialize
    statusText.value = "Initializing App...";
    await Future.delayed(const Duration(milliseconds: 800));

    // Step 2: Loading preferences
    statusText.value = "Loading Preferences...";
    await Future.delayed(const Duration(milliseconds: 800));

    // Step 3: Check saved credentials
    statusText.value = "Checking Saved Data...";
    await Future.delayed(const Duration(milliseconds: 800));

    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('saved_username');
    final savedPassword = prefs.getString('saved_password');
    final rememberMe = prefs.getBool('remember_me') ?? false;

    if (rememberMe && savedUsername != null && savedPassword != null) {
      // Step 4: Auto login
      statusText.value = "Auto Login...";
      await Future.delayed(const Duration(milliseconds: 1000));

      // Get AuthController for auto login
      final authController = Get.find<AuthController>();
      bool loginSuccess = authController.loginWithoutNavigation(savedUsername, savedPassword);

      if (loginSuccess) {
        statusText.value = "Welcome back, $savedUsername!";
        await Future.delayed(const Duration(milliseconds: 1000));
        Get.offAllNamed(AppRoutes.base);
      } else {
        statusText.value = "Auto login failed";
        await Future.delayed(const Duration(milliseconds: 1000));
        Get.offAllNamed(AppRoutes.login);
      }
    } else {
      // Step 4: No saved credentials
      statusText.value = "Ready to Login!";
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.offAllNamed(AppRoutes.login);
    }
  }
}