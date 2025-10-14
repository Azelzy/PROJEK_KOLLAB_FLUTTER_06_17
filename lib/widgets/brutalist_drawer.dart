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
    final AuthController auth = Get.find<AuthController>();

    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          // HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            color: Colors.black,
            child: const Text(
              "GROUP MEMBERS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // BODY
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  BrutalistButton(
                    text: "AZKA EL FACHRIZY",
                    textColor: Colors.black,
                    onPressed: () => Get.toNamed(AppRoutes.profileAzka),
                    backgroundColor: const Color(0xFFFAA533),
                  ),
                  const SizedBox(height: 16),
                  BrutalistButton(
                    text: "IHSAN H.U",
                    textColor: Colors.black,
                    onPressed: () => Get.toNamed(AppRoutes.profileIhsan),
                    backgroundColor: const Color(0xFF0BA6DF),
                  ),

                  const SizedBox(height: 48),

                  // Tombol Logout
                  BrutalistButton(
                    text: "LOGOUT",
                    backgroundColor: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black.withOpacity(0.4), // opsional
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                ),
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
                                      "ATTENTION!",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  // Content
                                  const Padding(
                                    padding: EdgeInsets.all(24),
                                    child: Text(
                                      "ARE YOU SURE WANT TO LOGOUT TWIN? ૮(˶╥︿╥)ა",
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
                                    padding: const EdgeInsets.fromLTRB(
                                      24,
                                      0,
                                      24,
                                      24,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: _DialogButton(
                                            text: "やめた!",
                                            color: const Color(0xFFB45253),
                                            onTap: () => Navigator.of(
                                              context,
                                            ).pop(false),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: _DialogButton(
                                            text: "はい!",
                                            color: const Color(0xFF84994F),
                                            onTap: () =>
                                                Navigator.of(context).pop(true),
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

// Tombol dalam dialog (tanpa sudut)
class _DialogButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const _DialogButton({
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.zero,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.zero,
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
