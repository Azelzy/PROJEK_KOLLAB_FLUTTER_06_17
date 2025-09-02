import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/auth_controller.dart';
import 'package:project_17_6/Routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://yt3.googleusercontent.com/ytc/AIdro_nugqGzCgoJ4yJH_GvzHthV66mx3quWJ8niMGBF03wOcA=s160-c-k-c0x00ffffff-no-rj",
              ),
            ),
            const SizedBox(height: 20),
            const Text("Ihsan", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Absen: 17", style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                auth.logout();
                Get.offAllNamed(AppRoutes.login);
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
