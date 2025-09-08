import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/bindings/all_binding.dart';
import 'package:project_17_6/pages/bottom_nav_page.dart';
import 'package:project_17_6/pages/login_page.dart';
import 'package:project_17_6/pages/register_page.dart';
import 'package:project_17_6/pages/todo_list_edit_page.dart';
import 'package:project_17_6/pages/profile_azka_page.dart';
import 'package:project_17_6/pages/profile_ihsan_page.dart';

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
      name: AppRoutes.todoListEdit,
      page: () => const TodoListEditPage(),
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
