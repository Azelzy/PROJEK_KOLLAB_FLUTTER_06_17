import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_edit_page_controller.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';

class TodoListEditPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoListEditPageController>(() => TodoListEditPageController());
    Get.lazyPut<TodoController>(() => TodoController());
  }
}