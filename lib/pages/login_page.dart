import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_passwordeyebutton.dart';
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

                // USERNAME field
                BrutalistTextField(
                  label: "USERNAME",
                  controller: txtUsername,
                  hint: "Enter your username",
                ),

                const SizedBox(height: 16),

                // PASSWORD field
                BrutalistPasswordField(
                  controller: txtPassword,
                  hint: "Enter your password",
                ),

                const SizedBox(height: 32),
                BrutalistButton(
                  text: "LOGIN",
                  onPressed: () {
                    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
                      auth.showEmptyFieldsError();
                      return;
                    }
                    auth.login(txtUsername.text, txtPassword.text);
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
