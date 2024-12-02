import 'package:finpronih/UI/Auth/components/or_line.dart';
import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

class SosialMedia extends StatelessWidget {
  const SosialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              SizedBox(height: 20),
              Expanded(child: OrLine()),
              SizedBox(height: 20),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/images/Google.png'),
              height: 16,
              width: 16,
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(45, 45), // Lebar tombol
              side: const BorderSide(
                color: primaryColor, 
                width: 2
              ), // Warna border tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 5),
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/images/Gmail.png'),
              height: 16,
              width: 16,
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(45, 45), // Lebar tombol
              side: const BorderSide(
                color: primaryColor, 
                width: 2
              ), // Warna border tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 5),
          IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage('assets/images/Facebook.png'),
              height: 16,
              width: 16,
            ),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(45, 45), // Lebar tombol
              side: const BorderSide(
                color: primaryColor, 
                width: 2
              ), // Warna border tombol
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}