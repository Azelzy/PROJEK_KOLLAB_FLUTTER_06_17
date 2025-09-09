import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/navigation_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Obx(
                () => BrutalistButton(
                  text: "TODO LIST",
                  onPressed: () => controller.changePage(0),
                  backgroundColor: controller.currentIndex.value == 0
                      ? Colors.black
                      : Colors.white,
                  textColor: controller.currentIndex.value == 0
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Obx(
                () => BrutalistButton(
                  text: "COMPLETED TODO",
                  onPressed: () => controller.changePage(1),
                  backgroundColor: controller.currentIndex.value == 1
                      ? Colors.black
                      : Colors.white,
                  textColor: controller.currentIndex.value == 1
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
