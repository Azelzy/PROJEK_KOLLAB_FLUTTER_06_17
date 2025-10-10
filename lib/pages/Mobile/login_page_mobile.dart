import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_passwordeyebutton.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';
import 'package:project_17_6/widgets/brutalist_checkbox.dart';

class LoginPageMobile extends StatefulWidget {
  LoginPageMobile({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  State<LoginPageMobile> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageMobile> {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();
  var rememberMe = false.obs;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final auth = Get.find<AuthController>();
    final savedData = await auth.getSavedCredentials();
    
    if (savedData['remember_me'] == true) {
      txtUsername.text = savedData['username'] ?? '';
      txtPassword.text = savedData['password'] ?? '';
      rememberMe.value = true;
    }
  }

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
                  "こんにちは!≧ᗜ≦",
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

                const SizedBox(height: 16),

                // Remember Me Checkbox
                Obx(() => BrutalistCheckbox(
                  value: rememberMe.value,
                  onChanged: (value) => rememberMe.value = value ?? false,
                  label: "REMEMBER ME",
                )),

                const SizedBox(height: 32),
                BrutalistButton(
                  text: "LOGIN",
                  onPressed: () async {
                    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
                      auth.showEmptyFieldsError();
                      return;
                    }

                    bool loginSuccess = auth.login(txtUsername.text, txtPassword.text);
                    
                    if (loginSuccess) {
                      // Save credentials if remember me is checked
                      await auth.saveCredentials(
                        txtUsername.text, 
                        txtPassword.text, 
                        rememberMe.value
                      );
                    }
                  },
                ),
                const SizedBox(height: 16),
                BrutalistButton(
                  text: "REGISTER(Only 1 session)",
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