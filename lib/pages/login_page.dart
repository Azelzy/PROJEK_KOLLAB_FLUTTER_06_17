// file: login_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              const Text(
                "LOGIN KUY!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 24),
              BrutalistTextField(
                controller: txtUsername,
                label: "USERNAME",
                hint: "Masukkan namamu",
              ),
              const SizedBox(height: 16),
              BrutalistTextField(
                controller: txtPassword,
                label: "PASSWORD",
                hint: "Masukkan passwordmu",
                obscureText: true,
              ),
              const SizedBox(height: 32),
              BrutalistButton(
                text: "LOGIN",
                onPressed: () {
                  if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
                    // Get.snackbar yang dihapus
                    return;
                  }

                  final success = auth.login(
                    txtUsername.text,
                    txtPassword.text,
                  );
                  if (success) {
                    // Get.snackbar yang dihapus
                    Get.offAllNamed(AppRoutes.base);
                  } else {
                    // Get.snackbar yang dihapus
                  }
                },
              ),
              const SizedBox(height: 16),
              BrutalistButton(
                text: "REGISTER",
                onPressed: () => Get.toNamed(AppRoutes.register),
                backgroundColor: Colors.grey[800]!,
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}