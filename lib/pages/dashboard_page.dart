import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/home_controller.dart';
import 'package:project_17_6/pages/home_page.dart';
import 'package:project_17_6/pages/history_page.dart';
import 'package:project_17_6/pages/profile_page.dart';

class DashboardPage extends GetView<HomeController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            HomePage(),
            HistoryPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      );
    });
  }
}