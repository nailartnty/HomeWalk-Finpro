import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { // digunakan untuk inisialisasi data atau melakukan persiapan awal sebelum widget dirender. 
    super.initState;
    Future.delayed(const Duration(seconds: 2), () { 
      // Fungsi ini membuat sebuah delay (penundaan) selama 2 detik sebelum menjalankan kode di dalam callback-nya.
      // ignore: use_build_context_synchronously -> Potensi masalah context yang dipakai secara asinkron, jika widget dihapus sebelum callback selesai.
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          width: 150,
          height: 150,
        ),
      )
    );
  }
}