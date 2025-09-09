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
            "Login berhasil! Selamat datang $username",
            backgroundColor: const Color(0xFF84994F),
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(16),
          );
        });
        return true;
      }
    }
    // Show error snackbar immediately
    Get.snackbar(
      "ERROR",
      "Username atau password salah",
      backgroundColor: const Color(0xFFB45253),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
    return false;
  }

  bool register(String username, String password) {
    // Check if username already exists
    for (var user in users) {
      if (user["username"] == username) {
        Get.snackbar(
          "ERROR",
          "Username sudah pernah digunakan",
          backgroundColor: const Color(0xFFB45253),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
        return false;
      }
    }

    users.add({"username": username, "password": password});

    // Navigate back to login and show success snackbar
    Get.back();
    Future.delayed(const Duration(milliseconds: 300), () {
      Get.snackbar(
        "SUCCESS",
        "Akun berhasil dibuat! Silahkan login",
        backgroundColor: const Color(0xFF84994F),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    });
    return true;
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
    Get.snackbar(
      "LOGOUT",
      "Anda telah logout",
      backgroundColor: const Color(0xFF84994F),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  void showEmptyFieldsError() {
    Get.snackbar(
      "ERROR",
      "Semua isian harus diisi",
      backgroundColor: const Color(0xFFB45253),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
