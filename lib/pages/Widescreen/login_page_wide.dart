import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_passwordeyebutton.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';
import 'package:project_17_6/widgets/brutalist_checkbox.dart';

class LoginPageWide extends StatefulWidget {
  LoginPageWide({super.key});

  final AuthController controller = Get.put(AuthController());

  @override
  State<LoginPageWide> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageWide> {
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
      WidgetsBinding.instance.addPostFrameCallback((_) {
      rememberMe.value = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        // Cek apakah layar lebar atau sempit
        bool isWide = constraints.maxWidth > 600;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: isWide
                ? Row(
                    children: [
                      // Bagian kiri (logo)
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.black,
                          padding: const EdgeInsets.all(32),
                          child: const Center(
                            child: Text(
                              "PROJEKT\n6_17",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                height: 1.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),

                      // Bagian kanan (form)
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 400),
                                child: _buildForm(auth),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SingleChildScrollView(
                      child: _buildForm(auth, showLogo: true),
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildForm(AuthController auth, {bool showLogo = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),

        if (showLogo)
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

        if (showLogo) const SizedBox(height: 40),

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
        Obx(
          () => BrutalistCheckbox(
            value: rememberMe.value,
            onChanged: (value) => rememberMe.value = value ?? false,
            label: "REMEMBER ME",
          ),
        ),
        const SizedBox(height: 32),

        // LOGIN button
        BrutalistButton(
          text: "LOGIN",
          onPressed: () async {
            if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
              auth.showEmptyFieldsError();
              return;
            }

            bool loginSuccess =
                auth.login(txtUsername.text, txtPassword.text);

            if (loginSuccess) {
              await auth.saveCredentials(
                txtUsername.text,
                txtPassword.text,
                rememberMe.value,
              );
            }
          },
        ),
        const SizedBox(height: 16),

        // REGISTER button
        BrutalistButton(
          text: "REGISTER(Only 1 session)",
          onPressed: () => Get.toNamed(AppRoutes.register),
          backgroundColor: Colors.grey[800]!,
        ),
      ],
    );
  }

  @override
  void dispose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.dispose();
  }
}
