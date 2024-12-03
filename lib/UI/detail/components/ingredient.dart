import 'package:finpronih/const.dart';
import 'package:finpronih/state-manegement/theme_provider';
import 'package:flutter/material.dart';
import 'package:finpronih/models/recipes_model.dart';
import 'package:provider/provider.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
        final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ingredient Recipe",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.book,
                color: primaryColor,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Menampilkan setiap ingredient dalam card dengan index
          Column(
            children: List.generate(recipe.ingredients.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkTheme
                        ? const Color(0xFF303030)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: themeProvider.isDarkTheme
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.1),
                        
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Image

                      const SizedBox(width: 10), // Jarak antar gambar dan teks

                      // Teks Ingredient
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ${recipe.ingredients[index]}", // Nama bahan dengan nomor urut
                              style:  TextStyle(
                                color: themeProvider.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "as you need", // Jumlah bahan dengan informasi index
                              style:  TextStyle(
                                color: themeProvider.isDarkTheme
                                ? const Color.fromARGB(255, 132, 215, 221)
                                : primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}