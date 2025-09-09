import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';

class TodoListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}