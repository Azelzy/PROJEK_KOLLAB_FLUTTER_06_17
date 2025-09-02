import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/bindings/all_binding.dart';
import 'package:project_17_6/pages/login_page.dart';
import 'package:project_17_6/pages/dashboard_page.dart';
import 'package:project_17_6/pages/add_todo_page.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(), // remove const if constructor is not const
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardPage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: AppRoutes.addTodo,
      page: () => AddTodoPage(),
      binding: AllBinding(),
    ),
  ];
}
