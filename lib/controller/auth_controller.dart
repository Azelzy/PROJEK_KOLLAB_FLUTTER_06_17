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
        return true;
      }
    }
    return false;
  }

  bool register(String username, String password) {
    // Check if username already exists
    for (var user in users) {
      if (user["username"] == username) {
        return false; // Username already exists
      }
    }

    users.add({"username": username, "password": password});
    return true;
  }

  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed(AppRoutes.login);
  }
}
