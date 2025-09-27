import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_17_6/Routes/routes.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var users = <Map<String, String>>[].obs;

  AuthController() {
    // Default admin user
    users.add({"username": "Admin", "password": "12345"});
  }

  bool login(String username, String password) {
    for (var user in users) {
      if (user["username"] == username && user["password"] == password) {
        isLoggedIn.value = true;
        Get.offAllNamed(AppRoutes.base);
        // Show success snackbar after navigation
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.snackbar(
            "SUCCESS",
            "Login successful! Welcome $username ٩(ˊᗜˋ*)و",
            backgroundColor: const Color(0xFF8DA959).withOpacity(0.9),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(16),
            borderRadius: 0,
            borderWidth: 3,
            borderColor: Colors.black,
            boxShadows: [
              const BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 0,
              ),
            ],
          );
        });
        return true;
      }
    }
    // Show error snackbar immediately
    Get.snackbar(
      "ERROR",
      "Username or password is incorrect(¬`‸´¬)",
      backgroundColor: const Color(0xFFB85A5A).withOpacity(0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 0,
      borderWidth: 3,
      borderColor: Colors.black,
      boxShadows: [
        const BoxShadow(
          color: Colors.black,
          offset: Offset(4, 4),
          blurRadius: 0,
        ),
      ],
    );
    return false;
  }

  // Login method without navigation (for splash screen auto-login)
  bool loginWithoutNavigation(String username, String password) {
    for (var user in users) {
      if (user["username"] == username && user["password"] == password) {
        isLoggedIn.value = true;
        return true;
      }
    }
    return false;
  }

  bool register(String username, String password) {
    // Check if username already exists
    for (var user in users) {
      if (user["username"] == username) {
        Get.snackbar(
          "ERROR",
          "Username already taken(¬`‸´¬)",
          backgroundColor: const Color(0xFFB85A5A).withOpacity(0.9),
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(16),
          borderRadius: 0,
          borderWidth: 3,
          borderColor: Colors.black,
          boxShadows: [
            const BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 0,
            ),
          ],
        );
        return false;
      }
    }

    users.add({"username": username, "password": password});

    Get.snackbar(
      "SUCCESS",
      "Account created successfully! Please login٩(ˊᗜˋ*)و",
      backgroundColor: const Color(0xFF8DA959).withOpacity(0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 0,
      borderWidth: 3,
      borderColor: Colors.black,
      boxShadows: [
        const BoxShadow(
          color: Colors.black,
          offset: Offset(4, 4),
          blurRadius: 0,
        ),
      ],
    );
    return true;
  }

  void logout() async {
    isLoggedIn.value = false;
    
    // Clear saved credentials when logging out
    await clearSavedCredentials();
    
    Get.offAllNamed(AppRoutes.login);
    Get.snackbar(
      "LOGOUT",
      "You have been logged out٩(ˊᗜˋ*)و",
      backgroundColor: const Color(0xFF8DA959).withOpacity(0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 0,
      borderWidth: 3,
      borderColor: Colors.black,
      boxShadows: [
        const BoxShadow(
          color: Colors.black,
          offset: Offset(4, 4),
          blurRadius: 0,
        ),
      ],
    );
  }

  void showEmptyFieldsError() {
    Get.snackbar(
      "ERROR",
      "All fields must be filled(¬`‸´¬)",
      backgroundColor: const Color(0xFFB85A5A).withOpacity(0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 0,
      borderWidth: 3,
      borderColor: Colors.black,
      boxShadows: [
        const BoxShadow(
          color: Colors.black,
          offset: Offset(4, 4),
          blurRadius: 0,
        ),
      ],
    );
  }

  // SharedPreferences methods
  Future<void> saveCredentials(String username, String password, bool rememberMe) async {
    final prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('saved_username', username);
      await prefs.setString('saved_password', password);
      await prefs.setBool('remember_me', true);
    } else {
      await prefs.remove('saved_username');
      await prefs.remove('saved_password');
      await prefs.setBool('remember_me', false);
    }
  }

  Future<void> clearSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('saved_username');
    await prefs.remove('saved_password');
    await prefs.setBool('remember_me', false);
  }

  Future<Map<String, dynamic>> getSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('saved_username') ?? '',
      'password': prefs.getString('saved_password') ?? '',
      'remember_me': prefs.getBool('remember_me') ?? false,
    };
  }
}