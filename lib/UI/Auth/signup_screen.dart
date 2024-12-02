import 'package:finpronih/UI/Auth/components/sign_up_form.dart';
import 'package:finpronih/const.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 40,
          bottom: 40
        ),
        child: Column(
          children: [
            // Header with image and text
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/images/register_image.png'), // Ganti dengan path gambar Anda
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  bottom: 10
                ),
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
            ),
            const SizedBox(height: 20),
            Expanded(child: SignUpForm()),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                }, 
                child: const Text(
                  'Already have account? Sign in now',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: secondaryColor
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }
}