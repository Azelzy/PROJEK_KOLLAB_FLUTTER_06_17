// ignore_for_file: avoid_print

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
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black, width: 4),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(8, 8),
                                    blurRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Header
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(20),
                                    color: Colors.black,
                                    child: const Text(
                                      "LOGOUT CONFIRMATION",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  // Content
                                  Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: const Text(
                                      "ARE YOU SURE YOU WANT TO LOGOUT?",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  // Buttons
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black, width: 3),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(4, 4),
                                                  blurRadius: 0,
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop(false);
                                                },
                                                child: const Center(
                                                  child: Text(
                                                    "NO",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              border: Border.all(color: Colors.black, width: 3),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(4, 4),
                                                  blurRadius: 0,
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).pop(true);
                                                },
                                                child: const Center(
                                                  child: Text(
                                                    "YES",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ).then((value) {
                        if (value != null && value) {
                          auth.logout();
                          Get.offAllNamed(AppRoutes.login);
                          print('User logged out');
                        } else {
                          print('Logout cancelled');
                        }
                      });
                    },
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