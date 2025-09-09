import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("REGISTER"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  "BUAT\nAKUN!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 40),
                BrutalistTextField(
                  controller: txtUsername,
                  label: "USERNAME",
                  hint: "Masukkan username",
                ),
                const SizedBox(height: 16),
                BrutalistTextField(
                  controller: txtPassword,
                  label: "PASSWORD",
                  hint: "Masukkan password",
                  obscureText: true,
                ),
                const SizedBox(height: 32),
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
                      // Kalau berhasil register, baru pindah ke login
                      Get.offNamed(AppRoutes.login);
                    }
                    // Kalau gagal (username sudah ada), tetap di RegisterPage
                  },
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
