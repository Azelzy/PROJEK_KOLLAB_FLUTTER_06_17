import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/bindings/all_binding.dart';
import 'package:project_17_6/pages/bottom_nav_page.dart';
import 'package:project_17_6/pages/login_page.dart';
import 'package:project_17_6/pages/register_page.dart';
import 'package:project_17_6/pages/profile_azka_page.dart';
import 'package:project_17_6/pages/profile_ihsan_page.dart';
import 'package:flutter/material.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.todoEdit,
      page: () => const TodoEditPage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.profileAzka,
      page: () => const ProfileAzkaPage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.profileIhsan,
      page: () => const ProfileIhsanPage(),
      binding: AllBinding(),
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
