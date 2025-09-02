import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  bool login(String username, String password) {
    if (username == "Ihsan" && password == "Ihsan") {
      isLoggedIn.value = true;
      return true;
    }
    return false;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}
