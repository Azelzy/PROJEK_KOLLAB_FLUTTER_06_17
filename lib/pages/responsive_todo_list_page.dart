import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/pages/Mobile/todo_list_page_mobile.dart';
import 'package:project_17_6/pages/Widescreen/todo_list_page_wide.dart';

class ResponsiveTodoListPage extends StatelessWidget {
  ResponsiveTodoListPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains){
          controller.updateLayout(constrains);
        return Obx(()=> controller.isMobile.value
         ? TodoListPageMobile()
         : TodoListPageWide());
      }),
    );
  }
}