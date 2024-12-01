import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // import package untuk bikin navigation bar yang melengkung
import 'package:finpronih/UI/Home/catalogue_screen.dart';
import 'package:flutter/material.dart'; // import package utama flutter


// ini adalah widget utama untuk halaman home dengan navbar
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // constructor untuk widget

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // buat state dari widget
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // variable untuk simpan index halaman yang aktif di navbar

  // daftar halaman yang akan ditampilkan sesuai pilihan di navbar
  final List<Widget> _pages = [
    const CatalogueScreen(), 
    const CatalogueScreen(), 
    const CatalogueScreen(), 
    const CatalogueScreen(), 
    const CatalogueScreen(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // bagian body menampilkan halaman sesuai index yang dipilih
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white, // warna background layar
        color: Colors.indigo, // warna dari navbar
        animationDuration: const Duration(milliseconds: 500), // animasi transisi antar item di navbar
        items: const [
          Icon(Icons.home, color: Colors.white), // icon untuk QR Scanner
          Icon(Icons.qr_code, color: Colors.white), // icon untuk QR Generator
          Icon(Icons.qr_code, color: Colors.white), // icon untuk QR Generator
          Icon(Icons.qr_code, color: Colors.white), // icon untuk QR Generator
          Icon(Icons.person, color: Colors.white), // icon untuk QR Generator
        ],
        onTap: (index) {
          // ini fungsi yang dipanggil pas item di navbar ditekan
          setState(() {
            _selectedIndex = index; // ubah index halaman aktif sesuai pilihan
          });
        },
      ),
    );
  }
}
