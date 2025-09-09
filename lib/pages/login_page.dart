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
  bool _isPasswordVisible = false;

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

                // Password field with custom show/hide button
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PASSWORD",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: txtPassword,
                              obscureText: !_isPasswordVisible,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Masukkan passwordmu",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),

                          // Brutalist show/hide password button
                          Container(
                            margin: const EdgeInsets.all(4),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: _isPasswordVisible
                                  ? Colors.black
                                  : Colors.white,
                              border: Border.all(color: Colors.black, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(2, 2),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _isPasswordVisible
                                      ? Colors.white
                                      : Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
