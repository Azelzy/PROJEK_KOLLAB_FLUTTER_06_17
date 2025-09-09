import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';

class BrutalistDrawer extends StatelessWidget {
  const BrutalistDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: Colors.black,
            child: const SafeArea(
              child: Text(
                "ANGGOTA KELOMPOK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  BrutalistButton(
                    text: "AZKA EL FACHRIZY",
                    onPressed: () => Get.toNamed(AppRoutes.profileAzka),
                  ),
                  const SizedBox(height: 16),
                  BrutalistButton(
                    text: "IHSAN H.U",
                    onPressed: () => Get.toNamed(AppRoutes.profileIhsan),
                  ),
                  const Spacer(),
                  BrutalistButton(
                    text: "LOGOUT",
                    backgroundColor: Colors.red,
                    onPressed: () => auth.logout(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}