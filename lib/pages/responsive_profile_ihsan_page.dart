import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/pages/Mobile/profile_ihsan_page_mobile.dart';
import 'package:project_17_6/pages/Widescreen/profile_ihsan_page_wide.dart';

class ResponsiveProfileIhsanPage extends StatelessWidget {
  ResponsiveProfileIhsanPage({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains){
          controller.updateLayout(constrains);
        return Obx(()=> controller.isMobile.value
         ? ProfileIhsanPageMobile()
         : ProfileIhsanPageWide());
      }),
    );
  }
}