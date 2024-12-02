import 'package:finpronih/UI/onboarding/components/button_onboarding.dart';
import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 40
            ),
          ),
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_onboarding.png'), // Tambahkan gambar background
                fit: BoxFit.cover, // Mengisi seluruh layar
              ),
            ),
          ),
          // Konten di atas background
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  // Teks utama
                  Text(
                    "Food for Everyone",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks
                    )
                  ),
                  Spacer(flex: 2), // Ruang kosong antara gambar dan tombol
                  // Tombol Login
                  Expanded(child: ButtonOnboarding())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}