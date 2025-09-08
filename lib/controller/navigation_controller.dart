import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/pages/todo_list_page.dart';
import 'package:project_17_6/pages/history.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;

  final pages = [const TodoListPage(), const HistoryPage()];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
