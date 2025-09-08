import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/controller/navigation_controller.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}