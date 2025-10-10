import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';

class ProfileIhsanPage extends StatelessWidget {
  const ProfileIhsanPage({super.key});

  Widget _buildInfoBox(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 3),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PROFILE - IHSAN"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4, 4),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Image.network(
                  "https://yt3.googleusercontent.com/ytc/AIdro_nugqGzCgoJ4yJH_GvzHthV66mx3quWJ8niMGBF03wOcA=s160-c-k-c0x00ffffff-no-rj",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildInfoBox("NAMA", "IHSAN H.U"),
            const SizedBox(height: 16),
            _buildInfoBox("ABSEN", "17"),
            const SizedBox(height: 16),
            _buildInfoBox("KELAS", "XI PPLG 1"),
            const SizedBox(height: 16),
            _buildInfoBox("GITHUB", "https://github.com/IhsanHU-coder"),
            const SizedBox(height: 32),
            BrutalistButton(
              text: "VISIT GITHUB",
              onPressed: () async {
                final url = Uri.parse("https://github.com/IhsanHU-coder");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
