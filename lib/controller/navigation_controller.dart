import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/pages/Mobile/history_page.dart';
import 'package:project_17_6/pages/responsive_todo_list_page.dart';

class NavigationController extends GetxController { 
  var currentIndex = 0.obs;

  final pages = [ResponsiveTodoListPage(), const HistoryPage()];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
