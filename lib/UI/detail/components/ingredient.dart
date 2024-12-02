import 'package:flutter/material.dart';
import 'package:finpronih/models/recipes_model.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
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
                color: Colors.blue,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      // Image
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/dummy_photo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(width: 10), // Jarak antar gambar dan teks

                      // Teks Ingredient
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}. ${recipe.ingredients[index]}", // Nama bahan dengan nomor urut
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Jumlah sesuai kebutuhan (${index + 1} dari ${recipe.ingredients.length})", // Jumlah bahan dengan informasi index
                              style: const TextStyle(
                                color: Colors.blue,
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