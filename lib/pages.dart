import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/bindings/bottom_nav_page_binding.dart';
import 'package:project_17_6/pages/bottom_nav_page.dart';
import 'package:project_17_6/pages/Mobile/login_page_mobile.dart';
import 'package:project_17_6/pages/Mobile/register_page_mobile.dart';
import 'package:project_17_6/pages/Mobile/profile_azka_page.dart';
import 'package:project_17_6/pages/Mobile/profile_ihsan_page.dart';
import 'package:flutter/material.dart';
import 'package:project_17_6/pages/responsive_login_page.dart';
import 'package:project_17_6/pages/responsive_register_page.dart';

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
      page: () => const TodoEditPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profileAzka,
      page: () => const ProfileAzkaPage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profileIhsan,
      page: () => const ProfileIhsanPage(),
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
