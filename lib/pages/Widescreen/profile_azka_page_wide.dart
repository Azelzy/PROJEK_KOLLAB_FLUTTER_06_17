import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';

class ProfileAzkaPageWide extends StatelessWidget {
  const ProfileAzkaPageWide({super.key});

  Widget _buildInfoBox(String label, String value) {
    return Container(
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
          const SizedBox(height: 2),
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
        title: const Text("PROFILE - AZKA"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto profil
                Container(
                  width: 160,
                  height: 160,
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
                    "https://avatars.githubusercontent.com/u/107330423?v=4",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),

                // Grid 2 kolom
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 4,
                  children: [
                    _buildInfoBox("NAMA", "AZKA EL FACHRIZY"),
                    _buildInfoBox("ABSEN", "06"),
                    _buildInfoBox("KELAS", "XI PPLG 1"),
                    _buildInfoBox("GITHUB", "https://github.com/Azelzy"),
                  ],
                ),

                const SizedBox(height: 32),
                BrutalistButton(
                  text: "VISIT GITHUB",
                  onPressed: () async {
                    final url = Uri.parse("https://github.com/Azelzy");
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
