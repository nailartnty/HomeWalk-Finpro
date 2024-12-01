import 'package:finpronih/models/recipes_model.dart';
import 'package:flutter/material.dart';

// detailscreen adalah widget statelesswidget karena ui tidak berubah setelah dibuat
class DetailScreen extends StatelessWidget {
  // recipe adalah data yang diterima dari layar sebelumnya
  final Recipe recipe;

  // konstruktor dengan key dan parameter recipe yang wajib diisi
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // ukuran layar untuk penyesuaian ui
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // menampilkan gambar dengan ukuran penuh di bagian atas
            Image.network(
              recipe.image,
              fit: BoxFit.cover,
              height: 450,
              width: size.width,
            ),
            // tombol untuk kembali ke layar sebelumnya
            Padding(
              padding: MediaQuery.of(context).padding,
              child: Positioned(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // tidak memerlukan perubahan state
                  },
                  child: const Icon(Icons.arrow_back_ios),
                ),
              ),
            ),
            // informasi utama tentang resep (nama, tipe makanan, dll.)
            Positioned(
              bottom: -50,
              right: 30,
              left: 30,
              child: Container(
                height: 140,
                width: size.width,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                recipe.mealType[0],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                " & ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                recipe.cuisine,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 35),
                          const Icon(Icons.star, color: Colors.orange),
                          Text(recipe.rating.toString()),
                          const SizedBox(width: 50),
                          const Icon(Icons.timer, color: Colors.blueAccent),
                          Text(recipe.cookTimeMinutes.toString()),
                          const SizedBox(width: 50),
                          const Icon(Icons.accessibility,
                              color: Colors.black),
                          Text(
                              "${recipe.caloriesPerServing.toString()} kcl"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    "ingredients",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            List.generate(recipe.ingredients.length, (index) {
                          return Text(
                            "- ${recipe.ingredients[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          );
                        })),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "instructions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        recipe.instructions.length,
                        (index) {
                          return Text(
                            "- ${recipe.instructions[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
