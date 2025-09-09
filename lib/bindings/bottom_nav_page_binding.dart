import 'package:get/get.dart';
import 'package:project_17_6/controller/navigation_controller.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/controller/auth_controller.dart';

class BottomNavPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}