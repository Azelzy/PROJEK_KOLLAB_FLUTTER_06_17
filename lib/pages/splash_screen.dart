import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project_17_6/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            final titleFontSize = isMobile ? 28.0 : 36.0;
            final subtitleFontSize = isMobile ? 12.0 : 14.0;
            final loadingSize = isMobile ? 45.0 : 65.0;
            final verticalSpace = isMobile ? 32.0 : 48.0;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: verticalSpace),

                    // 🔸 Title
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black, width: 3),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(4, 4),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        "こんにちは!",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🔸 Subtitle
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(4, 4),
                            blurRadius: 0,
                          ),
                        ],
                      ),
                      child: Text(
                        "PROJEKT 6_17",
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[700],
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),

                    SizedBox(height: verticalSpace + 12),

                    // 🔸 Loading Animation
                    LoadingAnimationWidget.threeArchedCircle(
                      color: const Color.fromARGB(255, 143, 143, 143),
                      size: loadingSize,
                    ),

                    const SizedBox(height: 16),

                    // 🔸 Status dari controller
                    Obx(() => Text(
                          controller.statusText.value,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey[600],
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
