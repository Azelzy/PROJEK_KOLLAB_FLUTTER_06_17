import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            backgroundColor: const Color(0xFF84994F).withOpacity(0.9),
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
      backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
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

  bool register(String username, String password) {
    // Check if username already exists
    for (var user in users) {
      if (user["username"] == username) {
        Get.snackbar(
          "ERROR",
          "Username already taken(¬`‸´¬)",
          backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
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
      backgroundColor: const Color(0xFF84994F).withOpacity(0.9),
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

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
    Get.snackbar(
      "LOGOUT",
      "You have been logged out٩(ˊᗜˋ*)و",
      backgroundColor: const Color(0xFF84994F).withOpacity(0.9),
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
      backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
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
}