// import beberapa file yang dibutuhkan untuk fungsionalitas 
// seperti model resep, layanan api, dan pengelolaan tema
import 'package:finpronih/UI/Wishlist/components/fav_button.dart';
import 'package:finpronih/UI/detail/detail_screen.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:finpronih/models/services.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// mendefinisikan widget bernama recipe card yang bersifat stateful
// widget ini bersifat stateful karena data yang ditampilkan berasal dari api
// dan data tersebut dinamis, artinya bisa berubah ketika data baru dimuat
class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  // variabel untuk menyimpan daftar resep yang diperoleh dari api
  List<Recipe> recipesModel = [];

  // fungsi untuk mengambil data dari api
  // fungsi ini memanggil fungsi recipesItems() dari services
  // lalu hasilnya disimpan ke dalam variabel recipesModel
  myRecipes() {
    recipesItems().then((value) {
      // menggunakan setState untuk memperbarui ui saat data berhasil diambil
      setState(() {
        recipesModel = value;
      });
    });
  }

  @override
  void initState() {
    // initState dipanggil saat widget pertama kali diinisialisasi
    // memanggil fungsi myRecipes untuk mengambil data dari api saat widget dibuat
    myRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // mendapatkan instance theme provider untuk mengatur tema light atau dark
    final themeProvider = Provider.of<ThemeProvider>(context);

    // widget utama menggunakan singlechildscrollview untuk membuat konten dapat di-scroll
    return SingleChildScrollView(
      // gridview.builder digunakan untuk menampilkan data dalam bentuk grid
      child: GridView.builder(
        shrinkWrap: true, // mencegah gridview meluas secara tak terbatas
        itemCount: recipesModel.length, // jumlah item sesuai data yang diperoleh
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // jumlah kolom grid
          mainAxisSpacing: 1, // jarak vertikal antar item
          crossAxisSpacing: 1, // jarak horizontal antar item
          childAspectRatio: 1.20, // perbandingan lebar dan tinggi item
        ),
        // fungsi itemBuilder digunakan untuk membuat setiap item pada grid
        itemBuilder: (context, index) {
          // mendapatkan data resep berdasarkan indeks
          final recipes = recipesModel[index];
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              // gesture detector digunakan untuk menangkap interaksi pengguna
              child: GestureDetector(
                onTap: () {
                  // navigasi ke layar detail saat item diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(recipe: recipes),
                    ),
                  );
                },
                child: Container(
                  // styling untuk kartu resep, seperti warna dan bayangan
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkTheme
                        ? const Color(0xFF303030)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // menampilkan gambar resep
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              // gambar diambil dari api menggunakan url
                              child: Image.network(
                                (recipes.image), // url gambar
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // tombol favorit di pojok kanan atas
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: FavButton(recipe: recipes),
                              ),
                            ),
                          )
                        ],
                      ),
                      // menampilkan detail resep seperti nama, kalori, dan waktu memasak
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              recipes.name, // nama resep
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: themeProvider.isDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                // menampilkan jumlah kalori
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.local_fire_department,
                                      size: 16,
                                      color: Colors.teal,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${recipes.caloriesPerServing} Kcal',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: themeProvider.isDarkTheme
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16),
                                // menampilkan waktu persiapan
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: Colors.teal,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${recipes.prepTimeMinutes} Min',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: themeProvider.isDarkTheme
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
