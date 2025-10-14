import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/bindings/bottom_nav_page_binding.dart';
import 'package:project_17_6/pages/bottom_nav_page.dart';
import 'package:flutter/material.dart';
import 'package:project_17_6/pages/responsive_login_page.dart';
import 'package:project_17_6/pages/responsive_profile_azka_page.dart';
import 'package:project_17_6/pages/responsive_profile_ihsan_page.dart';
import 'package:project_17_6/pages/responsive_register_page.dart';
import 'package:project_17_6/pages/responsive_todo_list_edit_page.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () =>  ResponsiveLoginPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => ResponsiveRegisterPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.todoEdit,
      page: () => ResponsiveTodoListEditPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profileAzka,
      page: () => ResponsiveProfileAzkaPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profileIhsan,
      page: () => ResponsiveProfileIhsanPage(),
      binding: BottomNavPageBinding(),
    ),
  ];
}

class TodoEditPage extends StatelessWidget {
  const TodoEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Edit Page')),
      body: const Center(child: Text('This is the Todo Edit Page')),
    );
  }
}
