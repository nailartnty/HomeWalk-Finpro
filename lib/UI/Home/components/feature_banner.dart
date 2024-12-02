import 'package:flutter/material.dart';

// ini widget stateful karena banner bakal berubah otomatis, jadi butuh state
class FeatureBanner extends StatefulWidget {
  const FeatureBanner({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeatureBannerState createState() => _FeatureBannerState();
}

class _FeatureBannerState extends State<FeatureBanner> {
  // bikin controller buat ngatur pageview, initialPage: 0 artinya mulai dari halaman pertama
  final PageController _pageController = PageController(initialPage: 0);

  // variabel ini buat nge-track posisi halaman yang lagi aktif sekarang
  int _currentPage = 0;

  // ini list berisi link gambar yang bakal dipake di banner
  final List<String> _images = [
    "assets/images/Banner_1.png",
    "assets/images/Banner_2.png",
  ];

  @override
  void initState() {
    super.initState();
    // pas widget pertama kali muncul, langsung jalanin fungsi auto-slide
    _autoSlide();
  }

  // ini fungsi buat auto-slide banner tiap 3 detik
  void _autoSlide() {
    // delay 3 detik sebelum ganti banner
    Future.delayed(const Duration(seconds: 3), () {
      // cek apakah pagecontroller masih aktif, artinya widget ini masih ada di layar
      if (_pageController.hasClients) {
        // next page itu halaman berikutnya, dihitung dari currentPage + 1
        _currentPage = (_currentPage + 1) % _images.length;
        // animateToPage bikin animasi pindah ke halaman berikutnya
        _pageController.animateToPage(
          _currentPage, // ke halaman yang dihitung tadi
          duration: const Duration(milliseconds: 500), // animasinya 0.5 detik
          curve: Curves.easeInOut, // gaya animasinya smooth masuk-keluar
        );
        // panggil lagi fungsi auto-slide buat loop terus
        _autoSlide();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ini widget utama yang bakal ditampilkan
    return SizedBox(
      height: 200, // tinggi banner 200 pixel
      child: PageView.builder(
        // kasih controller buat ngatur posisi halaman
        controller: _pageController,
        // jumlah item di pageview sama kayak jumlah gambar di _images
        itemCount: _images.length,
        // itemBuilder ini dipanggil buat bikin widget gambar
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              _images[index],
              fit: BoxFit.cover, // bikin gambar nge-cover seluruh area
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // pas widget dibuang dari layar, kita dispose controller biar gak ada memory leak
    _pageController.dispose();
    super.dispose();
  }
}
