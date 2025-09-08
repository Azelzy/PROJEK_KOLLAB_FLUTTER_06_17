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
        // Panggil snackbar di sini sebelum navigasi,
        // sehingga ia memiliki context yang valid.
        Get.snackbar(
          "LOGIN",
          "Berhasil login sebagai $username",
          backgroundColor: const Color(0xFF84994F),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
        // Setelah snackbar muncul, baru lakukan navigasi.
        // Gunakan delay singkat jika perlu, tapi biasanya tidak
        // diperlukan karena Get.offAllNamed sudah menangani ini.
        Get.offAllNamed(AppRoutes.base);
        return true;
      }
    }
    // Panggil snackbar gagal login di sini
    Get.snackbar(
      "ERROR",
      "Username atau password salah!",
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
        // Panggil snackbar jika username sudah ada
        Get.snackbar(
          "ERROR",
          "Username sudah ada!",
          backgroundColor: const Color(0xFFB45253),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
        return false; // Username already exists
      }
    }

    users.add({"username": username, "password": password});
    // Panggil snackbar sukses registrasi
    Get.snackbar(
      "SUCCESS",
      "Registrasi berhasil! Silakan login.",
      backgroundColor: const Color(0xFF84994F),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
    return true;
  }

  void logout() {
    isLoggedIn.value = false;
    // Panggil snackbar terlebih dahulu, baru navigasi.
    Get.snackbar(
      "LOGOUT",
      "Anda telah logout",
      backgroundColor: const Color(0xFF84994F),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
    Get.offAllNamed(AppRoutes.login);
  }
}
