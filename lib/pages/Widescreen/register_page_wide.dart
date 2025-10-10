import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';

class RegisterPageWide extends StatefulWidget {
  const RegisterPageWide({super.key});

  @override
  State<RegisterPageWide> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPageWide> {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Logo Title Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(color: Colors.black, width: 4),
                  ),
                  child: const Text(
                    "PROJEKT\n6_17",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      height: 1.0,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // === KEEP ORIGINAL "CREATE an ACCOUNT!" TEXT ===
                const Text(
                  "CREATE\nan ACCOUNT!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),

                const SizedBox(height: 8),

                // Japanese version (optional subtitle)
                const Text(
                  "新しいアカウントを作ろう!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 32),

                // USERNAME field
                BrutalistTextField(
                  controller: txtUsername,
                  label: "USERNAME",
                  hint: "Enter username",
                ),

                const SizedBox(height: 16),

                // PASSWORD field
                BrutalistTextField(
                  controller: txtPassword,
                  label: "PASSWORD",
                  hint: "Enter password",
                  obscureText: true,
                ),

                const SizedBox(height: 32),

                // CREATE ACCOUNT button
                BrutalistButton(
                  text: "CREATE ACCOUNT",
                  onPressed: () {
                    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
                      auth.showEmptyFieldsError();
                      return;
                    }

                    bool success = auth.register(
                      txtUsername.text,
                      txtPassword.text,
                    );

                    if (success) {
                      Get.offNamed(AppRoutes.login);
                    }
                  },
                ),

                const SizedBox(height: 16),

                // BACK TO LOGIN button
                BrutalistButton(
                  text: "BACK TO LOGIN",
                  onPressed: () => Get.offNamed(AppRoutes.login),
                  backgroundColor: Colors.grey[800]!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.dispose();
  }
}
