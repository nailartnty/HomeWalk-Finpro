import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

//state atas untuk menyimpen apa yg digunakan oleh super class
//state bawah buat variable variable kecil
class _CategoriesState extends State<Categories> {
  //list itu kurung kotak []
  //kalo map itu kurung kurawal{}
  //kalo ini list, pengembailan nya juga harus list, gabisa langsung dipanggil
  
  List<Map<String, dynamic>> categories = [
    {"icon": Icons.local_drink, "text": "Breakfast"},
    {"icon": Icons.color_lens, "text": "Lunch"},
    {"icon": Icons.card_giftcard, "text": "Dinner"},
    {"icon": Icons.accessibility, "text": "Snack"},
  ];
  int selectedIndex = 0; //buat ngasi tau perubahan indexnya

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);


    //Ini buat bikin daftar kategori yang bisa di-scroll dan kasih jarak vertikal
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and view all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: () {},  //ini masi dummy
                child: Text(
                  "view all",
                  style: TextStyle(
                    color: themeProvider.isDarkTheme ? Colors.indigo.shade200 : const Color(0xFF236A91),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Memberikan sedikit jarak

          // Horizontal list of categories with icons
          SizedBox(
            height: 65, // Atur tinggi untuk ikon dan teks
            child: ListView.builder( //membuat list yang bisa di-scroll secara horizontal
              scrollDirection: Axis.horizontal, //mengatur arah scroll menjadi horizontal
              itemCount: categories.length,
              //item builder itu buat membangun atau menampung data (apapun yang akan tampil di layar)
              itemBuilder: (context, index) => _buildCategory(index),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildCategory(int index) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return GestureDetector( //untuk mendeteksi gesture dari apa saja kayak ketuk atau geser atau longpress
      //Ini buat ngubah kategori yang dipilih pas diklik (inisialisasi)
      onTap: () {
        setState(() {
          selectedIndex = index; 
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:  EdgeInsets.all(10), // Mengurangi padding agar lebih kecil
              decoration: BoxDecoration(
                color:  themeProvider.isDarkTheme
                ? (selectedIndex == index ? Colors.blue.shade50 : const Color(0xFF303030))
                : (selectedIndex == index ? Colors.indigo.withOpacity(0.1) : Colors.white),
                shape: BoxShape.circle,
              ),
              child: Icon(
                categories[index]["icon"],
                color: themeProvider.isDarkTheme
                    ? (selectedIndex == index ? Colors.indigo.shade400 : Colors.indigo.shade200)
                    : (selectedIndex == index ? Colors.indigo : Colors.indigo.shade200),                size: 20,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              categories[index]["text"],
              style: TextStyle(
                color: themeProvider.isDarkTheme
                    ? (selectedIndex == index ? Colors.indigo.shade400 : Colors.indigo.shade200)
                    : (selectedIndex == index ? Colors.indigo : Colors.indigo.shade200),                 fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                fontSize: 12
              ),
            ),
          ],
        ),
      ),
    );
  }
}