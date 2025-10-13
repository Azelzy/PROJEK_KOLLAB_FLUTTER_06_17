import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/bindings/login_page_binding.dart';
import 'package:project_17_6/bindings/register_page_binding.dart';
import 'package:project_17_6/bindings/bottom_nav_page_binding.dart';
import 'package:project_17_6/bindings/todo_list_edit_page.dart';
import 'package:project_17_6/bindings/splash_screen_binding.dart';
import 'package:project_17_6/pages/responsive_login_page.dart';
import 'package:project_17_6/pages/responsive_profile_azka_page.dart';
import 'package:project_17_6/pages/responsive_profile_ihsan_page.dart';
import 'package:project_17_6/pages/responsive_register_page.dart';
import 'package:project_17_6/pages/responsive_todo_list_edit_page.dart';
import 'package:project_17_6/pages/splash_screen.dart';
import 'package:project_17_6/pages/bottom_nav_page.dart';
import 'package:project_17_6/pages/Mobile/profile_azka_page_mobile.dart';
import 'package:project_17_6/pages/Mobile/profile_ihsan_page_mobile.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => ResponsiveLoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => ResponsiveRegisterPage(),
      binding: RegisterPageBinding(),
    ),
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
      binding: BottomNavPageBinding(),
    ),
    GetPage(
      name: AppRoutes.todoListEdit,
      page: () => ResponsiveTodoListEditPage(),
      binding: TodoListEditPageBinding(),
    ),
    GetPage(
      name: AppRoutes.profileAzka,
      page: () => ResponsiveProfileAzkaPage(),
    ),
    GetPage(
      name: AppRoutes.profileIhsan,
      page: () => ResponsiveProfileIhsanPage (),
    ),
  ];
}