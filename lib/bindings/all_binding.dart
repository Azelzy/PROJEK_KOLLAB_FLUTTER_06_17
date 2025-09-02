import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/controller/home_controller.dart';
import 'package:project_17_6/controller/todo_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}
