import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

class ButtonOnboarding extends StatelessWidget {
  const ButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {Navigator.pushNamed(context, "/signin");
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: secondaryColor, // Warna hitam kebiruan
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Membuat tombol rounded
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text(
            'SIGN IN',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Warna teks
            )
          ),
        ),
        const SizedBox(height: 10), // Jarak antara tombol

        // Tombol Sign Up
        OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, "signup");
          },
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity,50),
            side: const BorderSide(
              color: secondaryColor, 
              width: 2
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: const Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: secondaryColor, // Warna teks
            )
          ),
        ),
      ],
    );
  }
}