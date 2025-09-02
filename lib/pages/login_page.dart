import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/widget_button.dart';
import 'package:project_17_6/widgets/widget_textfield.dart';

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
      appBar: AppBar(title: const Text("Login Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Please login using your username and password."),
            //const SizedBox(height: 16),
            // Center(
            //   child: Image.asset('assets/gambar.png', width: 200, height: 200),
            // ),
            const SizedBox(height: 16),
            InputField(controller: txtUsername, label: "Username", hint: "Enter your username"),
            const SizedBox(height: 12),
            InputField(controller: txtPassword, label: "Password", hint: "Enter your password", obscure: true),
            const SizedBox(height: 16),
            Center(
              child: PrimaryButton(
                text: "Login",
                onPressed: () {
                  final ok = auth.login(txtUsername.text, txtPassword.text);
                  if (ok) {
                    Get.snackbar("Success", "Login Successful");
                    Get.offAllNamed(AppRoutes.dashboard);
                  } else {
                    Get.snackbar("Error", "Login Error");
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text("Register (dummy)"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
